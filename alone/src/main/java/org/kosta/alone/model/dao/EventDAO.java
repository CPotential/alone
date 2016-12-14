package org.kosta.alone.model.dao;

import java.util.HashMap;
import java.util.List;

public interface EventDAO {

	/**
	 * 현재 날짜에 출석도니 정보가 있는지 확인
	 * @param id
	 * @return
	 */
	int countAttendance(String id);

	/**
	 * 회원 출석 정보 저장
	 * @param id
	 */

	void insertAttendaceInfo(String id);

	void insertMileageHistory(HashMap<String, Object> map);

	int ShowAttendDay(String id);

	List<Object> attendanceList(HashMap<String, Object> paramMap);

}