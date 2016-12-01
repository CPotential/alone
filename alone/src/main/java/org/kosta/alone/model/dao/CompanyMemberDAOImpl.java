package org.kosta.alone.model.dao;

import javax.annotation.Resource;

import org.kosta.alone.model.vo.CompanyMemberVO;
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
}
