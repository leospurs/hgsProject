package com.bitcamp.hgs.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bitcamp.hgs.member.domain.RegMember;
import com.bitcamp.hgs.member.service.MemberService;

@RestController
public class MemberRestController {
	
	MemberService service;
	
	MemberRestController(MemberService service){
		this.service = service;
	}
	
	
	@PostMapping("/join")
	public void joinMember(RegMember regMember, HttpServletRequest request, Model model) throws IllegalStateException, IOException {
		service.insertMember(regMember, request);
	}
	
	@PostMapping("/oauth/join")
	public void joinOauthMember(RegMember regMember, HttpServletRequest request, Model model) throws IllegalStateException, IOException {
		service.insertMember(regMember, request);
	}
	
	
	
	
}
