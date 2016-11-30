package org.kosta.alone.controller;

import javax.annotation.Resource;

import org.kosta.alone.model.service.MemberService;
import org.kosta.alone.model.vo.GenericMemberVO;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MemberController {
	@Resource
	private MemberService memberService;
	
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
}
