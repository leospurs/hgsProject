package com.bitcamp.hgs.member.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.hgs.member.dao.MemberDao;
import com.bitcamp.hgs.member.domain.Member;

@Service
public class MemberDeleteService {

	private MemberDao dao;

	@Autowired
	private SqlSessionTemplate template;

	public int deleteMember(int memberIdx, HttpServletRequest request) {

		int resultCnt = 0;

		dao = template.getMapper(MemberDao.class);

		Member member = dao.selectByIdx(memberIdx);

		if (member != null) {
			resultCnt = dao.deleteByIdx(memberIdx);

			if (member.getProfile() != null || !member.getProfile().contentEquals("default.jpg")) {
				String savePath = request.getSession().getServletContext().getRealPath("/uploadfile");
				File file = new File(savePath, member.getProfile());

				if (file.exists()) {
					file.delete();
				}
			}
		}

		return resultCnt;
	}
}
