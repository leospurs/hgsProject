package com.bitcamp.hgs.place.dao;

import java.util.Map;

import com.bitcamp.hgs.place.domain.PlaceScraps;

public interface PlaceScrapDao {

	// 해당 추천장소의 좋아요 전체수
	public int selectTotalScrapCount(int placeIdx);

	// 추천장소 스크랩 여부 판단(상세페이지 내)을 위한 좋아요 리스트
	public PlaceScraps getScrapList(Map<String, Integer> number);

	// 추천장소 스크랩 여부 판단(insert시)
	public PlaceScraps findScrap(PlaceScraps placeScrap);

	// 추천장소 스크랩
	public void insertScrap(PlaceScraps placeScrap);

	// 추천장소 스크랩 취소
	public void deleteScrap(PlaceScraps placeScrap);

}
