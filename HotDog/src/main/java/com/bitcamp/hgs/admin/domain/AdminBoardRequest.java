package com.bitcamp.hgs.admin.domain;

public class AdminBoardRequest {
	private int adminBoardIdx;
	private int adminBoardListIdx;
	private int adminIdx;
	private String title;
	private String content;
	private String createDate;
	private String editDate;
	private String deleteDate;
	private int exist;
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
	public int getAdminIdx() {
		return adminIdx;
	}
	public void setAdminIdx(int adminIdx) {
		this.adminIdx = adminIdx;
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
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getEditDate() {
		return editDate;
	}
	public void setEditDate(String editDate) {
		this.editDate = editDate;
	}
	public String getDeleteDate() {
		return deleteDate;
	}
	public void setDeleteDate(String deleteDate) {
		this.deleteDate = deleteDate;
	}
	public int getExist() {
		return exist;
	}
	public void setExist(int exist) {
		this.exist = exist;
	}
	@Override
	public String toString() {
		return "AdminBoardRequest [adminBoardIdx=" + adminBoardIdx + ", adminBoardListIdx=" + adminBoardListIdx
				+ ", adminIdx=" + adminIdx + ", title=" + title + ", content=" + content + ", createDate=" + createDate
				+ ", editDate=" + editDate + ", deleteDate=" + deleteDate + ", exist=" + exist + "]";
	}

	

}
