package com.bitcamp.hgs.place.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.hgs.member.domain.Logger;
import com.bitcamp.hgs.place.domain.PlaceScraps;
import com.bitcamp.hgs.place.service.PlaceReplyService;
import com.bitcamp.hgs.place.service.PlaceScrapService;
import com.bitcamp.hgs.place.service.PlaceViewService;

@Controller
public class PlaceViewController {

	@Autowired
	private PlaceViewService viewService;

	@Autowired
	private PlaceReplyService replyService;
	
	@Autowired
	private PlaceScrapService scrapService;

	@GetMapping({ "/place/view", "/place/update" })
	public void getViewPage(@RequestParam("placeIdx") int placeIdx, HttpSession session, Model model) {

		// 로그인 사용자 정보를 받아오기 위한 logger 객체
		Logger logger = (Logger) session.getAttribute("logger");

		// 추천장소 상세보기 정보를 뷰에 전달
		model.addAttribute("pageView", viewService.getPageView(placeIdx));

		// 후기 전체 리스트를 뷰에 전달
		model.addAttribute("replyList", replyService.getList(placeIdx));

		// 스크랩 기능 부분
		PlaceScraps placeScrap = new PlaceScraps();

		placeScrap = scrapService.getScrapList(placeIdx, logger.getMemberIdx());

		System.out.println("placeScrap의 값: " + placeScrap);

		model.addAttribute("placeScrap", placeScrap);

	}
}
