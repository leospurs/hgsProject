package com.bitcamp.hgs.place.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bitcamp.hgs.place.domain.Places;
import com.bitcamp.hgs.place.service.PlaceRegService;

@Controller
@RequestMapping("/place/*")
public class PlaceRegController {
	
	@Autowired
	private PlaceRegService regService;
	
	@GetMapping
	public String regPlace() {
		return "place/register";
	}
	
	@PostMapping("place/register")
	public String regPlace(Places place, RedirectAttributes rttr) {
		System.out.println(place);
		
		regService.registPlace(place);
		
		rttr.addFlashAttribute("result", place.getPlaceIdx());
		
		return "redirect:/place/list";
	}
}
