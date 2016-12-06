package org.kosta.alone.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.alone.model.vo.CommentVO;
import org.kosta.alone.model.vo.ImageVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<ImageVO> imageList(int boardNo){
		return sqlSessionTemplate.selectList("board.imageList", boardNo);
	}
	
	@Override
	public List<ImageVO> introduceFirstImage(int boardNo){
		return sqlSessionTemplate.selectList("board.introduceFirstImage", boardNo);
	}

	@Override
	public List<CommentVO> commentList(String boardNo) {
		return sqlSessionTemplate.selectList("board.commentList", boardNo);
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
}
