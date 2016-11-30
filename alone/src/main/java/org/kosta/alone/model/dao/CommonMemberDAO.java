package org.kosta.alone.model.dao;

import org.kosta.alone.model.vo.MemberVO;

public interface CommonMemberDAO {
	public MemberVO memberLogin(MemberVO memberVO);
	
	public MemberVO gainAuthority(MemberVO memberVO);
}

