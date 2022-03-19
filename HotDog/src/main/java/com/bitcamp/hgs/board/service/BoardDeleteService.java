package com.bitcamp.hgs.board.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.hgs.board.dao.BoardDao;

@Service
public class BoardDeleteService {

	private BoardDao dao;

	@Autowired
	private SqlSessionTemplate template;

	// 게시물 삭제
	public void deleteBoard(int boardIdx) {

		dao = template.getMapper(BoardDao.class);

		dao.deleteBoard(boardIdx);

	}

	// 게시물 좋아요 삭제
	public void deleteLike(int boardIdx) {

		dao = template.getMapper(BoardDao.class);

		dao.deleteLike(boardIdx);

	}

	// 게시물 첨부 파일 삭제
	public void deleteFile(int boardIdx) {

		dao = template.getMapper(BoardDao.class);

		dao.deleteFile(boardIdx);
	}

	// 게시물 댓글 삭제
	public void deleteReply(int boardIdx) {

		dao = template.getMapper(BoardDao.class);

		dao.deleteReply(boardIdx);
	}

}
