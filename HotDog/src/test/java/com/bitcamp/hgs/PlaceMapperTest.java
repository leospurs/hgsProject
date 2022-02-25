package com.bitcamp.hgs;

import org.apache.ibatis.annotations.Mapper;
import org.junit.Test;

import com.bitcamp.hgs.place.domain.Places;


public class PlaceMapperTest {
	
	@Test
	public void testInsert() {
		
		Places place = new Places();
		
		place.setTitle("새로운 장소");
		
	}
}
