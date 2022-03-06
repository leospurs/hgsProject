package com.bitcamp.hgs;

import org.apache.ibatis.annotations.Mapper;
import org.junit.Test;

import com.bitcamp.hgs.place.domain.RegPlace;


public class PlaceMapperTest {
	
	@Test
	public void testInsert() {
		
		RegPlace place = new RegPlace();
		
		place.setTitle("새로운 장소");
		
	}
}
