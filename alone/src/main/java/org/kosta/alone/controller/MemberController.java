package org.kosta.alone.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.kosta.alone.model.service.MemberService;
import org.kosta.alone.model.vo.CompanyMemberVO;
import org.kosta.alone.model.vo.GenericMemberVO;
import org.kosta.alone.model.vo.MemberVO;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	 * 비밀번호 체크 ajax
	 * 
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

	/**
	 * 로그인시 권한 체크
	 */
	@RequestMapping("companyAuthorityCheckAjax.do")
	@ResponseBody
	public String companyAuthorityCheckAjax(String id) {
		return memberService.companyAuthority(id);

	}
}
