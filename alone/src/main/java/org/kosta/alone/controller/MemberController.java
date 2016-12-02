package org.kosta.alone.controller;

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


	
	@RequestMapping(method=RequestMethod.POST,value="loginCheck.do")
	public ModelAndView memberLogin(MemberVO memberVO,HttpSession session){
		ModelAndView mav = null;
		memberVO =memberService.memberLogin(memberVO);
		if(memberVO ==null){
			mav =new ModelAndView("member/login_fail");
		}else if(memberVO instanceof CompanyMemberVO){
			
			CompanyMemberVO companyMemberVO = (CompanyMemberVO) memberVO;
			System.out.println(companyMemberVO);
			
			if(companyMemberVO.getApproval().equals("0")){
				mav=new ModelAndView("member/login_companyfail");
			}else{
				System.out.println(memberVO);
				session.setAttribute("mvo", memberVO);
				mav=new ModelAndView("member/login_result");
			}
		}else{
			session.setAttribute("mvo", memberVO);
			mav=new ModelAndView("member/login_result");
		}
		System.out.println(memberVO);
		return mav;
	}
	

	@RequestMapping("logout.do")
	public String logout(HttpSession session){
		if(session!=null)
			session.invalidate();
		
		return "home";
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
	
	@RequestMapping("showGmemberinfo.do")
	public ModelAndView showGmemberinfo(HttpSession session){
		MemberVO vo=  (MemberVO) session.getAttribute("mvo");
	
		//System.out.println("controller:"+vo);
		//System.out.println("result:"+memberService.showGenericmember(vo));
		//,"gvo",memberService.showGenericmember(vo)
		return new ModelAndView("myPageGeneric/showInfo","gvo",memberService.showGenericmember(vo));
	}

}
