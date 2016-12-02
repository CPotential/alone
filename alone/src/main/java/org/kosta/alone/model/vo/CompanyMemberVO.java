package org.kosta.alone.model.vo;

public class CompanyMemberVO extends MemberVO {
	private String company;
	private String address;
	private String corporateRegistrationNumber;
	private String approval;
	private String write;
	

	public CompanyMemberVO() {
		super();
	}


	public CompanyMemberVO(String id, String password, String name, String nickName, String tel,String authority ,int enabled) {
		super(id, password, name, nickName, tel,authority ,enabled);
	}
 
	public CompanyMemberVO(String company, String address, String corporateRegistrationNumber) {
		super();
		this.company = company;
		this.address = address;
		this.corporateRegistrationNumber = corporateRegistrationNumber;
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

	
	public String getWrite() {
		return write;
	}


	public void setWrite(String write) {
		this.write = write;
	}


	@Override
	public String toString() {
		return "CompanyMemberVO [company=" + company + ", address=" + address + ", corporateRegistrationNumber="
				+ corporateRegistrationNumber + ", approval=" + approval + ", write=" + write + "]";
	}



}
