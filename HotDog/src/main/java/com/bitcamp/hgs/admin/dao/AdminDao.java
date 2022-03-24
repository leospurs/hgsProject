package com.bitcamp.hgs.admin.dao;

import java.util.List;

import com.bitcamp.hgs.admin.domain.Admin;
import com.bitcamp.hgs.admin.domain.AdminBoardRequest;
import com.bitcamp.hgs.admin.domain.BoardDetail;
import com.bitcamp.hgs.admin.domain.BoardEditReq;
import com.bitcamp.hgs.admin.domain.BoardList;

public interface AdminDao {
	
	public Admin checkAdminIdPw(String email);

	public int writeBoard(AdminBoardRequest boardReq);

	public List<BoardList> selectEventBoardList(int i, int index, int cOUNT_PER_PAGE);

	public BoardDetail selectBoard(int idx);

	public int editBoard(BoardEditReq editReq);

	public int selectTotalCount(int i);
	
}
