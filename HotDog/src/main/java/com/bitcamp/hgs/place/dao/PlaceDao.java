package com.bitcamp.hgs.place.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.bitcamp.hgs.place.domain.ListPageView;
import com.bitcamp.hgs.place.domain.Places;

public interface PlaceDao {
	
	// 전체 추천장소 게시물의 수
	@Select("select count(*) from places")
	public int selectTotalCount();
	
	// 추천장소 게시물 리스트(전체)
	public List<Places> selectList(int index, int count);
	
	// 추천장소 게시물 상세보기(placeIdx값으로)
	public Places selectByIdx(int PlaceIdx);
	
	// 추천장소 등록하기
	public void registPlace(Places place);
	
	// 추천장소 삭제하기
	public int deletePlace(int PlaceIdx);
	
	
}
