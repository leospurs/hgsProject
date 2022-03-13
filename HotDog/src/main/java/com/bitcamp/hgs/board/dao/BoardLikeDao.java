package com.bitcamp.hgs.board.dao;

import java.util.Map;

import com.bitcamp.hgs.board.domain.BoardLikes;

public interface BoardLikeDao {
	
	// 해당 게시물의 좋아요 전체수 
	public int selectTotalLikeCount(int boardIdx);
	
	// 해당 회원의 좋아요 여부 판단 
	public BoardLikes findLike(int boardIdx);
}
