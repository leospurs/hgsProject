package com.bitcamp.hgs.place.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bitcamp.hgs.place.domain.PlaceScraps;
import com.bitcamp.hgs.place.service.PlaceScrapService;

@RestController
@RequestMapping("/place/placeScrap")
public class PlaceScrapController {
	
	@Autowired
	private PlaceScrapService scrapService;
	
	// 스크랩 입력
	@PostMapping
	public void insertPlaceScrap(@ModelAttribute PlaceScraps placeScrap) {

		System.out.println("입력된 값: " + placeScrap);

		scrapService.insertScrap(placeScrap);

	}

}
