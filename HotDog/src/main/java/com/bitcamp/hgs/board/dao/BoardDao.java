package com.bitcamp.hgs.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.bitcamp.hgs.board.domain.Boards;


public interface BoardDao {
	
		// 전체 일반 게시물의 수
		@Select("select count(*) from Boards")
		public int selectTotalCount();
		
		// 일반 게시물 리스트(전체)
		public List<Boards> selectList(int index, int count);
		
		// 일반 게시물 상세보기(boardIdx값으로)
		public Boards selectByIdx(int boardIdx);
		
		// 일반 게시물 등록하기
		public void registBoard(Boards board);
		
		// 일반  게시물 삭제하기
		public void deleteBoard(int boardIdx);
		
		// 일반 게시물 수정하기
		public void updateBoard(Boards board);
}
