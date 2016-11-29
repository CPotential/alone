package org.kosta.alone.model.vo;

import org.kosta.alone.model.vo.MemberVO;

public class IntroduceBoardVO extends BoardVO{
	private String companyName;
	private String region;
	private String location;
	private String businessHours;
	private String tel;
	private KeyWordVO keyWordVO;
	private IntroduceCategoryVO categoryVO;
	
	public IntroduceBoardVO() {
		super();
	}
	public IntroduceBoardVO(int boardNo, String content, String timePosted, int boardEnabled, MemberVO memberVO,
			ImageVO imageVO) {
		super(boardNo, content, timePosted, boardEnabled, memberVO, imageVO);
	}
	public IntroduceBoardVO(String companyName, String region, String location, String businessHours, String tel,
			KeyWordVO keyWordVO, IntroduceCategoryVO categoryVO) {
		super();
		this.companyName = companyName;
		this.region = region;
		this.location = location;
		this.businessHours = businessHours;
		this.tel = tel;
		this.keyWordVO = keyWordVO;
		this.categoryVO = categoryVO;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getBusinessHours() {
		return businessHours;
	}
	public void setBusinessHours(String businessHours) {
		this.businessHours = businessHours;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public KeyWordVO getKeyWordVO() {
		return keyWordVO;
	}
	public void setKeyWordVO(KeyWordVO keyWordVO) {
		this.keyWordVO = keyWordVO;
	}
	public IntroduceCategoryVO getCategoryVO() {
		return categoryVO;
	}
	public void setCategoryVO(IntroduceCategoryVO categoryVO) {
		this.categoryVO = categoryVO;
	}
	@Override
	public String toString() {
		return super.toString() + "IntroduceBoardVO [companyName=" + companyName + ", region=" + region + ", location=" + location
				+ ", businessHours=" + businessHours + ", tel=" + tel + ", keyWordVO=" + keyWordVO + ", categoryVO="
				+ categoryVO + "]";
	}
	
}
