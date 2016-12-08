package org.kosta.alone.model.vo;

public class GenericMemberVO extends MemberVO {

	private String birth;
	private String gender;

	public GenericMemberVO() {
		super();
	}

	public GenericMemberVO(String id, String password, String name, String nickName, String tel, String authority,
			int enabled, String birth, String gender, int mileage, MileageVO mileageVO) {
		super(id, password, name, nickName, tel, authority, enabled);
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

	@Override
	public String toString() {
		return "GenericMemberVO [birth=" + birth + ", gender=" + gender + "]";
	}
}
