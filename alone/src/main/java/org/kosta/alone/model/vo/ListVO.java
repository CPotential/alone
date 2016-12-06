package org.kosta.alone.model.vo;

import java.util.List;


public class ListVO<E> {
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
	
}
