package org.kosta.alone.model.dao;

import java.util.List;

import org.kosta.alone.model.vo.CompanyMemberVO;
import org.kosta.alone.model.vo.MemberVO;

public interface CompanyMemberDAO {

	void registerMember(CompanyMemberVO vo);
	
	public List<CompanyMemberVO> NonApporvalCompanyList();
	
	public List<CompanyMemberVO> ApporvalCompanyList();
	
	public void updateApproval(String id);

	CompanyMemberVO showCompanyMember(MemberVO mvo);
	
	public void updateCompanyMember(CompanyMemberVO cvo);
}