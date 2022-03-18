package com.bitcamp.hgs.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.bitcamp.hgs.board.domain.BoardLikes;
import com.bitcamp.hgs.board.service.BoardLikeService;

@Controller
public class BoardLikeController {
	
	@Autowired
	private BoardLikeService likeService;
	
	// 좋아요  입력
	@PostMapping("/board/boardLike")
	public void insertBoardLike(@ModelAttribute BoardLikes boardLike) {
		
		System.out.println(boardLike);
		
		likeService.insertLike(boardLike);
		
		
	}
	
	
}
