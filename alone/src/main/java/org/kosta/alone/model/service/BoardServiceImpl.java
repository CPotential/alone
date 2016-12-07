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
	private String uploadPath;

	/*
	 * public List<MeetingVO> getMeetingList() { return
	 * meetingDAO.getMeetingList(); }
	 */

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
	public ListVO<IntroduceVO> introduceList(int categoryNo,String nowPage) {
		List<ImageVO> imageList = null;
		List<KeyWordVO> keyWordVO = null;
		int totalCount = introduceDAO.getTotalContentCount(categoryNo);    
		HashMap<String,Object> map = new HashMap<String, Object>();
		
		if (nowPage == null) {
			PagingBean pagingBean = new PagingBean(totalCount);
			pagingBean.setContentNumberPerPage(6);
			pagingBean.setPageNumberPerPageGroup(4);
			map.put("categoryNo",categoryNo); 
			map.put("pagingBean",pagingBean);
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
		}else {
			PagingBean pagingBean = new PagingBean(totalCount, Integer.parseInt(nowPage));
			pagingBean.setContentNumberPerPage(6);
			pagingBean.setPageNumberPerPageGroup(4);
			map.put("categoryNo",categoryNo); 
			map.put("pagingBean",pagingBean);
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

	public IntroduceVO introduceDetail(int boardNo) {
		return introduceDAO.introduceDetail(boardNo);
	}

	/**
	 * 소개글 작성
	 */
	@Override
	@Transactional
	public void introduceWrite(IntroduceVO introduceVO) {
		introduceDAO.boardWrite(introduceVO);
		introduceDAO.introduceWrite(introduceVO);
		introduceDAO.updateWrite(introduceVO.getMemberVO().getId());
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
		imageUpload(request, meetingVO, uploadFileVO);
	}

	/**
	 * 이미지 업로드
	 * 
	 * @param request
	 * @param meetingVO
	 * @param imageVO
	 */
	public void imageUpload(HttpServletRequest request, BoardVO boardVO, UploadFileVO uploadFileVO) {
		ImageVO imageVO = new ImageVO();
		imageVO.setBoardNo(boardVO.getBoardNo());
		uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload/");
		File uploadDir = new File(uploadPath);
		if (uploadDir.exists() == false)
			uploadDir.mkdirs();
		List<MultipartFile> file = uploadFileVO.getFile();
		// 실제파일로 만들어준다
		for (int i = 0; i < file.size(); i++) {
			System.out.println("파일명 : " + file.get(i).getOriginalFilename());
			// 만약 업로드 파일이 없으면 파일명은 공란처리된다
			String originalFileName = file.get(i).getOriginalFilename();
			// 이미지명 변경 : 이미지 인덱스 번호 + _ + 원본명
			String fileName = boardVO.getBoardNo() + "_" + i + originalFileName;
			if (!fileName.equals("")) {
				try {
					file.get(i).transferTo(new File(uploadPath + fileName));
					System.out.println(fileName + "업로드 완료");
					imageVO.setImageName(fileName);
					boardDAO.imageUpload(imageVO);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * 모임글 상세보기
	 */
	@Override
	public MeetingVO meetingDetail(int boardNo) {
		System.out.println(boardNo);
		MeetingVO meetingVO = null;
		meetingVO = meetingDAO.meetingDetail(boardNo);
		List<ImageVO> imageList = null;
		imageList = boardDAO.imageList(boardNo);
		if(!imageList.isEmpty()){
			meetingVO.setImageVO(imageList);
		}
		return meetingVO;
	}

	@Override
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

	
	public void deleteComment(CommentVO commentVO){
		boardDAO.deleteComment(commentVO); 
	}

	public ReviewVO reviewDetail(int boardNo){
		
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
		int totalCount=0;
		PagingBean pagingBean=null;
		Map<String, Object> map =null;
		List<ReviewVO> list=null;
		ListVO<ReviewVO> vo =null;
		
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
			map=new HashMap<String,Object>();
			map.put("keyword", searchKeyWord);
			map.put("pb", pagingBean);
			list = reviewDAO.reviewTitleSearchList(map);	
			vo=new ListVO<>(list, pagingBean);

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
	
	@Transactional
	public void meetingUpdate(HttpServletRequest request, MeetingVO meetingVO, UploadFileVO uploadFileVO) {
		boardDAO.meetingboardUpdate(meetingVO);
		meetingDAO.meetingUpdate(meetingVO);
		//mageUpload(request, meetingVO, uploadFileVO);
	}
}
