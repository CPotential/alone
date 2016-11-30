package org.kosta.alone;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.alone.model.dao.IntroduceDAO;
import org.kosta.alone.model.service.BoardService;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring-model.xml" })

public class TestUnit {
	@Resource
	private IntroduceDAO introduceDAO;
	
	@Resource
	private BoardService service;
	
	@Test
	public void test(){
		System.out.println(service.introduceList(1));
	}
}









