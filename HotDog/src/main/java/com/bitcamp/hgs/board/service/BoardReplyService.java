package com.bitcamp.hgs.board.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.hgs.board.dao.BoardReplyDao;
import com.bitcamp.hgs.board.domain.BoardReplys;

@Service
public class BoardReplyService {

	private BoardReplyDao dao;

	@Autowired
	private SqlSessionTemplate template;

	// 댓글 목록보기
	public List<BoardReplys> getList(int boardIdx) {

		return template.getMapper(BoardReplyDao.class).getList(boardIdx);
	}

	// 댓글 등록
	public void registReply(BoardReplys reply) {

		dao = template.getMapper(BoardReplyDao.class);

		dao.registReply(reply);

	}

	// 댓글 삭제
	public int deleteReply(int boardReplyIdx) {

		return template.getMapper(BoardReplyDao.class).deleteReply(boardReplyIdx);
	}

//	// 댓글 수정
//	public int updateReply(BoardReplys reply) {
//
//		dao = template.getMapper(BoardReplyDao.class);
//
//		return dao.updateReply(reply);
//	}
}
