package com.bitcamp.hgs.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.hgs.board.service.BoardDeleteService;

@Controller
public class BoardDeleteController {

	@Autowired
	private BoardDeleteService deleteService;

	@GetMapping("/board/delete")
	public String deleteBoard(@RequestParam("boardIdx") int boardIdx) {


		// 게시물 삭제처리를 위해 파일 삭제를 먼저 처리
		deleteService.deleteFile(boardIdx);
		
		// 게시물에 연결된 좋아요 파일 삭제
		deleteService.deleteLike(boardIdx);
		
		// 게시물에 연결된 댓글 삭제
		deleteService.deleteReply(boardIdx);
		
		// 게시물 삭제
		deleteService.deleteBoard(boardIdx);

		return "redirect:/board/list";
	}
}
