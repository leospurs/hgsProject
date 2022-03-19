package com.bitcamp.hgs.board.service;

import java.util.HashMap;
import java.util.List;
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

	// 좋아요 목록보기
	public BoardLikes getLikeList(int boardIdx, int memberIdx) {

		Map<String, Integer> number = new HashMap<String, Integer>();

		number.put("boardIdx", boardIdx);
		number.put("memberIdx", memberIdx);

		return template.getMapper(BoardLikeDao.class).getLikeList(number);
	}

	// 좋아요 입력 및 삭제
	public void insertLike(BoardLikes boardLike) {

		BoardLikes find = template.getMapper(BoardLikeDao.class).findLike(boardLike);

		if (find == null) {

			template.getMapper(BoardLikeDao.class).insertLike(boardLike);

		} else {
			template.getMapper(BoardLikeDao.class).deleteLike(boardLike);
		}

	}

}
