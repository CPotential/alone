package org.kosta.alone;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.alone.model.dao.EventDAO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring-model.xml" })

public class TestUnit2 {
	@Resource
	private EventDAO eventDAO;


	@Test
	public void test(){
		HashMap<String, Object> paramMap =new HashMap<String, Object>();
		HashMap<String, Object> resultMap =new HashMap<String, Object>();
		 
		String ym="2016/12";
		ym+="%";
		
		System.out.println(ym);
		paramMap.put("id", "mimi");
		paramMap.put("ym", ym);
		int totalDay =eventDAO.ShowAttendDay("mimi");
		List<Object> myDay = eventDAO.attendanceList(paramMap);
	
		resultMap.put("totalDay", totalDay);
		resultMap.put("myDay",myDay);
		
		//resultMap 잘저장되어서 꺼내올수 있을까?
		//System.out.println(resultMap.get("totalDay"));
		int dd = (int)resultMap.get("totalDay");
		
		System.out.println(dd);
	  //List<Object>list =resultMap.get("myDay");
		
		
		//int로 받아오기
/*	    
		  int[] list =(int[]) resultMap.get("myDay");
		  
		  
		  for(int i=0; i<list.length; i++){
			  
			  System.out.println(list[i]);
		  }*/
		
		//List<Object>로 받아오기
		
       // List<Object> list =(List<Object>) resultMap.get("myDay");
ArrayList<Object> list =(ArrayList<Object>) resultMap.get("myDay");
		  
		  for(int i=0; i<list.size(); i++){
			  
			  System.out.println(list.get(i));
		  }
		
	}
}
