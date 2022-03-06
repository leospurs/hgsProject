package com.bitcamp.hgs.member.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.hgs.member.dao.MemberDao;
import com.bitcamp.hgs.member.domain.ListPageView;
import com.bitcamp.hgs.member.domain.Member;
import com.bitcamp.hgs.member.domain.SearchParams;

@Service
public class MemberListService {

	private MemberDao dao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	private final int COUNT_PER_PAGE = 3;
	
	public ListPageView getPageView(SearchParams params) {
		
		ListPageView view = null;
		
		dao = template.getMapper(MemberDao.class);
		
		if(params.getKeyword() == null || params.getKeyword().trim().isEmpty()) {
			params.setSearchType(null);
		}
		
		Map<String, String> searchMap = new HashMap();
		
		searchMap.put("searchType", params.getSearchType());
		searchMap.put("keyword", params.getKeyword());
		
		int totalCount = dao.selectTotalCount(searchMap);
		
		int currentPage = params.getP() == 0? 1 : params.getP();
		
		int index = (currentPage -1) * COUNT_PER_PAGE;
		
		params.setIndex(index);
		params.setCount(COUNT_PER_PAGE);
		
		List<Member> list = dao.selectList(params);
		
		view = new ListPageView(totalCount, currentPage, COUNT_PER_PAGE, list);
		
		// System.out.println(list);
		
		return view;
		
	}
}
