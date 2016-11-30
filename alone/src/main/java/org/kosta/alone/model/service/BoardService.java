package org.kosta.alone.model.service;

import java.util.List;

import org.kosta.alone.model.vo.IntroduceVO;

public interface BoardService {

	public List<IntroduceVO> introduceList(int categoryNo);

	/*public List<KeyWordVO> keyWordList(int boardNo);*/

}