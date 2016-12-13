package org.kosta.alone.model.dao;

import java.util.HashMap;
import java.util.List;

import org.kosta.alone.model.vo.IntroduceCategoryVO;
import org.kosta.alone.model.vo.IntroduceVO;
import org.kosta.alone.model.vo.KeyWordVO;

public interface IntroduceDAO {

	public List<IntroduceVO> introduceList(HashMap<String,Object> map);  
	
	public int getTotalContentCount(int categoryNo); 
	
	public List<KeyWordVO> keyWordList(int boardNo);
	
	public List<IntroduceCategoryVO> introduceCategoryList();
	
	public IntroduceVO introduceDetail(int boardNo);

	void introduceWrite(IntroduceVO introduceVO);

	void boardWrite(IntroduceVO introduceVO);

	void updateWrite(String id);

	void keywordRegister(KeyWordVO keywordVO);

	int findIntroduceById(String id);

	public void boardUpdate(IntroduceVO introduceVO);

	public void introduceUpdate(IntroduceVO introduceVO);
	
	public List<IntroduceVO> rankingIntroduceList();

}