package org.kosta.alone.model.dao;

import java.util.List;

import org.kosta.alone.model.vo.Authority;
import org.kosta.alone.model.vo.CompanyMemberVO;
import org.kosta.alone.model.vo.MemberVO;

public interface MemberDAO {

	void registerMember(MemberVO vo);
	
	public int idcheck(String id);

	public void updateMember(MemberVO memberVO);
	
	public void deleteMember(String id);
	
	public int passwordCheck(MemberVO memberVO);

	int nickNamecheck(String nickname);
	
	public void updateCompanyMember(CompanyMemberVO cvo);

	public List<MemberVO> leaveMemberList();

	public MemberVO showAdminMember(MemberVO memberVO);

	public MemberVO findMemberById(String id);

	public List<Authority> selectAuthorityById(String id);

	public CompanyMemberVO adminApproval(MemberVO memberVO);

	public void registerAuthority(Authority authority);
}