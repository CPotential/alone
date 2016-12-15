package org.kosta.alone.model.dao;

import java.util.List;

import org.kosta.alone.model.vo.BoardVO;
import org.kosta.alone.model.vo.CommentVO;
import org.kosta.alone.model.vo.ImageVO;
import org.kosta.alone.model.vo.MeetingVO;
import org.kosta.alone.model.vo.ReviewVO;

public interface BoardDAO {

	List<ImageVO> imageList(int boardNo);

	ImageVO introduceFirstImage(int boardNo);

	List<CommentVO> commentList(int boardNo);

	public void imageUpload(ImageVO imageVO);

	void insertComment(CommentVO commentVO);

	void updateComment(CommentVO commentVO);

	void deleteComment(CommentVO commentVO);

	void boardDelete(int boardNo);

	public void likeCheck(BoardVO bvo);

	public BoardVO likeCheckInfo(BoardVO bvo);

	void insertLikeCheck(BoardVO bvo);

	void likeCheckUp(BoardVO bvo);

	public void reviewBoardUpdate(ReviewVO reviewVO);

	void imageDelete(String deleteFileName);

	public void meetingboardUpdate(MeetingVO meetingVO);

	void boardDeleteByBoardNo(int boardNo);

	void imageDeleteByBoardNo(int boardNo);

	List<ImageVO> imageAllList(int boardNo);

	public void deleteBoard(int boardNo);

	public String findByBoardId(int boardNo);

}