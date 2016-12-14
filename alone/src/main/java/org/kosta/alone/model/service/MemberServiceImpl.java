package org.kosta.alone.model.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.alone.model.dao.CompanyMemberDAO;
import org.kosta.alone.model.dao.GenericMemberDAO;
import org.kosta.alone.model.dao.MemberDAO;
import org.kosta.alone.model.vo.Authority;
import org.kosta.alone.model.vo.CompanyMemberVO;
import org.kosta.alone.model.vo.GenericMemberVO;
import org.kosta.alone.model.vo.MemberVO;
import org.kosta.alone.model.vo.MileageVO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDAO memberDAO;
	@Resource
	private GenericMemberDAO genericMemberDAO;
	@Resource
	private CompanyMemberDAO companyMemberDAO;

	/*
	 * 비밀번호 암호화를 위한 객체를 주입받는다 
	 */
	@Resource
	private BCryptPasswordEncoder passwordEncoder; 

	public int idcheck(String id) {
		return memberDAO.idcheck(id);
	}

	@Override
	@Transactional
	public void registerMember(GenericMemberVO genericMemberVO) {
		// 비밀번호를 bcrypt 알고리즘으로 암호화하여 DB에 저장한다
        String encodedPwd = passwordEncoder.encode(genericMemberVO.getPassword());
        genericMemberVO.setPassword(encodedPwd);
		memberDAO.registerMember(genericMemberVO); 
		genericMemberDAO.registerMember(genericMemberVO); 
		//회원 가입시 반드시 권한이 등록되도록 트랜잭션처리를 한다  
		Authority authority = new Authority(genericMemberVO.getId(),"ROLE_MEMBER");
		memberDAO.registerAuthority(authority); // 권한 DB에 인서트
	}

	@Override
	@Transactional
	public void registerMember(CompanyMemberVO companyMemberVO) {
		// 비밀번호를 bcrypt 알고리즘으로 암호화하여 DB에 저장한다
        String encodedPwd = passwordEncoder.encode(companyMemberVO.getPassword());
        companyMemberVO.setPassword(encodedPwd);
		memberDAO.registerMember(companyMemberVO); 
		companyMemberDAO.registerMember(companyMemberVO); 
		//회원 가입시 반드시 권한이 등록되도록 트랜잭션처리를 한다  
		Authority authority = new Authority(companyMemberVO.getId(),"ROLE_COMPANY_NON_VERIFIED");
		memberDAO.registerAuthority(authority); // 권한 DB에 인서트
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

	public void CmemberUpdateInfo(CompanyMemberVO cvo) {
		memberDAO.updateCompanyMember(cvo);
		if (cvo.getCorporateRegistrationNumber() != null && cvo.getAddress() != null) {
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

	/**
	 * 마일리지 내역
	 */
	@Override
	public List<MileageVO> mileageInfo(String id) {
		return genericMemberDAO.mileageInfo(id);
	}

	/**
	 * 아이디에 해당하는 마일리지정보
	 */
	@Override
	public int nowMileage(String id) {
		return genericMemberDAO.nowMileage(id);
	}
	/**
	 * 검색한 아이디에 해당하는 마일리지정보
	 */

	@Override
	public MemberVO SearchIdAndMileage(String id) {
		//마일리지 정보출력
		return genericMemberDAO.SearchIdAndMileage(id);
	}

	@Override
	@Transactional
	public void mileageMinus(GenericMemberVO memberVO, MemberVO companyVO) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberVO.getId());
		map.put("companyId", companyVO.getId());
		map.put("dealMoney", (int) (-1 * memberVO.getMileage()));
		//마일리지 내역 저장
		genericMemberDAO.mileageMinus(map);
		//회원의 마일리지 차감
		genericMemberDAO.updateMileage(map);
	}

	@Override
	public MemberVO showAdminMember(MemberVO memberVO) {
		return memberDAO.showAdminMember(memberVO);
	}

	@Override
	public MemberVO findMemberById(String id) {
		return memberDAO.findMemberById(id);
	}

	@Override
	public List<Authority> selectAuthorityById(String id) {
		return memberDAO.selectAuthorityById(id);
	}

	@Override
	public String companyAuthority(String id) {
		return companyMemberDAO.companyAuthority(id);
	}

	@Override
	public String writeCheck(String id) {
		return companyMemberDAO.writeCheck(id);
	}
}

