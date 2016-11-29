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
	public List<ReviewBoardVO> listBoard() {
		return template.selectList("review.listBoard");
	}
	
	

}
