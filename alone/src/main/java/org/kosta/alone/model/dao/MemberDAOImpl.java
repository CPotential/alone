package org.kosta.alone.model.dao;

import javax.annotation.Resource;

import org.kosta.alone.model.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public void registerMember(MemberVO vo){
		sqlSessionTemplate.insert("member.registerMember", vo);
	}
}
