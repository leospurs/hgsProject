package com.bitcamp.hgs.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.hgs.member.domain.EditMember;
import com.bitcamp.hgs.member.service.MemberEditService;

@Controller
@RequestMapping("/member/manager/memberEdit")
public class MemberEditController {
	
	@Autowired
	private MemberEditService editService;
	
	@GetMapping
	public String form(
			@RequestParam("idx") int idx, Model model) {
		
		model.addAttribute("member", editService.getMember(idx));
		
		return "member/manager/memberEditform";
		
	}
	
	@PostMapping
	public String edit(
			EditMember editMember,
			HttpServletRequest request) throws Exception {
		
		// System.out.println("Update" + editMember);
		
		editService.editMember(editMember, request);
		
		// return "redirect:/member/manager/memberList";
		return "redirect:/home";
	}

}
