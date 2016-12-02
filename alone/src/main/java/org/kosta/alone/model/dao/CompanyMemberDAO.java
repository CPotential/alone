package org.kosta.alone.model.dao;

import java.util.List;

import org.kosta.alone.model.vo.CompanyMemberVO;

public interface CompanyMemberDAO {

	void registerMember(CompanyMemberVO vo);
	
	public List<CompanyMemberVO> NonApporvalCompanyList();
	
	public List<CompanyMemberVO> ApporvalCompanyList();
	
	public void updateApproval(String id); 
}