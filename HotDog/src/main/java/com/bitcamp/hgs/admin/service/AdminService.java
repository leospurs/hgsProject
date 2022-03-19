package com.bitcamp.hgs.admin.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.hgs.admin.dao.AdminDao;
import com.bitcamp.hgs.admin.domain.AdminBoardRequest;
import com.bitcamp.hgs.admin.domain.AdminLoginInfo;
import com.bitcamp.hgs.admin.domain.BoardDetail;
import com.bitcamp.hgs.admin.domain.BoardList;

@Service
public class AdminService {
	
	private AdminDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
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
	
	public List<BoardList> getBoardList(int i){
		
		List<BoardList> list = null;
		
		dao = template.getMapper(AdminDao.class);
		
		list = dao.selectEventBoardList(i);
		
		return list;
	}

	public BoardDetail getBoardDetail(int idx) {
		BoardDetail bd = null;
		
		dao = template.getMapper(AdminDao.class);
		
		bd = dao.selectBoard(idx);
		
		return bd;
	}
}
