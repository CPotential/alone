package org.kosta.alone.controller;

import org.kosta.alone.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	
	@RequestMapping("loginCheck.do")
	public ModelAndView memberLogin(MemberVO memberVO){
		System.out.println(memberVO.toString());
		return new ModelAndView("member/login_result");
	}
	

}
