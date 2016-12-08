package org.kosta.alone.model.vo;

import java.util.List;

public class BoardVO {
	private int boardNo;
	private String content;
	private String timePosted;
	private int boardEnabled;
	private MemberVO memberVO;
	private List<ImageVO> imageVO;
	
	
	public BoardVO() {
		super();
	}

	public BoardVO(int boardNo, String content, String timePosted, int boardEnabled, MemberVO memberVO,
			List<ImageVO> imageVO) {
		super();
		this.boardNo = boardNo;
		this.content = content;
		this.timePosted = timePosted;
		this.boardEnabled = boardEnabled;
		this.memberVO = memberVO;
		this.imageVO = imageVO;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTimePosted() {
		return timePosted;
	}

	public void setTimePosted(String timePosted) {
		this.timePosted = timePosted;
	}

	public int getBoardEnabled() {
		return boardEnabled;
	}

	public void setBoardEnabled(int boardEnabled) {
		this.boardEnabled = boardEnabled;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public List<ImageVO> getImageVO() {
		return imageVO;
	}

	public void setImageVO(List<ImageVO> imageVO) {
		this.imageVO = imageVO;
	}

	@Override
	public String toString() {
		return "BoardVO [boardNo=" + boardNo + ", content=" + content + ", timePosted=" + timePosted + ", boardEnabled="
				+ boardEnabled + ", memberVO=" + memberVO + ", imageVO=" + imageVO + "]";
	}

}
