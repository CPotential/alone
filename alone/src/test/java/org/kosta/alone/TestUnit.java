package org.kosta.alone;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.alone.model.dao.CommonMemberDAO;
import org.kosta.alone.model.dao.GenericMemberDAO;
import org.kosta.alone.model.dao.IntroduceDAO;
import org.kosta.alone.model.dao.MeetingDAO;
import org.kosta.alone.model.dao.MemberDAO;
//github.com/CPotential/alone.git
import org.kosta.alone.model.dao.ReviewDAO;
import org.kosta.alone.model.service.BoardService;
import org.kosta.alone.model.vo.GenericMemberVO;
//github.com/CPotential/alone.git
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
	@Resource
	private GenericMemberDAO gmdao;
	@Resource
	private MemberDAO memberDAO;

	@Test
	public void test(){
		

		GenericMemberVO gmVO =new GenericMemberVO();
		gmVO.setId("java");
		gmVO.setNickName("착한커피");
		memberDAO.updateMember(gmVO);
		//gmdao.updateMember(gmVO);

		
	
	}
}
