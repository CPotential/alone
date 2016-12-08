package org.kosta.alone.model.dao;

import java.util.List;

import org.kosta.alone.model.vo.MeetingVO;
import org.kosta.alone.model.vo.PagingBean;

public interface MeetingDAO {
	public List<MeetingVO> getMeetingList(PagingBean pagingBean);

	public List<MeetingVO> getMeetingRegionList(String region);

	public List<MeetingVO> findNameMeetingList(String search);

	public List<MeetingVO> findTitleMeetingList(String search);

	public List<MeetingVO> getRegionInfo();

	public void boardWrite(MeetingVO meetingVO);

	public void meetingWrite(MeetingVO meetingVO);
	
	public MeetingVO meetingDetail(int boardNo);

	
	public int getTotalContentCount();


	public void meetingUpdate(MeetingVO meetingVO);

}