package com.bitcamp.hgs.member.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.hgs.member.dao.MemberDao;
import com.bitcamp.hgs.member.domain.EditMember;
import com.bitcamp.hgs.member.domain.Member;

@Service
public class MemberEditService {

	public MemberDao dao;

	@Autowired
	private SqlSessionTemplate template;

	public Member getMember(int memberIdx) {

		dao = template.getMapper(MemberDao.class);

		// System.out.println("selectByIdx : " + dao.selectByIdx(memberIdx));

		return dao.selectByIdx(memberIdx);
	}

	public int editMember(EditMember editMember, HttpServletRequest request) throws Exception {

		// 파일 저장
		int resultCnt = 0;

		// DB 관련 예외 발생 시 삭제 처리를 위한 File 객체 변수 선언
		File newFile = null;

		// 파일이 있다면 -> 파일 저장
		if (!editMember.getProfile().isEmpty() && editMember.getProfile().getSize() > 0) {
			// 시스템의 경로
			String savePath = request.getSession().getServletContext().getRealPath("/uploadfile");
			String[] files = editMember.getProfile().getOriginalFilename().split("\\.");
			String exet = files[files.length - 1];
			String newFileName = System.nanoTime() + "." + exet;
			newFile = new File(savePath, newFileName);
			editMember.getProfile().transferTo(newFile);
			editMember.setFileName(newFileName);
		}

		// fileName => null

		try {

			dao = template.getMapper(MemberDao.class);
			resultCnt = dao.editMember(editMember);

		} catch (Exception e) {
			// 파일이 저장된 후 DB관련 예외가 발생했을 때 : 저장했던 파일을 삭제
			if (newFile != null && newFile.exists()) {
				newFile.delete();
			}
			e.printStackTrace();
			throw e;
		}

		return resultCnt;

	}
}
