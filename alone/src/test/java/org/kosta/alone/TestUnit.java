package org.kosta.alone;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.alone.model.dao.CommonMemberDAO;
import org.kosta.alone.model.dao.IntroduceDAO;
import org.kosta.alone.model.dao.MeetingDAO;
import org.kosta.alone.model.dao.ReviewDAO;
import org.kosta.alone.model.service.BoardService;
import org.kosta.alone.model.vo.MeetingVO;
import org.kosta.alone.model.vo.MemberVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring-model.xml" })

public class TestUnit {
	@Resource
	private IntroduceDAO introduceDAO;
	@Resource
	private BoardService boardService;
	@Resource
	private MeetingDAO meetingDAO;
	@Resource
	ReviewDAO dao;
	@Resource
	CommonMemberDAO cdao;

	@Test
	public void test(){
		MeetingVO meetingVO = new MeetingVO();
		MemberVO memberVO = new MemberVO();
		memberVO.setId("json");
		meetingVO.setMemberVO(memberVO);
		meetingVO.setContent("123wefga");
		meetingVO.setTimePosted("16/12/01");
		meetingVO.setTitle("제목");
		meetingVO.setRegion("판교");
		meetingVO.setLocation("판교 유스페이스");
		meetingVO.setInterest("오진석 졸잼");
		System.out.println(meetingVO);
		boardService.meetingWrite(meetingVO);
		/*System.out.println(boardService.introduceCategoryList());
		System.out.println(boardService.introduceList(1));

		MemberVO vo = new MemberVO();
		vo.setId("spring");
		vo.setPassword("1234");
		vo=cdao.adminApproval(vo);
		System.out.println(vo);*/
	}
}
