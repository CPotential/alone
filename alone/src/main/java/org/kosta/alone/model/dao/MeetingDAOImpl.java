package org.kosta.alone.model.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.kosta.alone.model.vo.MeetingVO;
import org.kosta.alone.model.vo.PagingBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MeetingDAOImpl implements MeetingDAO {

	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	public List<MeetingVO> meetingList(PagingBean pagingBean) {
		return sqlSessionTemplate.selectList("meeting.meetingList", pagingBean);
	}

	public List<MeetingVO> getMeetingRegionList(String region) {
		return sqlSessionTemplate.selectList("meeting.getMeetingRegionList", region);
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

	/**
	 * 모임글 제목 검색 리스트 수
	 */
	@Override
	public int getTitleSearchCount(String searchKeyWord) {
		return sqlSessionTemplate.selectOne("meeting.getTitleSearchCount", searchKeyWord);
	}

	/**
	 * 모임글 제목 검색 리스트
	 */
	@Override
	public List<MeetingVO> meetingTitleSearchList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("meeting.meetingTitleSearchList", map);
	}
	
	/**
	 * 모임글 작성자 검섹 리스트 수
	 */
	@Override
	public int getWriterSearchCount(String searchKeyWord) {
		return sqlSessionTemplate.selectOne("meeting.getWriterSearchCount", searchKeyWord);
	}

	/**
	 * 모임글 작성자 검색 리스트
	 */
	@Override
	public List<MeetingVO> meetingWriterSearchList(Map<String, Object> map) {
		return sqlSessionTemplate.selectList("meeting.meetingWriterSearchList", map);
	}
	
	@Override
	public void updateHit(int boardNo) {
			sqlSessionTemplate.update("meeting.updateHitBoard",boardNo);
	}
	
	public void meetingUpdate(MeetingVO meetingVO) {
		sqlSessionTemplate.update("meeting.meetingUpdate", meetingVO);
	}
}
