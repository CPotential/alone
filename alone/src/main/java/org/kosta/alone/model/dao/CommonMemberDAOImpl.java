package org.kosta.alone.model.dao;

import javax.annotation.Resource;

import org.kosta.alone.model.vo.CompanyMemberVO;
import org.kosta.alone.model.vo.GenericMemberVO;
import org.kosta.alone.model.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CommonMemberDAOImpl implements CommonMemberDAO {

	@Resource
	private SqlSessionTemplate template;

	@Override
	public MemberVO memberLogin(MemberVO memberVO) {
		return template.selectOne("member.memberLogin", memberVO);
	}

	@Override
	public CompanyMemberVO adminApproval(MemberVO memberVO) {
	
		return template.selectOne("member.adminApproval", memberVO);
	}

	@Override
	public void registerAuthority(GenericMemberVO vo) {
		template.insert("genericMember.registerAuthority", vo);
	}

	@Override
	public void registerAuthority(CompanyMemberVO vo) {
		template.insert("companyMember.registerAuthority", vo);
	}

}
