package org.kosta.alone.model.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.alone.model.dao.EventDAO;
import org.kosta.alone.model.dao.GenericMemberDAO;
import org.kosta.alone.model.dao.MemberDAO;

import org.springframework.stereotype.Service;

@Service
public class EventServiceImpl implements EventService {
	@Resource
	private MemberDAO memberDAO;
	@Resource
	private GenericMemberDAO genericMemberDAO;
	@Resource
	private EventDAO eventDAO;

	private int mileage = 100;

	@Override
	public int attendanceCheck(String id) {

		return eventDAO.countAttendance(id);

	}

	@Override
	public void insertAttendaceInfo(String id) {

		// 마일리지 정보 저장
		eventDAO.insertAttendaceInfo(id);

		// 마일리지 거래내역 추가
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", id);
		map.put("dealMoney", mileage);

		eventDAO.insertMileageHistory(map);
		// 마일리지 증가
		genericMemberDAO.updateMileage(map);

	}

	@Override
	public int ShowAttendDay(String id) {

		// 출석일수 뽑아 리턴
		return eventDAO.ShowAttendDay(id);
	}

	@Override
	public HashMap<String, Object> attendanceList(String id, String y, String m) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		String ym = y + "/" + m + "%";

		// 파라미터 맵으로 전달
		paramMap.put("id", id);
		paramMap.put("ym", ym);

		// dao호출

		// 결과를 map으로 리턴

		int totalDay = eventDAO.ShowAttendDay(id);

		// 총출석일수 리턴
		resultMap.put("totalDay", totalDay);
		// List<Object> 출석 날짜 리턴
		List<Object> myDay = eventDAO.attendanceList(paramMap);

		resultMap.put("myDay", myDay);
		return resultMap;

	}

}
