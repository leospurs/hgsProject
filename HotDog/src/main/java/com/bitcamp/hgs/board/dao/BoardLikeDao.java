package com.bitcamp.hgs.board.dao;

import java.util.List;
import java.util.Map;

import com.bitcamp.hgs.board.domain.BoardLikes;

public interface BoardLikeDao {

	// 해당 게시물의 좋아요 전체수
	public int selectTotalLikeCount(int boardIdx);

	// 게시물 좋아요 여부 판단(상세페이지)을 위한 좋아요 리스트
	public BoardLikes getLikeList(Map<String, Integer> number);
	
	// 게시물 좋아요 여부 판단(insert시)
	public BoardLikes findLike(BoardLikes boardLike);
	
	// 게시물 좋아요 
	public void insertLike(BoardLikes boardLike);
	
	// 게시물 좋아요 취소
	public void deleteLike(BoardLikes boardLike);
}
