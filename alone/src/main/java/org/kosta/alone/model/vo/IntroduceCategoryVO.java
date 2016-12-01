package org.kosta.alone.model.vo;

public class IntroduceCategoryVO {
	private int categoryNo;
	private String categoryName;

	public IntroduceCategoryVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public IntroduceCategoryVO(int categoryNo, String categoryName) {
		super();
		this.categoryNo = categoryNo;
		this.categoryName = categoryName;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "IntroduceCategoryVO [categoryNo=" + categoryNo + ", categoryName=" + categoryName + "]";
	}



}
