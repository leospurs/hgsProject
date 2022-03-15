package com.bitcamp.hgs.board.domain;

import java.util.List;

import com.bitcamp.hgs.place.domain.Pagination;


public class BoardListView {

	private List<Boards> list;		// 게시물 리스트 
	private int totalCount;			// 게시물 전체 개수
	private Pagination pagination;	// 페이징 처리 객체
	private int pageNum;			// 페이지 번호
	
	public BoardListView(int pageNum, int numOfDisplayMessage, int numOfDisplayPageNum,
			List<Boards> list, int totalCount) {
		this.pageNum = pageNum;
		this.list = list;
		this.totalCount = totalCount;

		pagination = new Pagination(pageNum, calTotalPageCount(numOfDisplayMessage), numOfDisplayPageNum);
	}
	
	private int calTotalPageCount(int numOfDisplayMessage) {
		int totalpageCount = totalCount / numOfDisplayMessage;
		totalpageCount = totalCount % numOfDisplayMessage > 0 ? ++totalpageCount : totalCount / numOfDisplayMessage;
		return totalpageCount;
	}

	public List<Boards> getList() {
		return list;
	}

	public void setList(List<Boards> list) {
		this.list = list;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public Pagination getPagination() {
		return pagination;
	}

	public void setPagination(Pagination pagination) {
		this.pagination = pagination;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	@Override
	public String toString() {
		return "BoardListView [list=" + list + ", totalCount=" + totalCount + ", pagination=" + pagination
				+ ", pageNum=" + pageNum + "]";
	}
	
	
	
}
