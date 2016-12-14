package org.kosta.alone.controller;


import java.util.HashMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;


import org.kosta.alone.model.service.EventService;

import org.kosta.alone.model.vo.MemberVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EventController {
	
	@Resource
	private EventService eventService;
	

	/**
	 * gerneic 멤버일때만 출석일수를 가져온다 
	 * @param session
	 * @return
	 */
	@RequestMapping("showAttendanceMain.do")
	public ModelAndView showAttenadceMain(HttpSession session,String y, String m)
	{
		
		
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO= (MemberVO) session.getAttribute("memberVO");
       	
		 //일반멤버라면 출석일수를 얻어온다

		if(memberVO !=null && memberVO.getAuthority().equals("ROLE_MEMBER") ){
	
		 
		 	
			 HashMap<String, Object> resultMap=
					 eventService.attendanceList(memberVO.getId(), y,m);
		 mv.addObject("resultMap",resultMap);
		}
	
		mv.setViewName("event/attendance");
		
		return mv;
	}
	@RequestMapping("attendanceCheck.do")
	public ModelAndView attendanceCheck(HttpSession session,String y, String m){
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO =(MemberVO) session.getAttribute("memberVO");

			//동작하기
			int count =eventService.attendanceCheck(memberVO.getId());
			//회원이 이미 출석을 했다면
			if(count>0){
				mv.setViewName("event/attendanceCheck_genericfail");
				
			}
			//그렇지 않다면
			else
			{//동작
				eventService.insertAttendaceInfo(memberVO.getId());
				//총 출석일수 계산하는 서버로이동-> jsp
				mv.setViewName("redirect:showAttendanceMain.do?y="+y+"&m="+m);
			
			}
			
		return mv;
	}
	

	

	
}
	
	