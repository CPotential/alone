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
	public List<IntroduceCategoryVO> introduceCategoryList() {
		return sqlSessionTemplate.selectList("introduce.introduceCategoryList");
	}
	@Override
	public IntroduceVO introduceDetail(int boardNo){
		return sqlSessionTemplate.selectOne("introduce.introduceDetail",boardNo); 
	}
	
	@Override
	public void boardWrite(IntroduceVO introduceVO){
		sqlSessionTemplate.insert("introduce.boardWrite",introduceVO);
	}
	@Override
	public void introduceWrite(IntroduceVO introduceVO){ 
		sqlSessionTemplate.insert("introduce.introduceWrite",introduceVO);
	}
	/**
	 * 기업회원 write를 update
	 */
	@Override
    public void updateWrite(String id){
		sqlSessionTemplate.update("introduce.updateWrite",id);
    	
    }

/**
 * 키워드 저장
 */
	@Override
	public void keywordRegister(KeyWordVO keywordVO) {
	
		sqlSessionTemplate.insert("introduce.keywordRegister",keywordVO);
		
	}
}
