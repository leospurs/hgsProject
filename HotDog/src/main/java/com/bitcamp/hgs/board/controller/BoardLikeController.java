package com.bitcamp.hgs.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bitcamp.hgs.board.domain.BoardLikes;
import com.bitcamp.hgs.board.service.BoardLikeService;

@RestController
@RequestMapping("/board/boardLike")
public class BoardLikeController {

	@Autowired
	private BoardLikeService likeService;

	// 좋아요 입력
	@PostMapping
	public void insertBoardLike(@ModelAttribute BoardLikes boardLike) {

		System.out.println("입력된 값: " + boardLike);

		likeService.insertLike(boardLike);

	}

}
