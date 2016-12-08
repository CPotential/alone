package org.kosta.alone.model.service;

import java.io.File;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.transaction.annotation.Transactional;

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
	public List<MeetingVO> findNameMeetingList(String search) {
		return meetingDAO.findNameMeetingList(search);
	}

	@Override
	public List<MeetingVO> findTitleMeetingList(String search) {
		return meetingDAO.findTitleMeetingList(search);
	}

	@Override
	public List<MeetingVO> getRegionInfo() {
		return meetingDAO.getRegionInfo();
	}

	@Override
	public ListVO<ReviewVO> reviewList(String nowPage) {
		int totalCount = reviewDAO.getTotalContentCount();
		PagingBean pagingBean =null;
		if (nowPage == null) {
		 pagingBean = new PagingBean(totalCount);
		} else {
		pagingBean = new PagingBean(totalCount, Integer.parseInt(nowPage));
		}
		pagingBean.setContentNumberPerPage(10);
		pagingBean.setPageNumberPerPageGroup(5);
		List<ReviewVO> list = reviewDAO.reviewList(pagingBean);
		ListVO<ReviewVO> vo = new ListVO<ReviewVO>(list, pagingBean);
		return vo;
	}

	// 소개글 리스트
	/**
	 * 1)카테고리에 해당하는 게시물 리스트를 뽑는다 :introduceList 2)첫번째 소개글에 게시물 번호를 얻어와 해당 게시물에
	 * 키워드가 몇개 등록되었는지 확인 한다 :keyWordSize 3) 게시물이 가지고있는 키워드의 이름을 뽀는다
	 * introduceList.get(i).getBoardNo()게시물 번호
	 */
	@Override
	public ListVO<IntroduceVO> introduceList(int categoryNo, String nowPage) {
		List<ImageVO> imageList = null;
		List<KeyWordVO> keyWordVO = null;
		int totalCount = introduceDAO.getTotalContentCount(categoryNo);
		HashMap<String, Object> map = new HashMap<String, Object>();

		if (nowPage == null) {
			PagingBean pagingBean = new PagingBean(totalCount);
			pagingBean.setContentNumberPerPage(6);
			pagingBean.setPageNumberPerPageGroup(4);
			map.put("categoryNo", categoryNo);
			map.put("pagingBean", pagingBean);
			map.get("categoryNo");
			List<IntroduceVO> list = introduceDAO.introduceList(map);

			for (int i = 0; i < list.size(); i++) {

				keyWordVO = introduceDAO.keyWordList(list.get(i).getBoardNo());
				list.get(i).setKeyWordVO(keyWordVO);
				imageList = boardDAO.introduceFirstImage(list.get(i).getBoardNo());
				list.get(i).setImageVO(imageList);
			}
			ListVO<IntroduceVO> vo = new ListVO<IntroduceVO>(list, pagingBean);
			return vo;
		} else {
			PagingBean pagingBean = new PagingBean(totalCount, Integer.parseInt(nowPage));
			pagingBean.setContentNumberPerPage(6);
			pagingBean.setPageNumberPerPageGroup(4);
			map.put("categoryNo", categoryNo);
			map.put("pagingBean", pagingBean);
			map.get("categoryNo");
			List<IntroduceVO> list = introduceDAO.introduceList(map);

			for (int i = 0; i < list.size(); i++) {

				keyWordVO = introduceDAO.keyWordList(list.get(i).getBoardNo());
				list.get(i).setKeyWordVO(keyWordVO);
				imageList = boardDAO.introduceFirstImage(list.get(i).getBoardNo());
				list.get(i).setImageVO(imageList);
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
	@Override

	public void introduceWrite(IntroduceVO introduceVO, UploadFileVO vo, HttpServletRequest request) {
		// 테이블 기존 정보 쓰기
		introduceDAO.boardWrite(introduceVO);
		// 테이블 상세정보쓰기
		introduceDAO.introduceWrite(introduceVO);
		// 기업회원 글한번 쓴 상태로 변경
		introduceDAO.updateWrite(introduceVO.getMemberVO().getId());
		// 이미지 업로드& 이미지 데이터 저장
		imageUpload(introduceVO, vo, request);

		// 키워드 데이터 저장
		keywordRegister(introduceVO);

	}

	public void keywordRegister(IntroduceVO introduceVO) {
		List<KeyWordVO> list = introduceVO.getKeyWordVO();
		for (int i = 0; i < list.size(); i++) {

			list.get(i).setBoardNo(introduceVO.getBoardNo());
			introduceDAO.keywordRegister(list.get(i));

		}

	}
	/**
	 * 소개글 수정
	 */
	@Override

	public void introduceUpdate(IntroduceVO introduceVO,UploadFileVO vo,HttpServletRequest request) {
		// 테이블 기존 정보 쓰기
		introduceDAO.boardUpdate(introduceVO);
		// 테이블 상세정보쓰기
		introduceDAO.introduceUpdate(introduceVO);
	

		imageUpload(introduceVO, vo, request);

	/*	// 키워드 데이터 저장
		keywordRegister(introduceVO);*/

	}
	
	@Override
	public String deleteImage(String deleteFileName,HttpServletRequest request) {
		//System.out.println("fileDelete 실행  :"+deleteFileName);
				//파일 경로 얻어오기
				String uploadPath=request.getSession().getServletContext().getRealPath("/resources/upload/");
		        File file = new File(uploadPath+deleteFileName);
		
		        //파일이 존재하면 삭제하고 ok리턴
		        if(file.exists()){
		        	//서버에서 파일삭제 
		            file.delete();
		            //DB에서 파일삭제
		        	boardDAO.imageDelete(deleteFileName);
		            return "ok";
		        }
		        else//파일이 존재하지 않으면 
		            return "fail";

		
	}
	


	public void imageUpload(BoardVO boardVO, UploadFileVO vo, HttpServletRequest request) {

		MultipartFile mainFile = vo.getMainFile(); // 메인 파일을 가져온다
		List<MultipartFile> list = vo.getFile(); // 그외 파일을 가져온다

		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload/");

		// 파일 디렉토리 생성
		File uploadDir = new File(uploadPath);
		if (uploadDir.exists() == false)
			uploadDir.mkdirs();
		
		
		
		// 메인 파일 업로드
	   if(mainFile!=null){
		
		String mainFileName = mainFile.getOriginalFilename();
		mainFileName = "main_" + boardVO.getBoardNo() + mainFileName;
		try {
			mainFile.transferTo(new File(uploadPath + mainFileName));
			// System.out.println(mainFileName+" 업로드 완료");
			ImageVO imageVO = new ImageVO(0, mainFileName, boardVO.getBoardNo());
			// System.out.println("imageVO: "+imageVO);
			boardDAO.imageUpload(imageVO);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	   }
		// 그외 파일 업로드
		for (int i = 0; i < list.size(); i++) {
			// 만약 업로드 파일이 없으면 파일명은 공란처리된다
			String fileName = list.get(i).getOriginalFilename();

			// 파일이름을 유일하게 해준다
			fileName = boardVO.getBoardNo() + "_" + i + fileName;

			// 업로드 파일이 있으면 파일을 특정경로로 업로드한다
			if (!fileName.equals("")) {
				try {
					list.get(i).transferTo(new File(uploadPath + fileName));

					// nameList.add(fileName);
					ImageVO imageVO = new ImageVO(0, fileName, boardVO.getBoardNo());

					boardDAO.imageUpload(imageVO);
			
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

	}
	

	@Override
	public IntroduceVO introduceDetail(int boardNo) {

		List<ImageVO> imageList = null;
		List<KeyWordVO> keyWordList = null;
		// introduceList = introduceDAO.introduceList(categoryNo);

		// boardNo에 해당하는 게시물 기본정보를 가져옴
		IntroduceVO introduceVO = introduceDAO.introduceDetail(boardNo);

		// 해당 게시물의 키워드 정보를 가져와서 세팅
		keyWordList = introduceDAO.keyWordList(boardNo);

		introduceVO.setKeyWordVO(keyWordList);

		// 해당 게시물의 이미지 정보를 가져와서 세팅(main image 정보도 저장되어있으므로 이것은 수정해야함!!)
		imageList = boardDAO.imageList(boardNo);

		introduceVO.setImageVO(imageList);

		// 완벽히 저장된 상세정보를 리턴한다!!!
		return introduceVO;
	}

	@Transactional
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
	public MeetingVO meetingDetail(int boardNo) {
		MeetingVO meetingVO = null;
		meetingVO = meetingDAO.meetingDetail(boardNo);
		List<ImageVO> imageList = null;
		imageList = boardDAO.imageList(boardNo);
		meetingVO.setImageVO(imageList);
		System.out.println(meetingVO);
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

	@Override
	public ListVO<MeetingVO> getMeetingList(String pageNo) {
		int totalCount = meetingDAO.getTotalContentCount();
		PagingBean pagingBean = null;
		if (pageNo == null) {
			pagingBean = new PagingBean(totalCount);
			pagingBean.setContentNumberPerPage(10);
			pagingBean.setPageNumberPerPageGroup(5);
			List<MeetingVO> list = meetingDAO.getMeetingList(pagingBean);
			ListVO<MeetingVO> mtvo = new ListVO<MeetingVO>(list, pagingBean);
			return mtvo;
		} else {
			pagingBean = new PagingBean(totalCount, Integer.parseInt(pageNo));
			pagingBean.setContentNumberPerPage(10);
			pagingBean.setPageNumberPerPageGroup(5);
			List<MeetingVO> list = meetingDAO.getMeetingList(pagingBean);
			ListVO<MeetingVO> mtvo = new ListVO<MeetingVO>(list, pagingBean);
			return mtvo;
		}
	}

	@Override
	public ListVO<ReviewVO> reviewSerachList(String pageNo, String searchKeyWord, String command) {

		int totalCount = 0;
		PagingBean pagingBean = null;
		Map<String, Object> map = null;
		List<ReviewVO> list = null;
		ListVO<ReviewVO> vo = null;


		
		if(command.equals("findByTitle"))
			totalCount=reviewDAO.getTitleSearchContentCount(searchKeyWord);
		else{
			totalCount = reviewDAO.getWriterSearchCount(searchKeyWord);
		}
			
		if(pageNo==null){
				pagingBean=new PagingBean(totalCount);
		}else{
				pagingBean=new PagingBean(totalCount,Integer.parseInt(pageNo));
			}

			pagingBean.setContentNumberPerPage(10);
			pagingBean.setPageNumberPerPageGroup(5);
			map = new HashMap<String, Object>();
			map.put("keyword", searchKeyWord);
			map.put("pb", pagingBean);

			list = reviewDAO.reviewTitleSearchList(map);
			vo = new ListVO<>(list, pagingBean); 

		return vo;
	}

	@Override
	public ReviewVO reviewNotHitDetail(int boardNo) {
		return reviewDAO.reviewDetail(boardNo);
	}

	@Transactional
	public void reviewUPdate(ReviewVO reviewVO) {
		boardDAO.reviewBoardUpdate(reviewVO);
		reviewDAO.reviewUpdate(reviewVO);
	}
	
	
	@Override
	@Transactional
	public IntroduceVO showCompanyBoard(String id){
		
		int boardNo=introduceDAO.findIntroduceById(id);
		return introduceDetail(boardNo);
		

		
		
		
	}


}
