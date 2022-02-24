package com.bitcamp.hgs.place.dao;

import java.util.List;

import com.bitcamp.hgs.place.domain.PlaceReplys;

public interface PlaceReplyDao {

	public List<PlaceReplys> selectlist(int idx);
	
	public void insertReply(PlaceReplys replys);
	
	public int deleteByIdx(int idx);
}
