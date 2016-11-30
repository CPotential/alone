package org.kosta.alone.model.vo;

public class GenericMemberVO extends MemberVO{
	
	private String birth;
	private String gender;
	private int mileage;
	private MileageVO mileageVO;
	
	public GenericMemberVO() {
		super();
	}

	public GenericMemberVO(String id, String password, String name, String nickName, String tel, String birth, String gender, int mileage, MileageVO mileageVO) {
		super(id, password, name, nickName, tel);
}

	public GenericMemberVO(String id, String password, String name, String nickName, String tel, String authority,int enabled) {
		super(id, password, name, nickName, tel,authority,enabled);
	}
	public GenericMemberVO(String birth, String gender, int mileage, MileageVO mileageVO) {
		super();
		this.birth = birth;
		this.gender = gender;
		this.mileage = mileage;
		this.mileageVO = mileageVO;
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
	public MileageVO getMileageVO() {
		return mileageVO;
	}
	public void setMileageVO(MileageVO mileageVO) {
		this.mileageVO = mileageVO;
	}
	
	
	@Override
	public String toString() {
		return super.toString() + "GenericMemberVO [birth=" + birth + ", gender=" + gender + ", mileage=" + mileage + ", mileageVO="
				+ mileageVO + "]";
	}
	
}
