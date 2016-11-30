package org.kosta.alone.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.alone.model.dao.MeetingBoardDAO;
import org.kosta.alone.model.vo.MeetingVO;
import org.springframework.stereotype.Service;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Resource
	private MeetingBoardDAO meetingBoardDAO;
	
	public List<MeetingVO> getMeetingList(){
		return meetingBoardDAO.getMeetingList();
	}
	public List<MeetingVO> getMeetingRegionList(String region){
		return meetingBoardDAO.getMeetingRegionList(region);
	}
	
	public List<MeetingVO> findNameMeetingList(String search){
		return meetingBoardDAO.findNameMeetingList(search);
	}
	
	public List<MeetingVO> findTitleMeetingList(String search){
		return meetingBoardDAO.findTitleMeetingList(search); 
	}
	
	public List<MeetingVO> getRegionInfo(){
		return meetingBoardDAO.getRegionInfo();
	}
}
