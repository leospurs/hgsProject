package com.bitcamp.hgs.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.hgs.board.domain.BoardLikes;
import com.bitcamp.hgs.board.service.BoardLikeService;
import com.bitcamp.hgs.board.service.BoardReplyService;
import com.bitcamp.hgs.board.service.BoardViewService;
import com.bitcamp.hgs.member.domain.Logger;

@Controller
public class BoardViewController {

	@Autowired
	private BoardViewService viewService;

	@Autowired
	private BoardReplyService replyService;

	@Autowired
	private BoardLikeService likeService;
	

	@GetMapping({ "/board/view", "/board/update" })
	public void getViewPage(@RequestParam("boardIdx") int boardIdx, HttpSession session, Model model) {

		// 로그인 사용자 정보를 받아오기 위한 logger 객체
		Logger logger = (Logger) session.getAttribute("logger");
		

		// 게시물 상세보기 정보를 뷰에 전달
		model.addAttribute("pageView", viewService.getPageView(boardIdx));

		// 댓글 전체 리스트를 뷰에 전달
		model.addAttribute("replyList", replyService.getList(boardIdx));

		// 좋아요 기능 부분
		BoardLikes boardLike = new BoardLikes();
		
		boardLike = likeService.getLikeList(boardIdx,logger.getMemberIdx());
		
		System.out.println("boardLike의 값: " + boardLike);
		
		model.addAttribute("boardLike", boardLike);

	}
}
