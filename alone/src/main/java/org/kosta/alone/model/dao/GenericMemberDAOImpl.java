package org.kosta.alone.model.dao;

import java.util.HashMap;
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
	 * 해당 id의 거래액 거래상세정보를 출력한다.
	 */
	@Override
	public List<MileageVO> mileageInfo(String id) {
		return sqlSessionTemplate.selectList("genericMember.mileageInfo", id);
	}

	/**
	 * 회원이보유한 마일리지만
	 */
	@Override
	public int nowMileage(String id) {
		return sqlSessionTemplate.selectOne("genericMember.nowMileage", id);
	}
	
	/**
	 * 아이디에 해당하는 회원이보유한 마일리지와 아이디
	 */
	@Override
	public MemberVO SearchIdAndMileage(String id) {
		return sqlSessionTemplate.selectOne("genericMember.SearchIdAndMileage",id);
	}

	/**
	 * 기업회원이 마일리지 차감시 기업회원의 닉네임 정보 주기
	 * Map 정보 companyId,dealMoney,memberId
	 */
	@Override
	public void mileageMinus(HashMap<String, Object> map) {
		 sqlSessionTemplate.insert("genericMember.mileageMinus",map);
	}

	/**
	 * 마일리지 증가시켜주기
	 */
	@Override
	public void updateMileage(HashMap<String, Object> map) {
		sqlSessionTemplate.update("genericMember.updateMileage",map);
	}
}
