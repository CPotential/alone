package org.kosta.alone.controller;

import javax.annotation.Resource;

import org.kosta.alone.model.vo.MemberVO;
import org.kosta.alone.model.vo.CompanyMemberVO;
import org.kosta.alone.model.vo.GenericMemberVO;
import org.kosta.alone.model.service.MemberService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MemberController {
	@Resource
	private MemberService memberService;
	
	@RequestMapping("loginCheck.do")
	public ModelAndView memberLogin(MemberVO memberVO){
		System.out.println(memberVO.toString());
		return new ModelAndView("member/login_result");
	}
	
	@RequestMapping("homego.do")
		public String home(){
			return "home";
	   }
	
	@RequestMapping(value = "registerMember.do", method = RequestMethod.POST)
	public String registerMember(GenericMemberVO vo) {	
         System.out.println(vo);
		memberService.registerMember(vo);
		/*return "redirect:registerok.do?id=" + vo.getId();*/
		return "redirect:/member/registerok.do";
	}
	
	@RequestMapping(value = "registerCompanyMember.do", method = RequestMethod.POST)
	public String registerMember(CompanyMemberVO vo) {	
         System.out.println(vo);
		memberService.registerMember(vo);
		/*return "redirect:registerok.do?id=" + vo.getId();*/
		return "redirect:/member/registerok.do";
	}
	
	@RequestMapping("idcheckAjax.do")
	@ResponseBody
	public String idcheckAjax(String id) {		
		int count=memberService.idcheck(id);
		return (count==0) ? "ok":"fail"; 	
	}
	
}
