package org.kosta.alone.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.alone.model.vo.Authority;
import org.kosta.alone.model.vo.CompanyMemberVO;
import org.kosta.alone.model.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	public int idcheck(String id) {
		return sqlSessionTemplate.selectOne("member.idcheck",id);				
	}
	
	@Override
	public void registerMember(MemberVO vo){
		sqlSessionTemplate.insert("member.registerMember", vo);
	}
	
	/**
	 * 회원탈퇴
	 */
	@Override
	public void deleteMember(String id) {
		sqlSessionTemplate.update("member.deleteMember", id);
	}
	
	/**
	 * 비밀번호 체크
	 */
	@Override
	public int passwordCheck(MemberVO memberVO) {
		return sqlSessionTemplate.selectOne("member.passwordCheck", memberVO);
	}

	@Override
	public void updateMember(MemberVO memberVO) {
		sqlSessionTemplate.update("member.updateMember",memberVO);
	}

	@Override
	public int nickNamecheck(String nickname) {
		return sqlSessionTemplate.selectOne("member.nickNamecheck",nickname);
	}

	public void updateCompanyMember(CompanyMemberVO cvo){
		sqlSessionTemplate.update("member.updateCompanyMember",cvo); 
	}

	/**
	 * 탈퇴회원 리스트
	 */
	@Override
	public List<MemberVO> leaveMemberList() {
		return sqlSessionTemplate.selectList("member.leaveMemberList");
	}

	@Override
	public MemberVO showAdminMember(MemberVO memberVO) {
		return sqlSessionTemplate.selectOne("member.showAdminMember",memberVO);
	}

	@Override
	public MemberVO findMemberById(String id) {
		return sqlSessionTemplate.selectOne("member.findMemberById",id);
	}
	
	/*
	 * Security에서 인증시 사용
	 */
	@Override
	public List<Authority> selectAuthorityById(String id) {
		return sqlSessionTemplate.selectList("member.selectAuthorityById", id);
	}

	@Override
	public CompanyMemberVO adminApproval(MemberVO memberVO) {
		return sqlSessionTemplate.selectOne("member.adminApproval", memberVO);
	}

	/**
	 * 아이디 권한 생성
	 */
	@Override
	public void registerAuthority(Authority authority) {
		sqlSessionTemplate.insert("member.registerAuthority", authority);
	}
}
