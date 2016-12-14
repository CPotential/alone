package org.kosta.alone.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.alone.model.service.MemberService;
import org.kosta.alone.model.vo.CompanyMemberVO;
import org.kosta.alone.model.vo.GenericMemberVO;
import org.kosta.alone.model.vo.MemberVO;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	@Resource
	private MemberService memberService;

	// 회원정보수정시 비밀번호 암호화처리를 위한 객체를 주입받는다
	@Resource
	private BCryptPasswordEncoder passwordEncoder;


	@RequestMapping(value = "registerMember.do", method = RequestMethod.POST)
	public String registerMember(GenericMemberVO vo) {
		memberService.registerMember(vo);
		return "redirect:member/registerok.do";
	}

	@RequestMapping(value = "registerCompanyMember.do", method = RequestMethod.POST)
	public String registerMember(CompanyMemberVO vo) {
		memberService.registerMember(vo);
		return "redirect:member/registerok.do";
	}

	@RequestMapping("idcheckAjax.do")
	@ResponseBody
	public String idcheckAjax(String id) {
		int count = memberService.idcheck(id);
		return (count == 0) ? "ok" : "fail";
	}

	/**
	 * 회원 탈퇴
	 * @param request
	 * @return
	 */
	@Secured({"ROLE_MEMBER", "ROLE_COMPANY_VERIFIED"})
	@RequestMapping(method = RequestMethod.POST, value="deleteMember.do")
	public String deleteMember(HttpServletRequest request, String password) {
		System.out.println(password);
		System.out.println("컨트롤진입");
		// Spring Security 세션 회원정보를 반환받는다
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println(memberVO.getPassword());
		if(passwordEncoder.matches(password, memberVO.getPassword())){
			memberService.deleteMember(memberVO.getId());
			return "redirect:logout.do";
		} else
			return "redirect:myPage/leave_fail.do";
	}

	/**
	 * 관리자 - 회원 탈퇴
	 * @param id
	 */
	@RequestMapping("deleteMemberAjax.do")
	@ResponseBody
	public void deleteMemberAjax(String id) {
		memberService.deleteMember(id);
	}

	/**
	 * 비밀번호 체크 ajax
	 * @param password
	 * @return
	 */
	@RequestMapping("passwordCheckAjax.do")
	@ResponseBody
	public String passwordCheckAjax(HttpServletRequest request, String password) {
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		memberVO.setPassword(password);
		int count = memberService.passwordCheck(memberVO);
		return (count == 1) ? "ok" : "fail";
	}

	@RequestMapping("nickNamecheckAjax.do")
	@ResponseBody
	public String nickNamecheckAjax(String nickname) {
		int count = memberService.nickNamecheck(nickname);
		return (count == 0) ? "ok" : "fail";
	}

	// 일반회원 정보 수정
	@Secured("ROLE_MEMBER")
	@RequestMapping(value = "genericUpdate.do", method = RequestMethod.POST)
	public ModelAndView myPageMemberupdate(GenericMemberVO genericMemberVO, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("redirect:showGenericInfo.do");
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		genericMemberVO.setId(memberVO.getId());
		// 변경할 비밀번호를 암호화한다
		String encodePassword = passwordEncoder.encode(genericMemberVO.getPassword());
		genericMemberVO.setPassword(encodePassword);
		memberService.updateInfo(genericMemberVO);
		return mav;

	}

	// 미승인 기업회원 리스트 출력
	@Secured("ROLE_ADMIN")
	@RequestMapping("NonApporvalCompanyList.do")
	public ModelAndView NonApporvalCompanyList() {
		List<CompanyMemberVO> NonApprovalCList = memberService.NonApporvalCompanyList();
		return new ModelAndView("myPage/admin/memberApprove", "NonApprovalCList", NonApprovalCList);
	}

	// 승인 기업회원 리스트 출력
	@Secured("ROLE_ADMIN")
	@RequestMapping("ApporvalCompanyList.do")
	public ModelAndView ApporvalCompanyList() {
		List<CompanyMemberVO> ApprovalCList = memberService.ApporvalCompanyList();
		return new ModelAndView("myPage/admin/approveCompanyList", "ApprovalCList", ApprovalCList);
	}

	// 미승인 기업회원 승인하기
	@RequestMapping("updateApproval.do")
	public ModelAndView updateApproval(String id) {
		memberService.updateApproval(id);
		return new ModelAndView("redirect:ApporvalCompanyList.do");
	}

	/**
	 * 일반 회원 정보 페이지
	 * @return
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("showGenericInfo.do")
	public ModelAndView showGmemberinfo(HttpSession session) {
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return new ModelAndView("myPage/generic/showInfo", "gvo", memberService.showGenericmember(memberVO));
	}

	/**
	 * 기업 회원 정보 페이지
	 * @return
	 */
	@Secured("ROLE_COMPANY_VERIFIED")
	@RequestMapping("showCompanyInfo.do")
	public ModelAndView showCmemberInfo(HttpSession session) {
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		CompanyMemberVO companyMemberVO = null;
		companyMemberVO = memberService.showCompanyMember(memberVO);
		companyMemberVO.setWrite(memberService.writeCheck(memberVO.getId()));
		session.setAttribute("writeCheck", memberService.writeCheck(memberVO.getId()));
		return new ModelAndView("myPage/company/showInfo", "cvo", companyMemberVO);
	}

	/**
	 * 기업 회원 정보 수정 페이지로 이동
	 * @param id
	 * @return
	 */
	@Secured("ROLE_COMPANY_VERIFIED")
	@RequestMapping("companyUpdateForm.do")
	public String companyUpdateForm() {
		return "myPage/company/memberUpdateForm";
	}

	/**
	 * 기업 회원 정보 수정
	 * @param companyMemberVO
	 * @return
	 */
	@Secured("ROLE_COMPANY_VERIFIED")
	@RequestMapping("companyUpdate.do")
	public ModelAndView CmemberUpdateInfo(CompanyMemberVO companyMemberVO) {
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		companyMemberVO.setId(memberVO.getId());
		// 변경할 비밀번호를 암호화한다
		String encodePassword = passwordEncoder.encode(companyMemberVO.getPassword());
		companyMemberVO.setPassword(encodePassword);
		memberService.CmemberUpdateInfo(companyMemberVO);
		return new ModelAndView("redirect:showCompanyInfo.do");
	}

	/**
	 * 관리자 - 일반 회원 관리
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("adminGenericManagement.do")
	public ModelAndView genericList() {
		return new ModelAndView("myPage/admin/genericManagement", "genericList", memberService.genericList());
	}

	/**
	 * 관리자 - 기업 회원 관리
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("adminCompanyManagement.do")
	public ModelAndView companyList() {
		return new ModelAndView("myPage/admin/companyManagement", "companyList", memberService.companyList());
	}

	/**
	 * 관리자 - 탈퇴한 회원 리스트
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("adminLeaveMemberList.do")
	public ModelAndView leaveMemberList() {
		return new ModelAndView("myPage/admin/leaveMember", "leaveMemberList", memberService.leaveMemberList());
	}

	/**
	 * 일반회원 - 마일리지 정보
	 */
	@Secured("ROLE_MEMBER")
	@RequestMapping("showMileageInfo.do")
	public ModelAndView showMileageInfo() {
		ModelAndView mav = new ModelAndView("myPage/generic/showMileage");
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		mav.addObject("mileageInfo", memberService.mileageInfo(memberVO.getId()));
		mav.addObject("nowMileage", memberService.nowMileage(memberVO.getId()));
		return mav;
	}

	@RequestMapping("idsearch.do")
	@ResponseBody
	public MemberVO idSearch(String id) {
		MemberVO memberVO = memberService.SearchIdAndMileage(id);
		return memberVO;
	}

	@RequestMapping("mileageMinus.do")
	@ResponseBody
	public MemberVO mileageMinus(GenericMemberVO genericMemberVO) {
		MemberVO companyVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		memberService.mileageMinus(genericMemberVO, companyVO);
		genericMemberVO = (GenericMemberVO) memberService.SearchIdAndMileage(genericMemberVO.getId());
		return genericMemberVO;
	}

	/**
	 * 관리자 정보 페이지
	 * @return
	 */
	@Secured("ROLE_ADMIN")
	@RequestMapping("showAdminInfo.do")
	public ModelAndView showAdminInfo() {
		MemberVO memberVO = (MemberVO) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return new ModelAndView("myPage/admin/showInfo", "admin", memberService.showAdminMember(memberVO));
	}
	
	/**
	 * 로그인시 권한 체크
	 */
	@RequestMapping("companyAuthorityCheckAjax.do")
	@ResponseBody
	public String companyAuthorityCheckAjax(String id){
		return memberService.companyAuthority(id);
	}
}
