package com.bitcamp.hgs.admin.domain;

public class BoardEditReq {

	private int adminBoardIdx;
	private int adminBoardListIdx;
	private String title;
	private String content;
	private String editDate;

	public int getAdminBoardIdx() {
		return adminBoardIdx;
	}

	public void setAdminBoardIdx(int adminBoardIdx) {
		this.adminBoardIdx = adminBoardIdx;
	}

	public int getAdminBoardListIdx() {
		return adminBoardListIdx;
	}

	public void setAdminBoardListIdx(int adminBoardListIdx) {
		this.adminBoardListIdx = adminBoardListIdx;
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

	public String getEditDate() {
		return editDate;
	}

	public void setEditDate(String editDate) {
		this.editDate = editDate;
	}

	@Override
	public String toString() {
		return "BoardEditReq [adminBoardIdx=" + adminBoardIdx + ", adminBoardListIdx=" + adminBoardListIdx + ", title="
				+ title + ", content=" + content + ", editDate=" + editDate + "]";
	}
}
