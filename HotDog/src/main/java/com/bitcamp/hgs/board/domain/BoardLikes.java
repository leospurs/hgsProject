package com.bitcamp.hgs.board.domain;

public class BoardLikes {
	
	private int boardIdx;	// 게시물 번호
	private int memberIdx;	// 회원 번호
	
	public BoardLikes(int boardIdx, int memberIdx) {
		this.boardIdx = boardIdx;
		this.memberIdx = memberIdx;
	}
	
	public BoardLikes() {}

	public int getBoardIdx() {
		return boardIdx;
	}

	public void setBoardIdx(int boardIdx) {
		this.boardIdx = boardIdx;
	}

	public int getMemberIdx() {
		return memberIdx;
	}

	public void setMemberIdx(int memberIdx) {
		this.memberIdx = memberIdx;
	}

	@Override
	public String toString() {
		return "BoardLikes [boardIdx=" + boardIdx + ", memberIdx=" + memberIdx + "]";
	}
	
	
	
}
