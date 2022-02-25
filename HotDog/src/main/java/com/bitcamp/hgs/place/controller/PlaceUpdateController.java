package com.bitcamp.hgs.place.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bitcamp.hgs.place.domain.Places;
import com.bitcamp.hgs.place.service.PlaceUpdateService;

@Controller
@RequestMapping("/place/*")
public class PlaceUpdateController {

	@Autowired
	private PlaceUpdateService updateService;
	
	@PostMapping("/update")
	public String updatePlace(Places place) {
		
		updateService.updatePlace(place);
		
		return "redirect:/place/list";
	}
}
