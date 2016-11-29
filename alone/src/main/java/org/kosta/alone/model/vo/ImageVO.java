package org.kosta.alone.model.vo;

public class ImageVO {
	private int imageNo;
	private String imageName;
	private String imageOriginalName;

	public ImageVO() {
		super();
	}

	public ImageVO(int imageNo, String imageName, String imageOriginalName) {
		super();
		this.imageNo = imageNo;
		this.imageName = imageName;
		this.imageOriginalName = imageOriginalName;
	}

	public int getImageNo() {
		return imageNo;
	}

	public void setImageNo(int imageNo) {
		this.imageNo = imageNo;
	}

	public String getImageName() {
		return imageName;
	}

	public void setImageName(String imageName) {
		this.imageName = imageName;
	}

	public String getImageOriginalName() {
		return imageOriginalName;
	}

	public void setImageOriginalName(String imageOriginalName) {
		this.imageOriginalName = imageOriginalName;
	}

	@Override
	public String toString() {
		return "ImageVO [imageNo=" + imageNo + ", imageName=" + imageName + ", imageOriginalName=" + imageOriginalName
				+ "]";
	}

}
