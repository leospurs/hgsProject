package com.bitcamp.hgs.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.hgs.member.service.MypageService;

@Controller
@RequestMapping("/member")
public class MypageController {
	
	@Autowired
	private MypageService myPageService;
	
	@RequestMapping("/mypage")
	public void getMypage(HttpSession session, Model model) {
		
		model.addAttribute("member", myPageService.getLoginInfo(session));
	}
}
