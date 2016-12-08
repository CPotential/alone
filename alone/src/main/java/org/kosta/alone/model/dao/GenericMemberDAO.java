package org.kosta.alone.model.dao;


import java.util.HashMap;
import java.util.List;

import org.kosta.alone.model.vo.GenericMemberVO;
import org.kosta.alone.model.vo.MemberVO;
import org.kosta.alone.model.vo.MileageVO;

public interface GenericMemberDAO {

	public void registerMember(GenericMemberVO vo);
	
	public void updateMember(GenericMemberVO genericMemberVO);

	public GenericMemberVO showGenericmember(MemberVO vo);

	public List<MileageVO> mileageInfo(String id);

	public int nowMileage(String id);

	public List<GenericMemberVO> genericList();

	public MemberVO SearchIdAndMileage(String id);

	public void mileageMinus(HashMap<String, Object> map);

	public void updateMileage(HashMap<String, Object> map);
}