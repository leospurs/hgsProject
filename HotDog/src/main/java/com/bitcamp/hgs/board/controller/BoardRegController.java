package com.bitcamp.hgs.board.controller;



import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitcamp.hgs.board.domain.Boards;
import com.bitcamp.hgs.board.service.BoardRegService;

@Controller
@RequestMapping("/board/register")
public class BoardRegController {
	
	@Autowired
	private BoardRegService regService;
	
	@GetMapping
	public String regBoard() {
		
		return "board/register";
	}
	
	@PostMapping
	public String regBoard(Boards board, RedirectAttributes rttr) throws IllegalStateException, IOException {
		
		System.out.println(board);
		
		regService.registBoard(board);
		
		rttr.addFlashAttribute("result", board.getBoardIdx());
		
		return "redirect:/board/list";
	}
}
