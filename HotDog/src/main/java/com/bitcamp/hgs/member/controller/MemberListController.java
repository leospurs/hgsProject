package com.bitcamp.hgs.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.hgs.member.domain.SearchParams;
import com.bitcamp.hgs.member.service.MemberListService;

@Controller
public class MemberListController {

	@Autowired
	private MemberListService listService;
	
	@RequestMapping("/member/manager/memberList")
	public void getListPage(
			SearchParams params,
			Model model) {
		
		// System.out.println(params);
		
		model.addAttribute("listView", listService.getPageView(params));
		
	}
}
