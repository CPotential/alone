package org.kosta.alone.model.vo;

public class ImageVO {
	
	private int boardNo;
	private int imageNo;
	private String imageName;
	private String originalFileName;



	public ImageVO() {
		super();
	}
	
	public ImageVO( String imageName, int boardNo){
		this.imageName = imageName;
		this.boardNo = boardNo;
	}

	public ImageVO(int imageNo, String imageName, String originalFileName ,int boardNo) {

		super();
		this.imageNo = imageNo;
		this.imageName = imageName;
		this.originalFileName = originalFileName;
		this.boardNo = boardNo;
	}

	public int getBoardNO() {
		return boardNo;
	}

	public void setBoardNO(int boardNO) {
		this.boardNo = boardNO;
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
	
	public String getOriginalFileName() {
		return originalFileName;
	}


	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}

	@Override
	public String toString() {
		return "ImageVO [boardNo=" + boardNo + ", imageNo=" + imageNo + ", imageName=" + imageName
				+ ", originalFileName=" + originalFileName + "]";
	}

}
