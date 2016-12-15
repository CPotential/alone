package org.kosta.alone;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.alone.model.dao.IntroduceDAO;
import org.kosta.alone.model.dao.MeetingDAO;
import org.kosta.alone.model.dao.MemberDAO;
import org.kosta.alone.model.dao.ReviewDAO;
import org.kosta.alone.model.service.BoardService;
import org.kosta.alone.model.service.MemberService;
import org.kosta.alone.model.vo.PagingBean;
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
	private MemberDAO memberDAO;
	@Resource
	private MemberService memberService;

	@Test
	public void test(){
		PagingBean pagingBean = null;
		Map<String, Object> map = new HashMap<String, Object>();
		pagingBean = new PagingBean(5);
		pagingBean.setContentNumberPerPage(10);
	    pagingBean.setPageNumberPerPageGroup(5);
		String searchKeyWord = "123";
		map.put("keyWord", searchKeyWord);
	    map.put("pb", pagingBean);
	    System.out.println(meetingDAO.meetingTitleSearchList(map));
	    
	}
}
