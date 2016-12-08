package org.kosta.alone.model.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.alone.model.dao.CommonMemberDAO;
import org.kosta.alone.model.dao.CompanyMemberDAO;
import org.kosta.alone.model.dao.GenericMemberDAO;
import org.kosta.alone.model.dao.MemberDAO;
import org.kosta.alone.model.vo.CompanyMemberVO;
import org.kosta.alone.model.vo.GenericMemberVO;
import org.kosta.alone.model.vo.MemberVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDAO memberDAO;
	@Resource
	private GenericMemberDAO genericMemberDAO;
	@Resource
	private CommonMemberDAO commonMemberDAO;
	@Resource
	private CompanyMemberDAO companyMemberDAO;

	@Override
	public MemberVO memberLogin(MemberVO memberVO) {
		memberVO = commonMemberDAO.memberLogin(memberVO);
		//아이디 패스워드 확인
		if(memberVO == null){
			return memberVO;
		} 
		if(memberVO.getAuthority().equals("ROLE_COMPANY")){
			return commonMemberDAO.adminApproval(memberVO);
			//관리자가 기업 승인 여부 확인해야한다.
		}
		return memberVO;
	}

	public int idcheck(String id) {
		return memberDAO.idcheck(id);
	}

	@Override
	@Transactional
	public void registerMember(GenericMemberVO vo) {
		memberDAO.registerMember(vo); // pk 넣어주고
		genericMemberDAO.registerMember(vo); // fk로 pk가져왔으니깐 상관없음
		vo.setAuthority("ROLE_MEMBER"); // 권한 셋팅
		commonMemberDAO.registerAuthority(vo); // 권한 DB에 인서트
	}

	@Transactional
	public void registerMember(CompanyMemberVO vo) {
		memberDAO.registerMember(vo);
		companyMemberDAO.registerMember(vo);
		vo.setAuthority("ROLE_COMPANY"); // 권한 셋팅
		commonMemberDAO.registerAuthority(vo); // 권한 DB에 인서트
	}

	public List<CompanyMemberVO> NonApporvalCompanyList() {
		return companyMemberDAO.NonApporvalCompanyList();
	}

	public List<CompanyMemberVO> ApporvalCompanyList() {
		return companyMemberDAO.ApporvalCompanyList();
	}

	public void updateApproval(String id) {
		companyMemberDAO.updateApproval(id);
	}

	@Override
	@Transactional
	public void updateInfo(GenericMemberVO genericMemberVO) {
		memberDAO.updateMember(genericMemberVO);
		if (genericMemberVO.getGender() != null) {
			genericMemberDAO.updateMember(genericMemberVO);
		}

	}
	
	/**
	 * 회원 탈퇴
	 */
	@Override
	public void deleteMember(String id) {
		memberDAO.deleteMember(id);
	}

	/**
	 * 비밀번호 체크
	 */
	@Override
	public int passwordCheck(MemberVO memberVO) {
		return memberDAO.passwordCheck(memberVO);
	}
	
	// 닉네임 중복체크
	@Override
	public int nickNamecheck(String nickname) {
		return memberDAO.nickNamecheck(nickname);
	}

	public GenericMemberVO showGenericmember(MemberVO mvo) {
		return genericMemberDAO.showGenericmember(mvo);
	}

	@Override
	public CompanyMemberVO showCompanyMember(MemberVO mvo) {

		return companyMemberDAO.showCompanyMember(mvo);
	}
	
	public void CmemberUpdateInfo(CompanyMemberVO cvo){
		memberDAO.updateCompanyMember(cvo); 
		if(cvo.getCorporateRegistrationNumber() != null && cvo.getAddress() != null){
			companyMemberDAO.updateCompanyMember(cvo); 
		}
	}
	
	/**
	 * 일반회원 리스트
	 */
	@Override
	public List<GenericMemberVO> genericList() {
		return genericMemberDAO.genericList();
	}
	
	/**
	 * 기업회원 리스트
	 */
	@Override
	public List<CompanyMemberVO> companyList() {
		return companyMemberDAO.companyList();
	}
	
	/**
	 * 탈퇴회원 리스트
	 */
	@Override
	public List<MemberVO> leaveMemberList() {
		return memberDAO.leaveMemberList();
	}

	@Override
	public MemberVO SearchIdAndMileage(String id) {
		return genericMemberDAO.SearchIdAndMileage(id);
	}

	@Override
	@Transactional
	public void mileageMinus(GenericMemberVO memberVO, MemberVO companyVO) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberVO.getId());
		map.put("companyId", companyVO.getId());
		map.put("dealMoney", (int)(-1*memberVO.getMileage()));
		genericMemberDAO.mileageMinus(map);
		genericMemberDAO.updateMileage(map);
		
	}
}