package com.bitcamp.hgs.board.domain;

public class BoardHashtags {

	private int boardIdx; // 게시물 번호
	private int hashtagIdx; // 해시태그 번호

	public BoardHashtags() {
	}

	public BoardHashtags(int boardIdx, int hashtagIdx) {
		super();
		this.boardIdx = boardIdx;
		this.hashtagIdx = hashtagIdx;
	}

	public int getBoardIdx() {
		return boardIdx;
	}

	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}

	public int getHashtagIdx() {
		return hashtagIdx;
	}

	public void setHashtagIdx(int hashtagIdx) {
		this.hashtagIdx = hashtagIdx;
	}
	
	
}
