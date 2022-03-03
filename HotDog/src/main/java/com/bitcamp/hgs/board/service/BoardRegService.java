package com.bitcamp.hgs.board.service;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.hgs.board.dao.BoardDao;
import com.bitcamp.hgs.board.domain.BoardFiles;
import com.bitcamp.hgs.board.domain.RegBoard;
import com.bitcamp.hgs.board.domain.RegBoardInfo;
import com.bitcamp.hgs.place.domain.PlaceFiles;

@Service
public class BoardRegService {

	
	@Autowired
	private SqlSessionTemplate template;


	public void registBoard(RegBoardInfo regBoardInfo, HttpServletRequest request)
			throws IllegalStateException, IOException {

		RegBoard regBoard = regBoardInfo.getBoard();
		
		
		template.getMapper(BoardDao.class).registBoard(regBoard);

		

		// DB 관련 예외 발생 시 삭제 처리를 위한 File 객체 변수 선언
		File newFile = null;

		BoardFiles boardFiles = null;
		// 파일이 있다면 -> 파일 저장
		if (!regBoardInfo.getPhoto().isEmpty() && regBoardInfo.getPhoto().getSize() > 0) {
			// 시스템의 경로
			String savePath = request.getSession().getServletContext().getRealPath("/uploadfile");
			String[] files = regBoardInfo.getPhoto().getOriginalFilename().split("\\.");
			String exet = files[files.length - 1];
			String newFileName = System.nanoTime() + "." + exet;
			newFile = new File(savePath, newFileName);
			regBoardInfo.getPhoto().transferTo(newFile);
			
			int size = Long.valueOf(regBoardInfo.getPhoto().getSize()).intValue();
			
			System.out.println(savePath);
			
			boardFiles = new BoardFiles(regBoard.getBoardIdx(), newFileName, size);
		}
		
		
		
		
		template.getMapper(BoardDao.class).insertFile(boardFiles);
		
		System.out.println("성공");
		

		

	}
}
