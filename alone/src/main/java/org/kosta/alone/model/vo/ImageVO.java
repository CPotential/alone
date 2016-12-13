package org.kosta.alone.model.vo;



public class ImageVO {
	
	private int boardNo;
	private int imageNo;
	private String imageName;



	public ImageVO() {
		super();
	}

	public ImageVO(int imageNo, String imageName) {

		super();

		this.imageNo = imageNo;
		this.imageName = imageName;

	
	}
	public ImageVO( String imageName, int boardNo){
		this.imageName = imageName;
		this.boardNo = boardNo;
	}

	
	public ImageVO(int imageNo, String imageName, int boardNo) {
		super();
		this.imageNo = imageNo;
		this.imageName = imageName;
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





	@Override
	public String toString() {

		return "ImageVO [imageNo=" + imageNo + ", imageName=" + imageName + ", boardNo=" + boardNo 
				+"]";

	}



}
