package org.kosta.alone.model.vo;

public class GenericMemberVO extends MemberVO {

	private String birth;
	private String gender;
	private int mileage;

	public GenericMemberVO() {
		super();
	}

	public GenericMemberVO(String id, String password, String name, String nickName, String tel, 
			int enabled, String birth, String gender, int mileage) {
		super(id, password, name, nickName, tel, enabled);
		this.birth = birth;
		this.gender = gender;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}

	@Override
	public String toString() {
		return "GenericMemberVO [birth=" + birth + ", gender=" + gender + "]";
	}
}
