package org.kosta.alone.model.vo;

public class KeyWordVO {
	private int keyWordNo;
	private String keyWordName;
    private int boardNo;
    
    
	public KeyWordVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public KeyWordVO(int keyWordNo, String keyWordName, int boardNo) {
		super();
		this.keyWordNo = keyWordNo;
		this.keyWordName = keyWordName;
		this.boardNo = boardNo;
	}


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public int getKeyWordNo() {
		return keyWordNo;
	}

	public void setKeyWordNo(int keyWordNo) {
		this.keyWordNo = keyWordNo;
	}

	public String getKeyWordName() {
		return keyWordName;
	}

	public void setKeyWordName(String keyWordName) {
		this.keyWordName = keyWordName;
	}

	@Override
	public String toString() {
		return "KeyWordVO [keyWordNo=" + keyWordNo + ", keyWordName=" + keyWordName + ", boardNo=" + boardNo + "]";
	}

}
