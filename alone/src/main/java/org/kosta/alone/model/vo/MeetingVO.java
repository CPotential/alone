package org.kosta.alone.model.vo;

import org.kosta.alone.model.vo.MemberVO;

public class MeetingVO extends BoardVO{
	private String title;
	private String region;
	private String location;
	private String interest;
	private int hits;
	
	public MeetingVO() {
		super();
	}
	public MeetingVO(int boardNo, String content, String timePosted, int boardEnabled, MemberVO memberVO,
			ImageVO imageVO) {
		super(boardNo, content, timePosted, boardEnabled, memberVO, imageVO);
	}
	public MeetingVO(String title, String region, String location, String interest, int hits) {
		super();
		this.title = title;
		this.region = region;
		this.location = location;
		this.interest = interest;
		this.hits = hits;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	@Override
	public String toString() {
		return super.toString() + "MeetingBoardVO [title=" + title + ", region=" + region + ", location=" + location + ", interest="
				+ interest + ", hits=" + hits + "]";
	}
	
	
}
