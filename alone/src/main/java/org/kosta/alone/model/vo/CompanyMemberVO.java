package org.kosta.alone.model.vo;

public class CompanyMemberVO extends MemberVO {
	private String company;
	private String address;
	private String corporateRegistrationNumber;
	private String approval;

	public CompanyMemberVO() {
		super();
	}

	public CompanyMemberVO(String id, String password, String name, String nickName, String tel, int enabled) {
		super(id, password, name, nickName, tel, enabled);
	}

	public CompanyMemberVO(String company, String address, String corporateRegistrationNumber, String approval) {
		super();
		this.company = company;
		this.address = address;
		this.corporateRegistrationNumber = corporateRegistrationNumber;
		this.approval = approval;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCorporateRegistrationNumber() {
		return corporateRegistrationNumber;
	}

	public void setCorporateRegistrationNumber(String corporateRegistrationNumber) {
		this.corporateRegistrationNumber = corporateRegistrationNumber;
	}

	public String getApproval() {
		return approval;
	}

	public void setApproval(String approval) {
		this.approval = approval;
	}

	@Override
	public String toString() {
		return super.toString() + "CompanyMemberVO [company=" + company + ", address=" + address
				+ ", corporateRegistrationNumber=" + corporateRegistrationNumber + ", approval=" + approval + "]";
	}

}
