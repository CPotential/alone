package org.kosta.alone.model.dao;


import java.util.List;

import org.kosta.alone.model.vo.GenericMemberVO;
import org.kosta.alone.model.vo.MemberVO;
import org.kosta.alone.model.vo.MileageVO;

public interface GenericMemberDAO {

	void registerMember(GenericMemberVO vo);
	
	public void updateMember(GenericMemberVO genericMemberVO);

	public GenericMemberVO showGenericmember(MemberVO vo);

	List<GenericMemberVO> genericList();

	List<MileageVO> mileageInfo(String id);

	int nowMileage(String id);

}