package org.kosta.alone.model.dao;

import java.util.List;

import org.kosta.alone.model.vo.IntroduceCategoryVO;
import org.kosta.alone.model.vo.IntroduceVO;
import org.kosta.alone.model.vo.KeyWordVO;

public interface IntroduceDAO {

	public List<IntroduceVO> introduceList(int categoryNo);

	public List<KeyWordVO> keyWordList(int boardNo);
	
	public int keyWordSize(int boardNo);
	
	public List<IntroduceCategoryVO> introduceCategoryList();
}