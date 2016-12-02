package org.kosta.alone.model.service;


import java.util.List;

import org.kosta.alone.model.vo.CompanyMemberVO;
import org.kosta.alone.model.vo.GenericMemberVO;
import org.kosta.alone.model.vo.MemberVO;

public interface MemberService {
	public MemberVO memberLogin(MemberVO memberVO);
	void registerMember(CompanyMemberVO vo);
	void registerMember(GenericMemberVO vo);
	public int idcheck(String id);
	public List<CompanyMemberVO> NonApporvalCompanyList();
	public List<CompanyMemberVO> ApporvalCompanyList();
	public void updateApproval(String id); 
	public GenericMemberVO showGenericmember(MemberVO mvo);

}