package com.bitcamp.hgs.place.service;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.hgs.board.dao.BoardLikeDao;
import com.bitcamp.hgs.board.domain.BoardLikes;
import com.bitcamp.hgs.place.dao.PlaceScrapDao;
import com.bitcamp.hgs.place.domain.PlaceScraps;

@Service
public class PlaceScrapService {

	@Autowired
	private SqlSessionTemplate template;

	// 좋아요 목록보기
	public PlaceScraps getScrapList(int placeIdx, int memberIdx) {

		Map<String, Integer> number = new HashMap<String, Integer>();

		number.put("placeIdx", placeIdx);
		number.put("memberIdx", memberIdx);

		return template.getMapper(PlaceScrapDao.class).getScrapList(number);
	}

	// 좋아요 입력 및 삭제
	public void insertScrap(PlaceScraps placeScrap) {

		PlaceScraps find = template.getMapper(PlaceScrapDao.class).findScrap(placeScrap);

		if (find == null) {

			template.getMapper(PlaceScrapDao.class).insertScrap(placeScrap);

		} else {
			template.getMapper(PlaceScrapDao.class).deleteScrap(placeScrap);
		}

	}
}
