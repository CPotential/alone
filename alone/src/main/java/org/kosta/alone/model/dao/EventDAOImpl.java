package org.kosta.alone.model.dao;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class EventDAOImpl implements EventDAO {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int countAttendance(String id) {

		return sqlSessionTemplate.selectOne("event.countAttendance", id);
	}

	@Override
	public void insertAttendaceInfo(String id) {
		sqlSessionTemplate.insert("event.insertAttendaceInfo", id);

	}

	@Override
	public void insertMileageHistory(HashMap<String, Object> map) {

		sqlSessionTemplate.insert("event.insertMileageHistroy", map);

	}

	@Override
	public int ShowAttendDay(String id) {

		return sqlSessionTemplate.selectOne("event.ShowAttendDay", id);
	}

	@Override
	public List<Object> attendanceList(HashMap<String, Object> paramMap) {

		return (List<Object>) sqlSessionTemplate.selectList("event.attendanceList", paramMap);

	}

}
