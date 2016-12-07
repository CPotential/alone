package org.kosta.alone.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.kosta.alone.model.service.MemberService;
import org.kosta.alone.model.vo.CompanyMemberVO;
import org.kosta.alone.model.vo.GenericMemberVO;
import org.kosta.alone.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	@Resource
	private MemberService memberService;

	@RequestMapping(value = "loginCheck.do", method = RequestMethod.POST)
	public ModelAndView memberLogin(MemberVO memberVO, HttpSession session) {
		ModelAndView mav = null;
		memberVO = memberService.memberLogin(memberVO);

		if (memberVO == null) {
			mav = new ModelAndView("member/login_fail");
			return mav;
		} else if (memberVO instanceof CompanyMemberVO) {
			CompanyMemberVO companyMemberVO = (CompanyMemberVO) memberVO;
			if (companyMemberVO.getApproval().equals("0")) {
				mav = new ModelAndView("member/login_companyfail");
				return mav;
			}
		}
		session.setAttribute("memberVO", memberVO);
		mav = new ModelAndView("member/login_result");

		return mav;
	}

	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		if (session != null)
			session.invalidate();
		return "home";
	}

	@RequestMapping("homego.do")
	public String home() {
		return "home";
	}

	@RequestMapping(value = "registerMember.do", method = RequestMethod.POST)
	public String registerMember(GenericMemberVO vo) {
		System.out.println(vo);
		memberService.registerMember(vo);
		return "redirect:/member/registerok.do";
	}

	@RequestMapping(value = "registerCompanyMember.do", method = RequestMethod.POST)
	public String registerMember(CompanyMemberVO vo) {
		System.out.println(vo);
		memberService.registerMember(vo);
		return "redirect:/member/registerok.do";
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
	@RequestMapping("deleteMember.do")
	public String deleteMember(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		memberService.deleteMember(memberVO.getId());
		return "redirect:logout.do";
	}
	
	/**
	 * 관리자 - 회원 탈퇴
	 * @param id
	 */
	@RequestMapping("deleteMemberAjax.do")
	@ResponseBody
	public void deleteMemberAjax(String id){
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

		HttpSession session = request.getSession(false);
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
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
	@RequestMapping(value = "genericUpdate.do", method = RequestMethod.POST)
	public ModelAndView myPageMemberupdate(GenericMemberVO genericMemberVO, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("redirect:showGenericInfo.do");
		HttpSession session = request.getSession(false);
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		genericMemberVO.setId(memberVO.getId());
		memberService.updateInfo(genericMemberVO);
		return mav;

	}

	// 미승인 기업회원 리스트 출력
	@RequestMapping("NonApporvalCompanyList.do")
	public ModelAndView NonApporvalCompanyList() {
		List<CompanyMemberVO> NonApprovalCList = memberService.NonApporvalCompanyList();
		return new ModelAndView("myPage/admin/memberApprove", "NonApprovalCList", NonApprovalCList);
	}

	// 승인 기업회원 리스트 출력
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
	 * @param session
	 * @return
	 */
	@RequestMapping("showGenericInfo.do")
	public ModelAndView showGmemberinfo(HttpSession session) {
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		return new ModelAndView("myPage/generic/showInfo", "gvo", memberService.showGenericmember(memberVO));
	}
	

	/**
	 * 기업 회원 정보 페이지
	 * @param session
	 * @return
	 */
	@RequestMapping("showCompanyInfo.do")
	public ModelAndView showCmemberInfo(HttpSession session) {
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO"); 
		return new ModelAndView("myPage/company/showInfo", "cvo", memberService.showCompanyMember(memberVO));
	}
	
	/**
	 * 기업 회원 정보 수정 페이지로 이동
	 * @param id
	 * @return
	 */
	@RequestMapping("companyUpdateForm.do") 
	public ModelAndView companyUpdateForm(String id){
		return new ModelAndView("myPage/company/memberUpdateForm", "id", id);
	}
	
	/**
	 * 기업 회원 정보 수정
	 * @param cvo
	 * @return
	 */
	@RequestMapping("companyUpdate.do")
	public ModelAndView CmemberUpdateInfo(CompanyMemberVO cvo){
		memberService.CmemberUpdateInfo(cvo);  
		return new ModelAndView("redirect:showCompanyInfo.do");
	}
	
	/**
	 * 관리자 - 일반 회원 관리
	 */
	@RequestMapping("adminGenericManagement.do")
	public ModelAndView genericList(){
		return new ModelAndView("myPage/admin/genericManagement", "genericList", memberService.genericList());
	}
	
	/**
	 * 관리자 - 기업 회원 관리
	 */
	@RequestMapping("adminCompanyManagement.do")
	public ModelAndView companyList(){
		return new ModelAndView("myPage/admin/companyManagement", "companyList", memberService.companyList());
	}
	
	/**
	 * 관리자 - 탈퇴한 회원 리스트
	 */
	@RequestMapping("adminLeaveMemberList.do")
	public ModelAndView leaveMemberList(){
		return new ModelAndView("myPage/admin/leaveMember", "leaveMemberList", memberService.leaveMemberList());
	}
	
	@RequestMapping("idsearch.do")
	@ResponseBody
	public MemberVO idSearch(String id){
		MemberVO memberVO=memberService.SearchIdAndMileage(id);
		System.out.println(memberVO);
		return memberVO;
	}
	
	@RequestMapping("mileageMinus.do")
	@ResponseBody
	public String mileageMinus(GenericMemberVO memberVO,HttpSession session){
		MemberVO companyVO = (MemberVO) session.getAttribute("memberVO");
		memberService.mileageMinus(memberVO,companyVO);
		return "ok";
	}
	
	
}
