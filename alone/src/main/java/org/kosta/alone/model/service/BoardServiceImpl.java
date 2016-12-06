package org.kosta.alone.model.service;

import java.io.File;
import java.util.List;

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
import org.kosta.alone.model.vo.MeetingVO;
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

	public List<MeetingVO> getMeetingList() {
		return meetingDAO.getMeetingList();
	}

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
	public List<ReviewVO> reviewList() {
		return reviewDAO.reviewList();
	}

	@Override
	public List<ReviewVO> reviewTitleSearchList(String searchKeyWord) {
		return reviewDAO.reviewTitleSearchList(searchKeyWord);
	}

	@Override
	public List<ReviewVO> reviewWriterSearchList(String searchKeyWord) {
		return reviewDAO.reviewWriterSearchList(searchKeyWord);
	}

	// 소개글 리스트
	@Override
	public List<IntroduceVO> introduceList(int categoryNo) {
		List<IntroduceVO> introduceList = null;
		List<ImageVO> imageList = null;
		List<KeyWordVO> keyWordVO = null;
		introduceList = introduceDAO.introduceList(categoryNo);
		for (int i = 0; i < introduceList.size(); i++) {
			keyWordVO = introduceDAO.keyWordList(introduceList.get(i).getBoardNo());
			introduceList.get(i).setKeyWordVO(keyWordVO);
			imageList = boardDAO.introduceFirstImage(introduceList.get(i).getBoardNo());
			introduceList.get(i).setImageVO(imageList);
		}
		return introduceList;
	}

	// 소개글 카테고리 리스트
	@Override
	public List<IntroduceCategoryVO> introduceCategoryList() {
		return introduceDAO.introduceCategoryList();
	}

	public IntroduceVO introduceDetail(int boardNo) {
		return introduceDAO.introduceDetail(boardNo);
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
	 * @param request
	 * @param meetingVO
	 * @param imageVO
	 */
	public void imageUpload(HttpServletRequest request, BoardVO boardVO, UploadFileVO uploadFileVO) {
		System.out.println(uploadFileVO);
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
		System.out.println("서비스 진입(모임 디테일)" + boardNo);
		MeetingVO meetingVO = null;
		meetingVO = meetingDAO.meetingDetail(boardNo);
		List<ImageVO> imageList = null;
		System.out.println("서비스 이미지 dao 진입 전 " + boardNo);
		imageList = boardDAO.imageList(boardNo);
		meetingVO.setImageVO(imageList);
		System.out.println(meetingVO);
		return meetingVO;
	}

	@Override
	public List<CommentVO> commentList(int boardNo) {
		System.out.println("서비스 진입(댓글)" + boardNo);
		return boardDAO.commentList(boardNo);
	}

	@Override
	public void imageUpload(String originalFilename) {

	}
}
