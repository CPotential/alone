package org.kosta.alone.model.dao;


import org.kosta.alone.model.vo.GenericMemberVO;
import org.kosta.alone.model.vo.MemberVO;

public interface GenericMemberDAO {

	void registerMember(GenericMemberVO vo);
	
	public void updateMember(GenericMemberVO genericMemberVO);

	public GenericMemberVO showGenericmember(MemberVO vo);

}