package org.kosta.alone.model.service;

import java.util.List;

import org.kosta.alone.model.vo.Authority;
import org.kosta.alone.model.vo.CompanyMemberVO;
import org.kosta.alone.model.vo.GenericMemberVO;

import org.kosta.alone.model.vo.MemberVO;
import org.kosta.alone.model.vo.MileageVO;

public interface MemberService {
	public void registerMember(CompanyMemberVO vo);

	public void registerMember(GenericMemberVO vo);

	public int idcheck(String id);

	public void deleteMember(String id);

	public int passwordCheck(MemberVO memberVO);

	public void updateInfo(GenericMemberVO genericMemberVO);

	public int nickNamecheck(String nickname);

	public List<CompanyMemberVO> NonApporvalCompanyList();

	public List<CompanyMemberVO> ApporvalCompanyList();

	public void updateApproval(String id);

	public GenericMemberVO showGenericmember(MemberVO mvo);

	public CompanyMemberVO showCompanyMember(MemberVO mvo);

	public void CmemberUpdateInfo(CompanyMemberVO cvo);

	public List<GenericMemberVO> genericList();

	public List<CompanyMemberVO> companyList();

	public List<MemberVO> leaveMemberList();

	public List<MileageVO> mileageInfo(String id);

	public int nowMileage(String id);

	public MemberVO SearchIdAndMileage(String id);

	public void mileageMinus(GenericMemberVO memberVO, MemberVO companyVO);

	public MemberVO showAdminMember(MemberVO memberVO);

	public MemberVO findMemberById(String id);

	public List<Authority> selectAuthorityById(String id);

	public String companyAuthority(String id);

	public String writeCheck(String id);

}