package org.kosta.alone.model.vo;

import java.util.List;


public class ListVO<E>{
	private List<E> list;
	private PagingBean pagingBean;

	public ListVO() {
		super();
	}

	public ListVO(List<E> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}

	public List<E> getList() {
		return list;
	}

	public void setList(List<E> list) {
		this.list = list;
	}

	public PagingBean getPagingBean() {
		return pagingBean;
	}

	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}

	@Override
	public String toString() {
		return "List [list=" + list + ", pagingBean=" + pagingBean + "]";
	}
	
/*
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
*/
}
