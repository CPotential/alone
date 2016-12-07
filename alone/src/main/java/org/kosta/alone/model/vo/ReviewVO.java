package org.kosta.alone.model.vo;

import java.util.List;

public class ReviewVO extends BoardVO {
	private String title;
	private int hits;
	private int likes;

	public ReviewVO() {
		super();
	}

	public ReviewVO(int boardNo, String content, String timePosted, int boardEnabled, MemberVO memberVO,
			List<ImageVO> imageVO, String title, int hits, int likes) {
		super(boardNo, content, timePosted, boardEnabled, memberVO, imageVO);
		this.title = title;
		this.hits = hits;
		this.likes = likes;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	@Override
	public String toString() {
		return super.toString() + "ReviewBoardVO [title=" + title + ", hits=" + hits + ", likes=" + likes + "]";
	}

}
