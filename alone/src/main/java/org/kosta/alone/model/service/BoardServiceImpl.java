package org.kosta.alone.model.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.alone.model.dao.BoardDAO;
import org.kosta.alone.model.dao.IntroduceDAO;
import org.kosta.alone.model.dao.MeetingDAO;
import org.kosta.alone.model.dao.ReviewDAO;
import org.kosta.alone.model.vo.BoardVO;
import org.kosta.alone.model.vo.CommentVO;
import org.kosta.alone.model.vo.ImageVO;
import org.kosta.alone.model.vo.IntroduceCategoryVO;
import org.kosta.alone.model.vo.IntroduceVO;
import org.kosta.alone.model.vo.KeyWordVO;
import org.kosta.alone.model.vo.ListVO;
import org.kosta.alone.model.vo.MeetingVO;
import org.kosta.alone.model.vo.MemberVO;
import org.kosta.alone.model.vo.PagingBean;
import org.kosta.alone.model.vo.ReviewVO;
import org.kosta.alone.model.vo.UploadFileVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

@Service
public class BoardServiceImpl implements BoardService {
	@Resource
	private MeetingDAO meetingDAO;
	@Resource
	private IntroduceDAO introduceDAO;
	@Resource
	private ReviewDAO reviewDAO;
	@Resource
	private BoardDAO boardDAO;

	@Override
	public List<MeetingVO> getMeetingRegionList(String region) {
		return meetingDAO.getMeetingRegionList(region);
	}

	@Override
	public List<MeetingVO> getRegionInfo() {
		return meetingDAO.getRegionInfo();
	}

	@Override
	public ListVO<ReviewVO> reviewList(String nowPage) {
		int totalCount = reviewDAO.getTotalContentCount();
		PagingBean pagingBean = null;
		if (nowPage == null) {
			pagingBean = new PagingBean(totalCount);
		} else {
			pagingBean = new PagingBean(totalCount, Integer.parseInt(nowPage));
		}
		pagingBean.setContentNumberPerPage(10);
		pagingBean.setPageNumberPerPageGroup(5);
		List<ReviewVO> list = reviewDAO.reviewList(pagingBean);
		ListVO<ReviewVO> listVO = new ListVO<ReviewVO>(list, pagingBean);
		return listVO;
	}

	/**
	 * 소개글 리스트 
	 * 1)카테고리에 해당하는 게시물 리스트를 뽑는다 :introduceList 
	 * 2)첫번째 소개글에 게시물 번호를 얻어와
	 * 해당 게시물에 키워드가 몇개 등록되었는지 확인 한다 :keyWordSize 
	 * 3) 게시물이 가지고있는 키워드의 이름을 뽀는다
	 * introduceList.get(i).getBoardNo()게시물 번호
	 */
	@Override
	public ListVO<IntroduceVO> introduceList(int categoryNo, String nowPage) {
		ImageVO mainImage = null;
		List<KeyWordVO> keyWordVO = null;
		int totalCount = introduceDAO.getTotalContentCount(categoryNo);
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (nowPage == null) {
			PagingBean pagingBean = new PagingBean(totalCount);
			pagingBean.introduceListSetPaging();

			map.put("categoryNo", categoryNo);
			map.put("pagingBean", pagingBean);
			map.get("categoryNo");
			List<IntroduceVO> list = introduceDAO.introduceList(map);

			for (int i = 0; i < list.size(); i++) {
				keyWordVO = introduceDAO.keyWordList(list.get(i).getBoardNo());
				list.get(i).setKeyWordVO(keyWordVO);
				mainImage = boardDAO.introduceFirstImage(list.get(i).getBoardNo());
				list.get(i).setMainImage(mainImage);
			
			}
			ListVO<IntroduceVO> vo = new ListVO<IntroduceVO>(list, pagingBean);
			return vo;
		} else {
			PagingBean pagingBean = new PagingBean(totalCount, Integer.parseInt(nowPage));
			pagingBean.introduceListSetPaging();
	
			map.put("categoryNo", categoryNo);
			map.put("pagingBean", pagingBean);
			map.get("categoryNo");
			List<IntroduceVO> list = introduceDAO.introduceList(map);

			for (int i = 0; i < list.size(); i++) {
				keyWordVO = introduceDAO.keyWordList(list.get(i).getBoardNo());
				list.get(i).setKeyWordVO(keyWordVO);
				mainImage = boardDAO.introduceFirstImage(list.get(i).getBoardNo());
				list.get(i).setMainImage(mainImage);
			}
			ListVO<IntroduceVO> vo = new ListVO<IntroduceVO>(list, pagingBean);
			return vo;
		}
	}

	// 소개글 카테고리 리스트
	@Override
	public List<IntroduceCategoryVO> introduceCategoryList() {
		return introduceDAO.introduceCategoryList();
	}

	/**
	 * 소개글 작성
	 */
	@Transactional
	@Override
	public void introduceWrite(IntroduceVO introduceVO, UploadFileVO vo ,HttpServletRequest request) {
		// 테이블 기존 정보 쓰기
		introduceDAO.boardWrite(introduceVO);
		// 테이블 상세정보쓰기
		introduceDAO.introduceWrite(introduceVO);
		// 기업회원 글한번 쓴 상태로 변경
		introduceDAO.updateWrite(introduceVO.getMemberVO().getId());
		// 이미지 업로드& 이미지 데이터 저장

		//이미지 정보가 모두 비어있지않다면 update
		 if(vo.getFile()!=null&& vo.getMainFile()!=null )
		imageUpload(introduceVO, vo, request);

       
        //데이터 베이스에 키워드 저장
        if(introduceVO.getKeyword()!=null)
		keywordRegister(introduceVO, introduceVO.getKeyword());
	}

	public void keywordRegister(IntroduceVO introduceVO,String keyword) {
	
		if(keyword!=null){
		KeyWordVO keywordVO=null;
	    String[] array;
	    array=keyword.split("#");
	    
	    for (int i = 1; i < array.length; i++) {
			
			keywordVO = new KeyWordVO();
			keywordVO.setBoardNo(introduceVO.getBoardNo());
			keywordVO.setKeyWordName(array[i]);
			introduceDAO.keywordRegister(keywordVO);
		}

		}
	}
	
	/**
	 * 키워드 수정
	 * @param introduceVO
	 * @param keyword
	 */
	public void keywordUpdate(IntroduceVO introduceVO,String keyword) {

		if(keyword!=null){
	   List<KeyWordVO> list =introduceVO.getKeyWordVO();
	   KeyWordVO keywordVO=null;

	    String[] array;
	    array=keyword.split("#");
	    
	    for (int i = 1; i < array.length; i++) {
		//기존 키워드 업데이트
		if(i<=list.size())
		{	
			list.get(i-1).setKeyWordName(array[i]);
			introduceDAO.keywordUpdate(list.get(i-1));

		}
		//그외 새로 추가
		else {
			keywordVO = new KeyWordVO();
			keywordVO.setBoardNo(introduceVO.getBoardNo());
			keywordVO.setKeyWordName(array[i]);
			introduceDAO.keywordRegister(keywordVO);
	
			
		}
	   }
	}
 }
	

	/**
	 * 소개글 수정
	 */
	@Override
	public void introduceUpdate(IntroduceVO introduceVO, UploadFileVO vo, HttpServletRequest request) {
		// 테이블 기존 정보 쓰기
		//System.out.println(introduceVO);
		List<KeyWordVO> keyWordVO=null;
		
		
		//content가 비어있지 않다면 update
       if(!introduceVO.getContent().equals("") ){
    	        introduceDAO.boardUpdate(introduceVO);
            // System.out.println("boardUpdate");
       }
		// 테이블 상세정보들이 모두 비어있지 않다면 update
		if( !(introduceVO.getCompanyName().equals("") && introduceVO.getRegion().equals("")&& 
				introduceVO.getLocation().equals("") && introduceVO.getBusinessHours().equals("")
				&& introduceVO.getTel().equals("") && introduceVO.getKeyword().equals("") && 
				introduceVO.getCategoryVO().equals("")
				
				) 
			){
		   introduceDAO.introduceUpdate(introduceVO);
		   // System.out.println("introduceUpdate");
		}

   
		//이미지 정보가 모두 비어있지않다면 update
        if(vo.getFile()!=null&& vo.getMainFile()!=null ){
       //System.out.println("이미지 정보안비어있음");
		imageUpload(introduceVO, vo, request);
        }
        //키워드가 null이 아니라면 
        if(introduceVO.getKeyword()!=null)
        {
        	
        	//기존 게시물에 저장되어있는 키워드 정보를 가져와 세팅해준다음에 keywordUpdate 해준다
            keyWordVO = introduceDAO.keyWordList(introduceVO.getBoardNo());
            introduceVO.setKeyWordVO(keyWordVO);
        	keywordUpdate(introduceVO, introduceVO.getKeyword());
        	
        }
        
        
	}
 

	
	@Override
	public String deleteImage(String deleteFileName, HttpServletRequest request) {
		// 파일 경로 얻어오기
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload/");
		File file = new File(uploadPath + deleteFileName);

		// 파일이 존재하면 삭제하고 ok리턴
		if (file.exists()) {
			// 서버에서 파일삭제
			file.delete();
			// DB에서 파일삭제
			boardDAO.imageDelete(deleteFileName);
			return "ok";
		} else// 파일이 존재하지 않으면
			return "fail";

	}

	@Transactional
	public void imageUpload(BoardVO boardVO, UploadFileVO vo, HttpServletRequest request) {
		MultipartFile mainFile = vo.getMainFile(); // 메인 파일을 가져온다
		List<MultipartFile> list = vo.getFile(); // 그외 파일을 가져온다
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload/");
		// 파일 디렉토리 생성
		System.out.println("서비스 진입 " + vo );
		File uploadDir = new File(uploadPath);
		if (uploadDir.exists() == false)
			uploadDir.mkdirs();
		// 메인 파일 업로드
		if (mainFile != null) {
			//서버 파일이름
			String mainFileName=null;
			//원래 파일이름
			String originalFileName=   mainFile.getOriginalFilename();

			mainFileName = "main_" + boardVO.getBoardNo() + originalFileName;
			try {
				mainFile.transferTo(new File(uploadPath + mainFileName));
				ImageVO imageVO = new ImageVO(0, mainFileName,originalFileName,boardVO.getBoardNo());
				boardDAO.imageUpload(imageVO);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		// 그외 파일 업로드
		if(list!=null){
		for (int i = 0; i < list.size(); i++) {
			// 만약 업로드 파일이 없으면 파일명은 공란처리된다
			//서버 파일이름
			String fileName=null;
			//원래 파일이름
			String originalFileName=   list.get(i).getOriginalFilename();
			// 파일이름을 유일하게 해준다
			fileName = boardVO.getBoardNo() + "_" + i + originalFileName;
			// 업로드 파일이 있으면 파일을 특정경로로 업로드한다
			if (!fileName.equals("")) {
				try {
					list.get(i).transferTo(new File(uploadPath + fileName));
					//데이터베이스에 파일 저장
					ImageVO imageVO = new ImageVO(0, fileName,originalFileName,boardVO.getBoardNo());
					boardDAO.imageUpload(imageVO);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		}
	}

	@Override
	@Transactional
	public IntroduceVO introduceDetail(int boardNo) {
		List<ImageVO> imageList = null;
		ImageVO mainImage= null;
		List<KeyWordVO> keyWordList = null;
		// boardNo에 해당하는 게시물 기본정보를 가져옴
		IntroduceVO introduceVO = introduceDAO.introduceDetail(boardNo);
		// 해당 게시물의 키워드 정보를 가져와서 세팅
		keyWordList = introduceDAO.keyWordList(boardNo);
		introduceVO.setKeyWordVO(keyWordList);
		//keword도 세팅
		String keywordSet="";
		for(int i=0;i<keyWordList.size();i++){
			keywordSet+="#"+keyWordList.get(i).getKeyWordName();
		}
		introduceVO.setKeyword(keywordSet);
		//메인 이미지 저장
		mainImage = boardDAO.introduceFirstImage(boardNo);
		introduceVO.setMainImage(mainImage);
		//이미지 상세 저장
		imageList = boardDAO.imageList(boardNo);
		introduceVO.setImageVO(imageList);
		// 완벽히 저장된 상세정보를 리턴한다!!!
		return introduceVO;
	}
	
	/**
	 * 게시글 삭제
	 * 해당 boardNo가 없으면 삭제안되므로 예외처리 필요없음
	 */
	@Transactional
	@Override
	public void introduceDelete(IntroduceVO introduceVO,HttpServletRequest request) {
		List<ImageVO> list =null;
		 list=boardDAO.imageAllList(introduceVO.getBoardNo());
		if(list!=null)
		{
			for(int i=0; i<list.size();i++)
			deleteImage(list.get(i).getImageName(),request);
		}
		introduceDAO.keywordDeleteByBoardNo(introduceVO.getBoardNo());
		introduceDAO.introduceDeleteByBoardNo(introduceVO.getBoardNo());
		boardDAO.boardDeleteByBoardNo(introduceVO.getBoardNo());
		// 기업회원 글한번 쓴 상태로 변경
		introduceDAO.updateWriteBack(introduceVO.getMemberVO().getId());
	}
	
	@Transactional
	@Override
	public void reviewWrite(ReviewVO reviewVO) {
		reviewDAO.reviewBoardWrite(reviewVO);
		reviewDAO.reviewWrite(reviewVO);
	}

	/**
	 * 모임글 작성
	 */
	@Transactional
	@Override
	public void meetingWrite(HttpServletRequest request, MeetingVO meetingVO, UploadFileVO uploadFileVO) {
		meetingDAO.boardWrite(meetingVO);
		meetingDAO.meetingWrite(meetingVO);
		imageUpload(meetingVO, uploadFileVO, request);
	}

	/**
	 * 모임글 상세보기
	 */
	@Override
	@Transactional
	public MeetingVO meetingDetail(int boardNo) {
		meetingDAO.updateHit(boardNo);
		MeetingVO meetingVO = null;
		meetingVO = meetingDAO.meetingDetail(boardNo);
		List<ImageVO> imageList = null;
		imageList = boardDAO.imageList(boardNo);
		if (!imageList.isEmpty()) {
			meetingVO.setImageVO(imageList);
		}
		return meetingVO;
	}

	public List<CommentVO> commentList(int boardNo) {
		return boardDAO.commentList(boardNo);
	}

	public void insertComment(MemberVO memberVO, String comment, int boardNo) {
		CommentVO commentVO = new CommentVO();
		commentVO.setMemberVO(memberVO);
		commentVO.setContent(comment);
		commentVO.setBoardNo(boardNo);
		boardDAO.insertComment(commentVO);
	}

	@Override
	public void updateComment(CommentVO commentVO) {
		boardDAO.updateComment(commentVO);
	}

	public void deleteComment(CommentVO commentVO) {
		boardDAO.deleteComment(commentVO);
	}

	public ReviewVO reviewDetail(int boardNo) {
		reviewDAO.updateHit(boardNo);
		return reviewDAO.reviewDetail(boardNo);
	}

	/**
	 * 모임 게시글 리스트
	 */
	@Override
	public ListVO<MeetingVO> meetingList(String pageNo) {
		int totalCount = meetingDAO.getTotalContentCount();
		PagingBean pagingBean = null;
		if (pageNo == null) {
			pagingBean = new PagingBean(totalCount);
		} else {
			pagingBean = new PagingBean(totalCount, Integer.parseInt(pageNo));
		}
		pagingBean.setContentNumberPerPage(10);
		pagingBean.setPageNumberPerPageGroup(5);
		List<MeetingVO> list = meetingDAO.meetingList(pagingBean);
		ListVO<MeetingVO> listVO = new ListVO<MeetingVO>(list, pagingBean);
		return listVO;
	}

	@Override
	public ListVO<ReviewVO> reviewSerachList(String pageNo, String searchKeyWord, String command) {
		int totalCount = 0;
		PagingBean pagingBean = null;
		Map<String, Object> map = null;
		List<ReviewVO> list = null;
		ListVO<ReviewVO> vo = null;

		if (command.equals("findByTitle"))
			totalCount = reviewDAO.getTitleSearchContentCount(searchKeyWord);
		else
			totalCount = reviewDAO.getWriterSearchCount(searchKeyWord);

		if (pageNo == null)
			pagingBean = new PagingBean(totalCount);
		else
			pagingBean = new PagingBean(totalCount, Integer.parseInt(pageNo));

		pagingBean.setContentNumberPerPage(10);
		pagingBean.setPageNumberPerPageGroup(5);
		map = new HashMap<String, Object>();
		map.put("keyword", searchKeyWord);
		map.put("pb", pagingBean);
		if (command.equals("findByTitle"))
			list = reviewDAO.reviewTitleSearchList(map);
		else
			list = reviewDAO.reviewWriterSearchList(map);

		vo = new ListVO<>(list, pagingBean);
		return vo;
	}

	@Override
	public ReviewVO reviewNotHitDetail(int boardNo) {
		return reviewDAO.reviewDetail(boardNo);
	}

	@Override
	public MeetingVO meetingNoHitDetail(int boardNo) {
		MeetingVO meetingVO = meetingDAO.meetingDetail(boardNo);
		meetingVO.setImageVO(boardDAO.imageList(boardNo));
		return meetingVO;
	}

	@Transactional
	public void reviewUPdate(ReviewVO reviewVO) {
		boardDAO.reviewBoardUpdate(reviewVO);
		reviewDAO.reviewUpdate(reviewVO);
	}

	@Override
	@Transactional
	public IntroduceVO showCompanyBoard(String id) {
		int boardNo = introduceDAO.findIntroduceById(id);
		return introduceDetail(boardNo);
	}

	@Transactional
	public void meetingUpdate(HttpServletRequest request, MeetingVO meetingVO, UploadFileVO uploadFileVO) {
		boardDAO.meetingboardUpdate(meetingVO);
		meetingDAO.meetingUpdate(meetingVO);
		// mageUpload(request, meetingVO, uploadFileVO);
	}

	/**
	 * 소개글 검색 후 리스트 출력
	 */
	@Override
	public ListVO<MeetingVO> meetingSearchList(String pageNo, String searchKeyWord, String command) {
		int totalCount = 0;
		PagingBean pagingBean = null;
		Map<String, Object> map = null;
		List<MeetingVO> list = null;
		ListVO<MeetingVO> listVO = null;
		if (command.equals("findByTitle"))
			totalCount = meetingDAO.getTitleSearchCount(searchKeyWord);
		else
			totalCount = meetingDAO.getWriterSearchCount(searchKeyWord);

		if (pageNo == null)
			pagingBean = new PagingBean(totalCount);
		else
			pagingBean = new PagingBean(totalCount, Integer.parseInt(pageNo));

		pagingBean.setContentNumberPerPage(10);
		pagingBean.setPageNumberPerPageGroup(5);
		map = new HashMap<String, Object>();
		map.put("keyWord", searchKeyWord);
		map.put("pb", pagingBean);
		if (command.equals("findByTitle"))
			list = meetingDAO.meetingTitleSearchList(map);
		else
			list = meetingDAO.meetingWriterSearchList(map);
		listVO = new ListVO<>(list, pagingBean);
		return listVO;
	}

	@Override
	public void boardDelete(int boardNo) {
		boardDAO.boardDelete(boardNo);
	}

	@Transactional
	public int reviewLikeUp(BoardVO bvo) {
		BoardVO vo = boardDAO.likeCheckInfo(bvo);
		if (vo == null) {
			boardDAO.insertLikeCheck(bvo);
			boardDAO.likeCheckUp(bvo);
			reviewDAO.likeUp(bvo);
			HashMap<String,Object>  map=new HashMap<>();
			map.put("dealcontent", "게시물 번호 : "+bvo.getBoardNo()+" 좋아요 클릭");
			map.put("id",bvo.getMemberVO().getId());
			System.out.println(map.get("dealcontent")+"ddd");
			reviewDAO.mileageInsert(map);
			reviewDAO.mileageUpdate(map);
		} else if (vo != null && vo.getLikeCheck() == 1) {
			return 	reviewDAO.likeCheckNumber(bvo);
		}
		
		return 	reviewDAO.likeCheckNumber(bvo);
	}

	@Override
	public List<IntroduceVO> rankingIntroduceList() {
		List<ImageVO> imageList = new ArrayList<ImageVO>();
		List<KeyWordVO> keyWordVO = null;
		ImageVO imageVO=null;
		List<IntroduceVO> list =introduceDAO.rankingIntroduceList();
		for (int i = 0; i < list.size(); i++) {
			keyWordVO = introduceDAO.keyWordList(list.get(i).getBoardNo());
			System.out.println(list);
			list.get(i).setKeyWordVO(keyWordVO);
			imageVO =boardDAO.introduceFirstImage(list.get(i).getBoardNo());
			if(imageVO==null){
				return list;
			}
			imageList.add(imageVO);
			list.get(i).setImageVO(imageList);
		}
		
		return list;
	}

	@Transactional
	@Override
	public int introduceLikeUp(BoardVO bvo) {
		BoardVO vo = boardDAO.likeCheckInfo(bvo);
		if (vo == null) {
			boardDAO.insertLikeCheck(bvo);
			boardDAO.likeCheckUp(bvo);
			introduceDAO.likeUp(bvo);
		}else if(vo != null &&vo.getLikeCheck()==1){
			return introduceDAO.likeCheckNumber(bvo);
		}
		return introduceDAO.likeCheckNumber(bvo);
	}
}
