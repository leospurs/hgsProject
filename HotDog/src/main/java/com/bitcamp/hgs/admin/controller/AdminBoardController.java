package com.bitcamp.hgs.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.hgs.admin.domain.AdminBoardRequest;
import com.bitcamp.hgs.admin.domain.BoardEditReq;
import com.bitcamp.hgs.admin.service.AdminService;

@Controller
@RequestMapping("/admin/board")
public class AdminBoardController {

	@Autowired
	AdminService service;

	// 게시물 작성
	@GetMapping
	public String getWriteBoard() {
		return "adminBoard/board";
	}

	@PostMapping
	public String postWriteBoard(AdminBoardRequest boardReq, HttpSession session, Model model) {
		model.addAttribute("result", service.writeBoard(boardReq, session));
		model.addAttribute("type", boardReq.getAdminBoardListIdx());
		return "adminBoard/boardComplete";
	}

	// 게시글 리스트
	@GetMapping("/{type}")
	public String getBoardList(@PathVariable("type") String type,
			@RequestParam(value = "p", defaultValue = "1") int currentPage, Model model) {
		if (type.equals("announcement")) {
			model.addAttribute("type", 1);
			model.addAttribute("board", service.getBoardList(1, currentPage));
		} else if (type.equals("event")) {
			model.addAttribute("type", 2);
			model.addAttribute("board", service.getBoardList(2, currentPage));
		}
		return "adminBoard/list";
	}

	// 게시물 수정
	@GetMapping("/detail/{idx}")
	public String getBoardEdit(@PathVariable("idx") int idx, Model model) {
		model.addAttribute("board", service.getBoardDetail(idx));
		return "adminBoard/editBoard";
	}

	// 게시물 수정하기
	@PostMapping("/detail/{idx}")
	public String putBoardEdit(@PathVariable("idx") int idx, BoardEditReq editReq, Model model) {
		System.out.println(editReq);
		model.addAttribute("result", service.editBoard(editReq));
		return "adminBoard/editComplete";
	}


}
