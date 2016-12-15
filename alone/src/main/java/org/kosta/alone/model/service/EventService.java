package org.kosta.alone.model.service;

import java.util.HashMap;
import java.util.List;

public interface EventService {





	int attendanceCheck(String id);

	void insertAttendaceInfo(String id);

	int ShowAttendDay(String id);

	public HashMap<String, Object> attendanceList(String id,String y,String m);



}
