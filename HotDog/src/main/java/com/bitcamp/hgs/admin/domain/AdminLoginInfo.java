package com.bitcamp.hgs.admin.domain;

public class AdminLoginInfo {
	private int adminIdx;
	private String id;

	public AdminLoginInfo(int adminIdx, String id) {
		this.adminIdx = adminIdx;
		this.id = id;
	}

	public int getAdminIdx() {
		return adminIdx;
	}

	public void setAdminIdx(int adminIdx) {
		this.adminIdx = adminIdx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "AdminLoginInfo [adminIdx=" + adminIdx + ", id=" + id + "]";
	}

}
