package com.bitcamp.hgs.place.service;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.hgs.place.dao.PlaceDao;
import com.bitcamp.hgs.place.domain.Places;

@Service
public class PlaceRegService {
	
	private PlaceDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public void registPlace(Places place) {
		
		dao = template.getMapper(PlaceDao.class);
				 
	}
}
