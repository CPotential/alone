package org.kosta.alone.model.dao;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class CompanyMemberDAOImpl {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
}
