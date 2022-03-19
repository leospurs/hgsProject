package com.bitcamp.hgs.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.hgs.admin.domain.AdminBoardRequest;
import com.bitcamp.hgs.admin.service.AdminService;

@Controller
@RequestMapping("/admin/board")
public class AdminBoardController {
	
	@Autowired AdminService service;
	
	@GetMapping
	public String getEventBoard() {
		return "adminBoard/board";
	}
	@PostMapping
	public String postEventBoard(AdminBoardRequest boardReq, HttpSession session, Model model) {
		model.addAttribute("result", service.writeBoard(boardReq, session));
		return "adminBoard/boardComplete";
	}
	@GetMapping("/{type}")
	public String getEventList(@PathVariable("type") String type, Model model) {
		if(type.equals("announcement")) {
			model.addAttribute("board", service.getBoardList(1));
		}else if(type.equals("event")) {
			model.addAttribute("board", service.getBoardList(2));
		}
		return "adminBoard/list";
	}
	@GetMapping("/detail/{idx}")
	public String getBoardDetail(@PathVariable("idx") int idx, Model model) {
		model.addAttribute("board", service.getBoardDetail(idx));
		return "adminBoard/detail";
	}
	
}
