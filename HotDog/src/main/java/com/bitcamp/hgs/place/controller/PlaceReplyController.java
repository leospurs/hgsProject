package com.bitcamp.hgs.place.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bitcamp.hgs.place.domain.PlaceReplys;
import com.bitcamp.hgs.place.service.PlaceReplyRegService;

@RestController
@RequestMapping("/place/reply")
public class PlaceReplyController {
	
	@Autowired
	private PlaceReplyRegService regService;
	
	// 후기 입력
	@PostMapping
	public String regReply(PlaceReplys replys) {
		
		regService.insertReply(replys);
		System.out.println(replys);
		return String.valueOf(replys.getPlaceIdx());
	}
}
