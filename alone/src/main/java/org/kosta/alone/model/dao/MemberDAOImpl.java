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

	@Override
	public void updateMember(MemberVO memberVO) {
		sqlSessionTemplate.update("member.updateMember",memberVO);
	}

	@Override
	public int nickNamecheck(String nickname) {
		
		return sqlSessionTemplate.selectOne("member.nickNamecheck",nickname);
	}
	
}
