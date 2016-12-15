package org.kosta.alone.model.vo;

public class CompanyMemberVO extends MemberVO {
	private String company;
	private String address;
	private String corporateRegistrationNumber;
	private String write;

	public CompanyMemberVO() {
		super();
	}

	public CompanyMemberVO(String id, String password, String name, String nickName, String tel, int enabled,
			String company, String address, String corporateRegistrationNumber, String write) {
		super(id, password, name, nickName, tel, enabled);
		this.company = company;
		this.address = address;
		this.corporateRegistrationNumber = corporateRegistrationNumber;
		this.write = write;
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

	public String getWrite() {
		return write;
	}

	public void setWrite(String write) {
		this.write = write;
	}

	@Override
	public String toString() {
		return "CompanyMemberVO [company=" + company + ", address=" + address + ", corporateRegistrationNumber="
				+ corporateRegistrationNumber + ", write=" + write + "]";
	}

}
