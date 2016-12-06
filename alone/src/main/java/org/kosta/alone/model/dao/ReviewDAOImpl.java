package org.kosta.alone.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.alone.model.vo.ListVO;
import org.kosta.alone.model.vo.PagingBean;
import org.kosta.alone.model.vo.ReviewVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDAOImpl implements ReviewDAO {
	
	@Resource
	private SqlSessionTemplate template;

	@Override
	public List<ReviewVO> reviewList(PagingBean pagingBean) {
		return template.selectList("review.reviewList",pagingBean);
	}
	
	public int getTotalContentCount(){
		return template.selectOne("review.getTotalContentCount"); 
	}

	@Override
	public List<ReviewVO> reviewTitleSearchList(String searchKeyWord) {

		return template.selectList("review.reviewTitleSearchList",searchKeyWord);
	}

	@Override
	public List<ReviewVO> reviewWriterSearchList(String searchKeyWord) {
		// TODO Auto-generated method stub
		return template.selectList("review.reviewWriterSearchList",searchKeyWord);
	}
	
	public void reviewBoardWrite(ReviewVO reviewVO){ 
		template.insert("review.reviewBoardWrite",reviewVO);
	}
	
	public void reviewWrite(ReviewVO reviewVO){
		template.insert("review.reviewWrite",reviewVO);
	}
	
	

}
