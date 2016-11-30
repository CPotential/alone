package org.kosta.alone.model.service;

import java.util.List;

import org.kosta.alone.model.vo.MeetingVO;

public interface BoardService { 
	public List<MeetingVO> getMeetingList();
	public List<MeetingVO> getMeetingRegionList(String region);
	public List<MeetingVO> findNameMeetingList(String search);
	public List<MeetingVO> findTitleMeetingList(String search);
	public List<MeetingVO> getRegionInfo();
}