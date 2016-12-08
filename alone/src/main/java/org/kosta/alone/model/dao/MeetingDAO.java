package org.kosta.alone.model.dao;

import java.util.List;
import java.util.Map;

import org.kosta.alone.model.vo.MeetingVO;
import org.kosta.alone.model.vo.PagingBean;

public interface MeetingDAO {
	public List<MeetingVO> meetingList(PagingBean pagingBean);

	public List<MeetingVO> getMeetingRegionList(String region);

	public List<MeetingVO> getRegionInfo();

	public void boardWrite(MeetingVO meetingVO);

	public void meetingWrite(MeetingVO meetingVO);
	
	public MeetingVO meetingDetail(int boardNo);
	
	public int getTotalContentCount();

	public int getTitleSearchCount(String searchKeyWord);

	public int getWriterSearchCount(String searchKeyWord);

	public List<MeetingVO> meetingTitleSearchList(Map<String, Object> map);

	public List<MeetingVO> meetingWriterSearchList(Map<String, Object> map);

}