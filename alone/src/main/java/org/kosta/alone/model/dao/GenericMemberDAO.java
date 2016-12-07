package org.kosta.alone.model.dao;


import java.util.HashMap;
import java.util.List;

import org.kosta.alone.model.vo.GenericMemberVO;
import org.kosta.alone.model.vo.MemberVO;

public interface GenericMemberDAO {

	void registerMember(GenericMemberVO vo);
	
	public void updateMember(GenericMemberVO genericMemberVO);

	public GenericMemberVO showGenericmember(MemberVO vo);

	public List<GenericMemberVO> genericList();

	public MemberVO SearchIdAndMileage(String id);

	void mileageMinus(HashMap<String, Object> map);

	void updateMileage(int mileage);

}