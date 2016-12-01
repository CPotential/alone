package org.kosta.alone.model.dao;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.alone.model.vo.MeetingVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MeetingBoardDAOImpl implements MeetingBoardDAO {
   
	@Resource
	private SqlSessionTemplate template;
	
	public List<MeetingVO> getMeetingList(){
		return template.selectList("meeting.getMeetingList");  
	}
	
	public List<MeetingVO> getMeetingRegionList(String region){
		return template.selectList("meeting.getMeetingRegionList",region);
	}
	
	public List<MeetingVO> findNameMeetingList(String search){
		return template.selectList("meeting.findNameMeetingList",search);
	}
	
	public List<MeetingVO> findTitleMeetingList(String search){ 
		return template.selectList("meeting.findTitleMeetingList",search);
	}
	
	public List<MeetingVO> getRegionInfo(){
		return template.selectList("meeting.getRegionInfo");
	}

	@Override
	public MeetingVO meetingDetail(String boardNo) {
	
		return template.selectOne("meeting.meetingDetail",boardNo);
	}
}
