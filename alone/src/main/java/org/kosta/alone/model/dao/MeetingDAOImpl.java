package org.kosta.alone.model.dao;

import java.util.List;
import javax.annotation.Resource;

import org.kosta.alone.model.vo.MeetingVO;
import org.kosta.alone.model.vo.PagingBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MeetingDAOImpl implements MeetingDAO {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	public List<MeetingVO> getMeetingList(PagingBean pagingBean) {
		return sqlSessionTemplate.selectList("meeting.getMeetingList", pagingBean);
	}

	public List<MeetingVO> getMeetingRegionList(String region) {
		return sqlSessionTemplate.selectList("meeting.getMeetingRegionList", region);
	}

	public List<MeetingVO> findNameMeetingList(String search) {
		return sqlSessionTemplate.selectList("meeting.findNameMeetingList", search);
	}

	public List<MeetingVO> findTitleMeetingList(String search) {
		return sqlSessionTemplate.selectList("meeting.findTitleMeetingList", search);
	}

	public List<MeetingVO> getRegionInfo() {
		return sqlSessionTemplate.selectList("meeting.getRegionInfo");
	}

	@Override
	public void boardWrite(MeetingVO meetingVO) {
		sqlSessionTemplate.insert("meeting.boardWrite", meetingVO);
	}

	@Override
	public void meetingWrite(MeetingVO meetingVO) {
		sqlSessionTemplate.insert("meeting.meetingWrite", meetingVO);
	}

	@Override
	public MeetingVO meetingDetail(int boardNo) {

		return sqlSessionTemplate.selectOne("meeting.meetingDetail",boardNo);

	}

	@Override
	public int getTotalContentCount() {
		return sqlSessionTemplate.selectOne("meeting.getTotalContentCount");
	}

	@Override
	public void updateHit(int boardNo) {
			sqlSessionTemplate.update("meeting.updateHitBoard",boardNo);
	}

}
