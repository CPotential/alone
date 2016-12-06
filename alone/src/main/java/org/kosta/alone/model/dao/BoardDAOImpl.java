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
}
