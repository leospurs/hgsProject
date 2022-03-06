package com.bitcamp.hgs.member.service;

import javax.servlet.http.HttpSession; 

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.hgs.member.dao.MemberDao;
import com.bitcamp.hgs.member.domain.Logger;
import com.bitcamp.hgs.member.domain.Member;

@Service
public class MypageService {

	private MemberDao dao;

	@Autowired
	private SqlSessionTemplate template;

	public Member getLoginInfo(HttpSession session) {

		int memberIdx = ((Logger) session.getAttribute("logger")).getMemberIdx();

		// System.out.println("memberIdx :" + memberIdx);

		Member member = null;

		dao = template.getMapper(MemberDao.class);

		member = dao.selectByIdx2(memberIdx);

		System.out.println("mypage :" + dao.selectByIdx(memberIdx));

		return member;
	}
}
