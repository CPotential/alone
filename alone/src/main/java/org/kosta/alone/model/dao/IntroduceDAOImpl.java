package org.kosta.alone.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.alone.model.vo.IntroduceCategoryVO;
import org.kosta.alone.model.vo.IntroduceVO;
import org.kosta.alone.model.vo.KeyWordVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class IntroduceDAOImpl implements IntroduceDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<IntroduceVO> introduceList(int categoryNo){
		return sqlSessionTemplate.selectList("introduce.introduceList", categoryNo);
	}
	
	@Override
	public List<KeyWordVO> keyWordList(int boardNo){
		return sqlSessionTemplate.selectList("introduce.keyWordList", boardNo);
	}

	@Override
	public int keyWordSize(int boardNo) {
		return sqlSessionTemplate.selectOne("introduce.keyWordSize", boardNo);
	}

	@Override
	public List<IntroduceCategoryVO> introduceCategoryList() {
		return sqlSessionTemplate.selectList("introduce.introduceCategoryList");
	}
}
