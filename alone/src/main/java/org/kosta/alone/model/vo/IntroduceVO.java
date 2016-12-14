package org.kosta.alone.model.vo;

import java.util.List;

public class IntroduceVO extends BoardVO {
	private String companyName;
	private String region;
	private String location;
	private String businessHours;
	private String tel;
	private String keyword;
	private List<KeyWordVO> keyWordVO;
	private IntroduceCategoryVO categoryVO;

	
	//디폴트 생성자
	public IntroduceVO() {
		super(); //상위 클래스의 디폴트 생성자 호출
	}

	public IntroduceVO(int boardNo, String content, String timePosted, int boardEnabled,int likeCheck,MemberVO memberVO,
			List<ImageVO> imageVO, String companyName, String region, String location, String businessHours, String tel,
			List<KeyWordVO> keyWordVO, IntroduceCategoryVO categoryVO) {
		super(boardNo, content, timePosted, boardEnabled,likeCheck,memberVO, imageVO);
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

	public List<KeyWordVO> getKeyWordVO() {
		return keyWordVO;
	}

	public void setKeyWordVO(List<KeyWordVO> keyWordVO) {
		this.keyWordVO = keyWordVO;
	}

	public IntroduceCategoryVO getCategoryVO() {
		return categoryVO;
	}

	public void setCategoryVO(IntroduceCategoryVO categoryVO) {
		this.categoryVO = categoryVO;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "IntroduceVO [companyName=" + companyName + ", region=" + region + ", location=" + location
				+ ", businessHours=" + businessHours + ", tel=" + tel + ", keyword=" + keyword + ", keyWordVO="
				+ keyWordVO + ", categoryVO=" + categoryVO + "]";
	}


}
