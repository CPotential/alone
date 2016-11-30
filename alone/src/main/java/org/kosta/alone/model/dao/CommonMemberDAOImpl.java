package org.kosta.alone.model.dao;

import javax.annotation.Resource;

import org.kosta.alone.model.vo.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CommonMemberDAOImpl implements CommonMemberDAO {
	
	@Resource
	private SqlSessionTemplate template;
	

	@Override
	public MemberVO memberLogin(MemberVO memberVO){
		return template.selectOne("member.memberLogin",memberVO);
	}


	@Override
	public MemberVO gainAuthority(MemberVO memberVO) {
		
		return template.selectOne("member.gainAuthority",memberVO);
	}
	
	
	
	

}
