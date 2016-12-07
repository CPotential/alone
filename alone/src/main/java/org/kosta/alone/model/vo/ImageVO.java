package org.kosta.alone.model.vo;

public class ImageVO {
	private int boardNo;
	private int imageNo;
	private String imageName;

	public ImageVO() {
		super();
	}

	public ImageVO(int boardNo, int imageNo, String imageName) {
		super();
		this.boardNo = boardNo;
		this.imageNo = imageNo;
		this.imageName = imageName;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
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

	@Override
	public String toString() {
		return "ImageVO [boardNo=" + boardNo + ", imageNo=" + imageNo + ", imageName=" + imageName + "]";
	}

}
