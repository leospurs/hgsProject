package com.bitcamp.hgs.place.service;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.hgs.place.dao.PlaceDao;
import com.bitcamp.hgs.place.dao.PlaceScrapDao;
import com.bitcamp.hgs.place.domain.PlaceScraps;
import com.bitcamp.hgs.place.domain.Places;

@Service
public class PlaceViewService {

	private PlaceDao dao;

	@Autowired
	private SqlSessionTemplate template;

	public Places getPageView(int placeIdx) {

		return template.getMapper(PlaceDao.class).selectByIdx(placeIdx);
	}
	
//	public PlaceScraps findScrap(int memberIdx, int idx) {
//		
//		Map<String, Integer> index = new HashMap<String, Integer>();
//		index.put("memberIdx", memberIdx);
//		index.put("placeIdx", idx);
//	}
}
