package org.kosta.alone;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;

import org.kosta.alone.model.dao.IntroduceDAO;
import org.kosta.alone.model.service.BoardService;

import org.kosta.alone.model.dao.CommonMemberDAO;
import org.kosta.alone.model.dao.ReviewDAO;
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
	ReviewDAO dao;
	@Resource
	CommonMemberDAO cdao;

	@Test
	public void test(){
		//System.out.println(boardService.introduceList(1));
		MemberVO vo = new MemberVO();
		vo.setId("spring");
		vo.setPassword("1234");
		vo=cdao.adminApproval(vo);
		System.out.println(vo);
	}
}
