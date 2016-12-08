package org.kosta.alone.model.dao;

import java.util.List;

import org.kosta.alone.model.vo.CommentVO;
import org.kosta.alone.model.vo.ImageVO;
import org.kosta.alone.model.vo.ReviewVO;

public interface BoardDAO {

	List<ImageVO> imageList(int boardNo);

	List<ImageVO> introduceFirstImage(int boardNo);

	List<CommentVO> commentList(int boardNo);

	public void imageUpload(ImageVO imageVO);

	void insertComment(CommentVO commentVO);

	void updateComment(CommentVO commentVO);
	
	void deleteComment(CommentVO commentVO);

	public void reviewBoardUpdate(ReviewVO reviewVO);

	void imageDelete(String deleteFileName);
}