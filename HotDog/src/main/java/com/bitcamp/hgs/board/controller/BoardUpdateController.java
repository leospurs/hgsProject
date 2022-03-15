package com.bitcamp.hgs.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.hgs.board.domain.Boards;
import com.bitcamp.hgs.board.service.BoardUpdateService;
import com.bitcamp.hgs.board.service.BoardViewService;

@Controller
public class BoardUpdateController {

	@Autowired
	private BoardUpdateService updateService;

	@PostMapping("board/update")
	public String updateBoard(Boards board) {

		updateService.updateBoard(board);

		return "redirect:/board/list";
	}
}
