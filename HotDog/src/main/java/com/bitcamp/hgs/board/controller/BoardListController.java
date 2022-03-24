package com.bitcamp.hgs.board.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.hgs.admin.service.AdminService;
import com.bitcamp.hgs.board.service.BoardListService;

@Controller
public class BoardListController {

	@Autowired
	private BoardListService listService;
	
	@Autowired
	private AdminService adminService;

	@GetMapping
	public String getListPage(@RequestParam(value = "p", defaultValue = "1") int pageNum, Model model)
			throws SQLException {

		// listView 이름으로 뷰에 전달
		model.addAttribute("listView", listService.getPage(pageNum));
		return "board/list";
	}
	
	@GetMapping("/{type}")
	public String getBoardListPage(@PathVariable("type") String type,@RequestParam(value = "p", defaultValue = "1") int currentPage, Model model) {
		if (type.equals("announcement")) {
			model.addAttribute("type", 1);
			model.addAttribute("board", adminService.getBoardList(1, currentPage));
		} else if (type.equals("event")) {
			model.addAttribute("type", 2);
			model.addAttribute("board", adminService.getBoardList(2, currentPage));
		}
		return "board/boardList";
	}

	@GetMapping("/detail/{idx}")
	public String getBoardDetaile(@PathVariable("idx") int idx, Model model) {
		model.addAttribute("board", adminService.getBoardDetail(idx));
		return "board/detail";
	}

}
