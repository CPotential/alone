package org.kosta.alone.model.service;

import javax.annotation.Resource;

import org.kosta.alone.model.dao.ReviewDAO;
import org.springframework.stereotype.Service;

@Service
public class ReviewServiceImpl {
	
	@Resource
	private ReviewDAO reviewDAO;
	

}
