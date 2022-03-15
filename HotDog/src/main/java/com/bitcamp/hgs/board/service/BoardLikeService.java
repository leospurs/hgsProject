package com.bitcamp.hgs.board.service;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.hgs.board.dao.BoardLikeDao;
import com.bitcamp.hgs.board.domain.BoardLikes;

@Service
public class BoardLikeService {

	@Autowired
	private SqlSessionTemplate template;

	// 파라미터로 기존 좋아요가 되어있는지를 확인하는 메소드
	public BoardLikes findLike(int boardIdx) {

		return template.getMapper(BoardLikeDao.class).findLike(boardIdx);
	}
}
