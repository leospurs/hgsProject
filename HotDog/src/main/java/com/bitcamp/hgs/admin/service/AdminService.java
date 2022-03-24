package com.bitcamp.hgs.admin.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.hgs.admin.dao.AdminDao;
import com.bitcamp.hgs.admin.domain.AdminBoardListView;
import com.bitcamp.hgs.admin.domain.AdminBoardRequest;
import com.bitcamp.hgs.admin.domain.AdminLoginInfo;
import com.bitcamp.hgs.admin.domain.BoardDetail;
import com.bitcamp.hgs.admin.domain.BoardEditReq;
import com.bitcamp.hgs.admin.domain.BoardList;

@Service
public class AdminService {

	private AdminDao dao;

	@Autowired
	private SqlSessionTemplate template;

	// 페이지 당 표현할 추천 게시물 개수
	private final int COUNT_PER_PAGE = 15;

	// 페이징 번호 노출 개수
	private final int COUNT_PER_PAGING_NUM = 5;

	// 게시물 작성
	public int writeBoard(AdminBoardRequest boardReq, HttpSession session) {
		int resultCnt = 0;
		System.out.println(boardReq);
		AdminLoginInfo loginInfo = (AdminLoginInfo) session.getAttribute("adminLogger");
		System.out.println(loginInfo);
		boardReq.setAdminIdx(loginInfo.getAdminIdx());

		dao = template.getMapper(AdminDao.class);

		resultCnt = dao.writeBoard(boardReq);

		return resultCnt;
	}

	// 게시물 리스트

	public AdminBoardListView getBoardList(int i, int currentPage) {

		List<BoardList> list = null;

		dao = template.getMapper(AdminDao.class);

		int totalCount = dao.selectTotalCount(i);
		System.out.println("totalCount: " + totalCount);
		int index = (currentPage - 1) * COUNT_PER_PAGE;
		System.out.println("i: " + i);
		list = dao.selectEventBoardList(i, index, COUNT_PER_PAGE);
		System.out.println("list : " + list);
		return new AdminBoardListView(currentPage, COUNT_PER_PAGE, COUNT_PER_PAGING_NUM, list, totalCount);
	}

	public BoardDetail getBoardDetail(int idx) {
		BoardDetail bd = null;

		dao = template.getMapper(AdminDao.class);

		bd = dao.selectBoard(idx);

		return bd;
	}

	public int editBoard(BoardEditReq editReq) {
		int resultCnt = 0;

		dao = template.getMapper(AdminDao.class);

		resultCnt = dao.editBoard(editReq);

		return resultCnt;
	}
}
