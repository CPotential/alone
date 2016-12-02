package org.kosta.alone.model.dao;

import javax.annotation.Resource;

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
}
