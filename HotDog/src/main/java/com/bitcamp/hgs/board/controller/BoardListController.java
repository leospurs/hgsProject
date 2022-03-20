package com.bitcamp.hgs.board.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.hgs.board.service.BoardLikeService;
import com.bitcamp.hgs.board.service.BoardListService;

@Controller
public class BoardListController {

	@Autowired
	private BoardListService listService;
	
	@Autowired
	private BoardLikeService likeService;

	@RequestMapping("/board/list")
	public void getListPage(@RequestParam(value = "p", defaultValue = "1") int pageNum, Model model)
			throws SQLException {
		
		// listView 이름으로 뷰에 전달
		model.addAttribute("listView", listService.getPage(pageNum));
		

	}

}
