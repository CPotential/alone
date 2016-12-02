package org.kosta.alone.model.dao;

import org.kosta.alone.model.vo.GenericMemberVO;

public interface GenericMemberDAO {

	void registerMember(GenericMemberVO vo);
	
	public void updateMember(GenericMemberVO genericMemberVO);

}