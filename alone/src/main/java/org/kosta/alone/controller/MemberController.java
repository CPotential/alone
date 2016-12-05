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
				session.setAttribute("memberVO", memberVO);
				mav=new ModelAndView("member/login_result");
			}
		}else{
			session.setAttribute("memberVO", memberVO);
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
		int count=memberService.idcheck(id);
		return (count==0) ? "ok":"fail"; 	
	}
	

	//미승인 기업회원 리스트 출력
	@RequestMapping("NonApporvalCompanyList.do")
	public ModelAndView NonApporvalCompanyList(){
	    List<CompanyMemberVO> NonApprovalCList = memberService.NonApporvalCompanyList();
		return new ModelAndView("myPageAdmin/memberApprove","NonApprovalCList",NonApprovalCList); 
	} 
	
	//승인 기업회원 리스트 출력
	@RequestMapping("ApporvalCompanyList.do")
	public ModelAndView ApporvalCompanyList(){
		List<CompanyMemberVO> ApprovalCList = memberService.ApporvalCompanyList();
		return new ModelAndView("myPageAdmin/approveCompanyList","ApprovalCList",ApprovalCList);
	}
	
	//미승인 기업회원 승인하기
	@RequestMapping("updateApproval.do")
	public ModelAndView updateApproval(String id){
		memberService.updateApproval(id);
		return new ModelAndView("redirect:ApporvalCompanyList.do");  
	}
	
	@RequestMapping("showGmemberinfo.do")
	public ModelAndView showGmemberinfo(HttpSession session){
		MemberVO vo=  (MemberVO) session.getAttribute("memberVO");
		return new ModelAndView("myPageGeneric/showInfo","gvo",memberService.showGenericmember(vo));
	}

}
