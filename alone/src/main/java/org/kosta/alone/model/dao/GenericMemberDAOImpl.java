package org.kosta.alone.model.dao;

import java.util.HashMap;
import java.util.List;

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
	
	public void updateMember(GenericMemberVO genericMemberVO){
		sqlSessionTemplate.update("genericMember.updateGenericMember",genericMemberVO);
	}
 
	public GenericMemberVO showGenericmember(MemberVO vo){
		return sqlSessionTemplate.selectOne("genericMember.showGenericmember", vo);
	}
	
	/**
	 * 일반회원 리스트
	 */
	@Override
	public List<GenericMemberVO> genericList() {
		return sqlSessionTemplate.selectList("genericMember.genericList");
	}

	@Override
	public MemberVO SearchIdAndMileage(String id) {
		return sqlSessionTemplate.selectOne("genericMember.SearchIdAndMileage",id);
	}

	@Override
	public void mileageMinus(HashMap<String, Object> map) {
		 sqlSessionTemplate.insert("genericMember.mileageMinus",map);
		
	}

	@Override
	public void updateMileage(HashMap<String, Object> map) {
		sqlSessionTemplate.update("genericMember.updateMileage",map);
	}
}
