package org.kosta.alone.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.kosta.alone.model.service.MemberService;
import org.kosta.alone.model.vo.CompanyMemberVO;
import org.kosta.alone.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
	
	@Resource
	private MemberService memberService;

	
	@RequestMapping(method=RequestMethod.POST,value="loginCheck.do")
	public ModelAndView memberLogin(MemberVO memberVO,HttpSession session){
		ModelAndView mav = null;
		memberVO =memberService.memberLogin(memberVO);
		if(memberVO ==null){
			mav =new ModelAndView("member/login_fail");
		}else if(memberVO instanceof CompanyMemberVO){
			CompanyMemberVO companyMemberVO = (CompanyMemberVO) memberVO;
			if(companyMemberVO.getApproval().equals("0")){
				mav=new ModelAndView("member/login_companyfail");
			}else{
				session.setAttribute("mvo", memberVO);
				mav=new ModelAndView("member/login_result");
			}
		}else{
			session.setAttribute("mvo", memberVO);
			mav=new ModelAndView("member/login_result");
		}
		return mav;
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session){
		if(session!=null)
			session.invalidate();
		
		return "home";
	}
	
	

}
