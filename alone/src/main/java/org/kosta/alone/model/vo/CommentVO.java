package org.kosta.alone.model.vo;

import org.kosta.alone.model.vo.MemberVO;

public class CommentVO {
	private int commentNo;
	private int boardNo;
	private String content;
	private String timePosted;
	private MemberVO memberVO;

	public CommentVO() {
		super();
	}

	public CommentVO(int commentNo, int boardNo, String content, String timePosted, MemberVO memberVO) {
		super();
		this.commentNo = commentNo;
		this.boardNo = boardNo;
		this.content = content;
		this.timePosted = timePosted;
		this.memberVO = memberVO;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
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

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	@Override
	public String toString() {
		return super.toString() + "CommentVO [commentNo=" + commentNo + ", boardNo=" + boardNo + ", content=" + content
				+ ", timePosted=" + timePosted + ", memberVO=" + memberVO + "]";
	}

}
