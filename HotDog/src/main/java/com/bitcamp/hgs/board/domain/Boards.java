package com.bitcamp.hgs.board.domain;

import java.sql.Timestamp;

public class Boards {
	
	private int boardIdx;
	private int memberIdx = 1;
	private String title;
	private String content;
	private Timestamp createDate;
	private Timestamp editDate;
	private Timestamp deleteDate;
	private boolean exist;
	
	public Boards(){}
	
	public Boards(int boardIdx, int memberIdx, String title, String content, Timestamp createDate, Timestamp editDate,
			Timestamp deleteDate, boolean exist) {
		
		this.boardIdx = boardIdx;
		this.memberIdx = memberIdx;
		this.title = title;
		this.content = content;
		this.createDate = createDate;
		this.editDate = editDate;
		this.deleteDate = deleteDate;
		this.exist = exist;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public Timestamp getDeleteDate() {
		return deleteDate;
	}

	public void setDeleteDate(Timestamp deleteDate) {
		this.deleteDate = deleteDate;
	}

	public boolean isExist() {
		return exist;
	}

	public void setExist(boolean exist) {
		this.exist = exist;
	}

	@Override
	public String toString() {
		return "Boards [boardIdx=" + boardIdx + ", memberIdx=" + memberIdx + ", title=" + title + ", content=" + content
				+ ", createDate=" + createDate + ", editDate=" + editDate + ", deleteDate=" + deleteDate + ", exist="
				+ exist + "]";
	}
	
	
}
