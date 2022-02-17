package com.bitcamp.hgs.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {

	@RequestMapping("/")
	public String index() {
		return "home/home";
	}
}
