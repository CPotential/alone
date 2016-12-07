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
	/**
	 * 1)카테고리에 해당하는 게시물 리스트를 뽑는다 :introduceList
	 * 2)첫번째 소개글에 게시물 번호를 얻어와 해당 게시물에 키워드가 몇개 등록되었는지 확인 한다 :keyWordSize
	 * 3) 게시물이 가지고있는 키워드의 이름을 뽀는다
	 * introduceList.get(i).getBoardNo()게시물 번호
	 */
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

	/**
	 * 소개글 작성
	 */
	@Override

	public void introduceWrite(IntroduceVO introduceVO,UploadFileVO vo, HttpServletRequest request) {
	//테이블 기존 정보 쓰기
		introduceDAO.boardWrite(introduceVO);
    //테이블 상세정보쓰기
		introduceDAO.introduceWrite(introduceVO);
	//기업회원 글한번 쓴 상태로 변경
	introduceDAO.updateWrite(introduceVO.getMemberVO().getId());
	//이미지 업로드& 이미지 데이터 저장	
		imageUpload(introduceVO,vo,request);

	//키워드 데이터 저장
		keywordRegister(introduceVO);

	}
	
	public void keywordRegister(IntroduceVO introduceVO){
		List<KeyWordVO> list= introduceVO.getKeyWordVO();
		for(int i=0; i<list.size();i++){
			
			list.get(i).setBoardNo(introduceVO.getBoardNo());
			introduceDAO.keywordRegister(list.get(i));
			
		}
			
	}
	

	public void imageUpload(BoardVO boardVO,UploadFileVO vo,HttpServletRequest request){
		
		
		MultipartFile mainFile = vo.getMainFile(); //메인 파일을 가져온다
		List<MultipartFile> list = vo.getFile(); //그외 파일을 가져온다
	
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload/");


		//파일 디렉토리 생성
		File uploadDir=new File(uploadPath);
		if(uploadDir.exists()==false)
			uploadDir.mkdirs();
        //메인 파일 업로드
	String mainFileName	=mainFile.getOriginalFilename();
	mainFileName = "main_"+boardVO.getBoardNo()+mainFileName;
	try {
		mainFile.transferTo(new File(uploadPath+mainFileName));
		//System.out.println(mainFileName+" 업로드 완료");
		 ImageVO imageVO = new ImageVO(0,mainFileName ,boardVO.getBoardNo());
		// System.out.println("imageVO: "+imageVO);
		 boardDAO.imageRegister(imageVO);
		
	} catch (Exception e) {					
		e.printStackTrace();
	} 
		//그외 파일 업로드
		for(int i=0;i<list.size();i++){
			//만약 업로드 파일이 없으면 파일명은 공란처리된다 
			String fileName=list.get(i).getOriginalFilename();
			
			//파일이름을 유일하게 해준다
			 fileName = boardVO.getBoardNo()+"_"+i+fileName;
				
	
			//업로드 파일이 있으면 파일을 특정경로로 업로드한다
			if(!fileName.equals("")){			
				try {
					list.get(i).transferTo(new File(uploadPath+fileName));
				
					//nameList.add(fileName);
					ImageVO imageVO = new ImageVO(0,fileName ,boardVO.getBoardNo());
				
				
	
	
					boardDAO.imageRegister(imageVO);		
					
				} catch (Exception e) {					
					e.printStackTrace();
				} 
			}
		}
		

	
	}
	
	@Override
	public IntroduceVO introduceDetail(int boardNo){
	
		 
		List<ImageVO> imageList = null;
		List<KeyWordVO> keyWordList = null;
		//introduceList = introduceDAO.introduceList(categoryNo);
		
		//boardNo에 해당하는 게시물 기본정보를 가져옴
		IntroduceVO introduceVO=introduceDAO.introduceDetail(boardNo); 
		
		//해당 게시물의 키워드 정보를 가져와서 세팅
		keyWordList = introduceDAO.keyWordList(boardNo);
		
		introduceVO.setKeyWordVO(keyWordList);
		
		//해당 게시물의 이미지 정보를 가져와서 세팅(main image 정보도 저장되어있으므로 이것은 수정해야함!!)
		imageList = boardDAO.imageList(boardNo);

		introduceVO.setImageVO(imageList);


       //완벽히 저장된 상세정보를 리턴한다!!!
		return introduceVO;
	}
	@Override
	public void reviewWrite(ReviewVO reviewVO){
		reviewDAO.reviewBoardWrite(reviewVO); 
		reviewDAO.reviewWrite(reviewVO);
	}

	@Override
	public void meetingWrite(MeetingVO meetingVO) {
		meetingDAO.boardWrite(meetingVO);
		meetingDAO.meetingWrite(meetingVO);
	}

	@Override
	public MeetingVO meetingDetail(int boardNo) {

		return meetingDAO.meetingDetail(boardNo);

	}

	@Override
	public List<CommentVO> commentList(int boardNo) {
		// TODO Auto-generated method stub
		return boardDAO.commentList(boardNo);
	}
}
