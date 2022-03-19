package com.bitcamp.hgs.admin.domain;

public class Admin {
	private int adminIdx;
	private String id;
	private String password;

	
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
	@Override
	public String toString() {
		return "Admin [adminIdx=" + adminIdx + ", id=" + id + ", password=" + password + "]";
	}

	public AdminLoginInfo getLoginInfo() {
		return new AdminLoginInfo(adminIdx,id);
	}
}
