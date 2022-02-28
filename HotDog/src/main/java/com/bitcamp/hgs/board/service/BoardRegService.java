package com.bitcamp.hgs.board.service;

import java.io.IOException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.hgs.board.dao.BoardDao;
import com.bitcamp.hgs.board.domain.Boards;

@Service
public class BoardRegService {

	private BoardDao dao;

	@Autowired
	private SqlSessionTemplate template;


	public void registBoard(Boards board)
			throws IllegalStateException, IOException {

		dao = template.getMapper(BoardDao.class);
		dao.registBoard(board);
		
		

		

	}
}
