package org.kosta.alone.model.vo;

public class MileageVO {
	private String id;
	private int mileageNo;
	private int dealMileage;
	private String dealDetail;

	public MileageVO() {
		super();
	}

	public MileageVO(String id, int mileageNo, int dealMileage, String dealDetail) {
		super();
		this.id = id;
		this.mileageNo = mileageNo;
		this.dealMileage = dealMileage;
		this.dealDetail = dealDetail;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getMileageNo() {
		return mileageNo;
	}

	public void setMileageNo(int mileageNo) {
		this.mileageNo = mileageNo;
	}

	public int getDealMileage() {
		return dealMileage;
	}

	public void setDealMileage(int dealMileage) {
		this.dealMileage = dealMileage;
	}

	public String getDealDetail() {
		return dealDetail;
	}

	public void setDealDetail(String dealDetail) {
		this.dealDetail = dealDetail;
	}

	@Override
	public String toString() {
		return "MileageVO [id=" + id + ", mileageNo=" + mileageNo + ", dealMileage=" + dealMileage + ", dealDetail="
				+ dealDetail + "]";
	}

}
