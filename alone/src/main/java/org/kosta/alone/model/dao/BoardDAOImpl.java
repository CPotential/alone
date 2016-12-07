package org.kosta.alone.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.alone.model.vo.CommentVO;
import org.kosta.alone.model.vo.ImageVO;
import org.kosta.alone.model.vo.MeetingVO;
import org.kosta.alone.model.vo.ReviewVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<ImageVO> imageList(int boardNo){
		System.out.println(boardNo + "이미지 리스트 dao 출력 진입");
		return sqlSessionTemplate.selectList("board.imageList", boardNo);
	}
	
	@Override
	public List<ImageVO> introduceFirstImage(int boardNo){
		return sqlSessionTemplate.selectList("board.introduceFirstImage", boardNo);
	}

	@Override
	public List<CommentVO> commentList(int boardNo) {
		return sqlSessionTemplate.selectList("board.commentList", boardNo);
	}
	
	/**
	 * 이미지 업로드
	 */
	@Override
	public void imageUpload(ImageVO imageVO){
		sqlSessionTemplate.insert("board.imageUpload", imageVO);
	}
	
	@Override
	public void insertComment(CommentVO commentVO) {
		sqlSessionTemplate.insert("board.insertComment",commentVO);
	}

	@Override
	public void updateComment(CommentVO commentVO) {
		sqlSessionTemplate.update("board.updateComment",commentVO);
	}
	
	public void deleteComment(CommentVO commentVO){
		sqlSessionTemplate.delete("board.deleteComment",commentVO);
	}
	
	public void reviewBoardUpdate(ReviewVO reviewVO){
		sqlSessionTemplate.update("board.reviewBoardUpdate",reviewVO);
	}
	
	public void meetingboardUpdate(MeetingVO meetingVO) {
		sqlSessionTemplate.update("board.meetingboardUpdate", meetingVO);
	}
}
