package org.kosta.alone.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.alone.model.vo.GenericMemberVO;
import org.kosta.alone.model.vo.MemberVO;
import org.kosta.alone.model.vo.MileageVO;
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

	/**
	 * 마일리지 내역
	 */
	@Override
	public List<MileageVO> mileageInfo(String id) {
		return sqlSessionTemplate.selectList("genericMember.mileageInfo", id);
	}

	/**
	 * 현재 마일리지
	 */
	@Override
	public int nowMileage(String id) {
		return sqlSessionTemplate.selectOne("genericMember.nowMileage", id);
	}
}
