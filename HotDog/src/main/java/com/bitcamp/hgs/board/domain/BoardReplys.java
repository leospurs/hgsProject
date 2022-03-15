package com.bitcamp.hgs.board.domain;

import java.sql.Timestamp;

public class BoardReplys {
	
	private int boardReplyIdx;		// 게시물 댓글 번호
	private int boardIdx;			// 게시물 번호
	private int memberIdx;			// 회원 번호
	private String name;			// 회원 이름
	private String content;			// 게시물 댓글 내용
	private Timestamp createDate;	// 게시물 댓글 등록 날짜
	private Timestamp editDate;		// 게시물 댓글 수정 날짜
	
	public BoardReplys() {}

	public BoardReplys(int boardReplyIdx, int boardIdx, int memberIdx, String name, String content, Timestamp createDate,
			Timestamp editDate) {
		this.boardReplyIdx = boardReplyIdx;
		this.boardIdx = boardIdx;
		this.memberIdx = memberIdx;
		this.name = name;
		this.content = content;
		this.createDate = createDate;
		this.editDate = editDate;
	}

	public int getBoardReplyIdx() {
		return boardReplyIdx;
	}

	public void setBoardReplyIdx(int boardReplyIdx) {
		this.boardReplyIdx = boardReplyIdx;
	}

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
	
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public Timestamp getEditDate() {
		return editDate;
	}

	public void setEditDate(Timestamp editDate) {
		this.editDate = editDate;
	}

	@Override
	public String toString() {
		return "BoardReplys [boardReplyIdx=" + boardReplyIdx + ", boardIdx=" + boardIdx + ", memberIdx=" + memberIdx
				+ ", content=" + content + ", createDate=" + createDate + ", editDate=" + editDate + "]";
	}
	
	
	
	

	
}
