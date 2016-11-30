package org.kosta.alone;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.alone.model.dao.CommonMemberDAO;
import org.kosta.alone.model.dao.ReviewDAO;
import org.kosta.alone.model.vo.MemberVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring-model.xml" })
public class TestUnit {
	
	@Resource
	ReviewDAO dao;
	@Resource
	CommonMemberDAO cdao;
	
	@Test
	public void test(){
		MemberVO vo = new MemberVO();
		vo.setId("java");
		vo.setPassword("1234");
		System.out.println(cdao.memberLogin(vo));
	}

}
