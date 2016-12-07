package org.kosta.alone.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.alone.model.vo.CompanyMemberVO;
import org.kosta.alone.model.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CompanyMemberDAOImpl implements CompanyMemberDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void registerMember(CompanyMemberVO vo){
		sqlSessionTemplate.insert("companyMember.registerMember", vo);
	}
	
	public List<CompanyMemberVO> NonApporvalCompanyList(){
		return sqlSessionTemplate.selectList("companyMember.NonApporvalCompanyList");
	}
	
	public List<CompanyMemberVO> ApporvalCompanyList(){ 
		return sqlSessionTemplate.selectList("companyMember.ApporvalCompanyList");
	}
	
	public void updateApproval(String id){
		sqlSessionTemplate.update("companyMember.updateApproval",id);
	}
	
	public CompanyMemberVO  showCompanyMember(MemberVO mvo){
		return sqlSessionTemplate.selectOne("companyMember.showCompanyMember",mvo);  
	}
	
	public void updateCompanyMember(CompanyMemberVO cvo){
		sqlSessionTemplate.update("companyMember.updateCompanyMember",cvo);
	}
	
	/**
	 * 기업회원 리스트
	 */
	@Override
	public List<CompanyMemberVO> companyList() {
		return sqlSessionTemplate.selectList("companyMember.companyList");
	}
}
