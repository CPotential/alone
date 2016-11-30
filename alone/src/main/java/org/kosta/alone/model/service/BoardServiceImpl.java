package org.kosta.alone.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.alone.model.dao.IntroduceDAO;
import org.kosta.alone.model.vo.IntroduceVO;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	@Resource
	private IntroduceDAO introduceDAO;
	
	@Override
	public List<IntroduceVO> introduceList(int categoryNo){
		List<IntroduceVO> introduceList = null;
		introduceList = introduceDAO.introduceList(categoryNo);
		int keyWordSize = introduceDAO.keyWordSize(introduceDAO.introduceList(categoryNo).get(0).getBoardNo()); 
		for(int i=0; i<introduceList.size(); i++){
			for(int j=0; j<keyWordSize; j++){
				introduceList.get(j).setKeyWordVO(introduceDAO.keyWordList(introduceList.get(j).getBoardNo()));
			}
		}
		return introduceList;
	}
}










