package com.bitcamp.hgs.board.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.hgs.board.dao.BoardLikeDao;
import com.bitcamp.hgs.board.domain.BoardLikes;

@Service
public class BoardLikeService {

	private BoardLikeDao dao;

	@Autowired
	private SqlSessionTemplate template;

	// 파라미터로 기존 좋아요가 되어있는지를 확인하는 메소드
	public List<BoardLikes> getList(int boardIdx) {

		return template.getMapper(BoardLikeDao.class).getList(boardIdx);
	}
}
