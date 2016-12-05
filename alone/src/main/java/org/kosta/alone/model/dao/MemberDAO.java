package org.kosta.alone.model.dao;

import org.kosta.alone.model.vo.MemberVO;

public interface MemberDAO {

	void registerMember(MemberVO vo);
	
	public int idcheck(String id);

	public void updateMember(MemberVO memberVO);
	
	int nickNamecheck(String nickname);

}