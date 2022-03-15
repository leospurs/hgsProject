package com.bitcamp.hgs.board.domain;

import java.sql.Timestamp;

public class Boards {
	
	private int boardIdx;			// 게시물 번호
	private int memberIdx;			// 일반 회원 번호
	private String name;			// 일반 회원 이름
	private String title;			// 게시물 제목
	private String content;			// 게시물 내용
	private Timestamp createDate;	// 게시물 등록 날짜
	private Timestamp editDate;		// 게시물 수정 날짜
	private Timestamp deleteDate;	// 게시물 삭제 날짜
	private boolean exist;			// 게시물 존재 여부
	private String fileName;		// 게시물 첨부 파일 이름
	
	public Boards(){}
	
	public Boards(int boardIdx, int memberIdx, String name, String title, String content, Timestamp createDate, Timestamp editDate,
			Timestamp deleteDate, boolean exist, String fileName) {
		
		this.boardIdx = boardIdx;
		this.memberIdx = memberIdx;
		this.name = name;
		this.title = title;
		this.content = content;
		this.createDate = createDate;
		this.editDate = editDate;
		this.deleteDate = deleteDate;
		this.exist = exist;
		this.fileName = fileName;
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
	
	

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	@Override
	public String toString() {
		return "Boards [boardIdx=" + boardIdx + ", memberIdx=" + memberIdx + ", title=" + title + ", content=" + content
				+ ", createDate=" + createDate + ", editDate=" + editDate + ", deleteDate=" + deleteDate + ", exist="
				+ exist + "]";
	}
	
	
}
