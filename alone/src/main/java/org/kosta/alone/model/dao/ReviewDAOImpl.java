package org.kosta.alone.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.alone.model.vo.ReviewBoardVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	@Resource
	private SqlSessionTemplate template;

	@Override
	public List<ReviewBoardVO> reviewList() {
		return template.selectList("review.reviewList");
	}

	@Override
	public List<ReviewBoardVO> reviewTitleSearchList(String searchKeyWord) {

		return template.selectList("review.reviewTitleSearchList",searchKeyWord);
	}

	@Override
	public List<ReviewBoardVO> reviewWriterSearchList(String searchKeyWord) {
		// TODO Auto-generated method stub
		return template.selectList("review.reviewWriterSearchList",searchKeyWord);
	}
	
	

}
