package org.kosta.alone.model.dao;

import javax.annotation.Resource;

import org.kosta.alone.model.vo.GenericMemberVO;
import org.kosta.alone.model.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class GenericMemberDAOImpl implements GenericMemberDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void registerMember(GenericMemberVO vo){
		
		sqlSessionTemplate.insert("genericMember.registerMember", vo);
	}
	
	public GenericMemberVO showGenericmember(MemberVO vo){
		return sqlSessionTemplate.selectOne("genericMember.showGenericmember", vo);
	}
}
