package org.kosta.alone.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.alone.model.vo.BoardVO;
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
	public List<IntroduceVO> introduceList(HashMap<String,Object> map){ 
		return sqlSessionTemplate.selectList("introduce.introduceList",map);
	}
	
	public int getTotalContentCount(int categoryNo){
		return sqlSessionTemplate.selectOne("introduce.getTotalContentCount",categoryNo);  
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
	
	/**
	 * id에 해당하는 소개글 번호 얻기
	 */
	@Override
	public int findIntroduceById(String id){
		
		return sqlSessionTemplate.selectOne("introduce.findIntroduceById",id);
	}

	@Override
	public void boardUpdate(IntroduceVO introduceVO) {
		sqlSessionTemplate.update("introduce.boardUpdate",introduceVO);	
	}

	@Override
	public void introduceUpdate(IntroduceVO introduceVO) {
		sqlSessionTemplate.update("introduce.introduceUpdate",introduceVO);
	}
	
	@Override
	public List<IntroduceVO> rankingIntroduceList(){
		return sqlSessionTemplate.selectList("introduce.rankingIntroduceList");
	}

	@Override
	public void likeUp(BoardVO bvo) {
		sqlSessionTemplate.update("introduce.likeup",bvo);
		
	}

	@Override
	public int likeCheckNumber(BoardVO bvo) {
		return sqlSessionTemplate.selectOne("introduce.likeChekcNumber",bvo);
	}


}
