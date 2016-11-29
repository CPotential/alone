package org.kosta.alone.model.vo;

import java.util.ArrayList;

import org.kosta.alone.model.vo.BoardVO;

public class ListVO {
	private ArrayList<BoardVO> boardList;
	private ArrayList<MemberVO> memberList;
	private PagingBean pagingBean;

	public ListVO() {
		super();
	}

	public ListVO(ArrayList<BoardVO> boardList, ArrayList<MemberVO> memberList, PagingBean pagingBean) {
		super();
		this.boardList = boardList;
		this.memberList = memberList;
		this.pagingBean = pagingBean;
	}

	public ArrayList<BoardVO> getBoardList() {
		return boardList;
	}

	public void setBoardList(ArrayList<BoardVO> boardList) {
		this.boardList = boardList;
	}

	public PagingBean getPagingBean() {
		return pagingBean;
	}

	public ArrayList<MemberVO> getMemberList() {
		return memberList;
	}

	public void setMemberList(ArrayList<MemberVO> memberList) {
		this.memberList = memberList;
	}

	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}

	@Override
	public String toString() {
		return "ListVO [boardList=" + boardList + ", memberList=" + memberList + ", pagingBean=" + pagingBean + "]";
	}

}
