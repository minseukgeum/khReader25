package com.kh.Reader25.common;

import com.kh.Reader25.board.model.vo.PageInfo;

public class Pagination {
	public static PageInfo getPageInfo1(int currentPage, int listCount) {
		// 공지사항, 문의사항 
		
		int pageLimit = 5;
		int maxPage;
		int startPage;
		int endPage;
		int boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		startPage = (currentPage - 1)/pageLimit * pageLimit  + 1;
		endPage = startPage + pageLimit - 1;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, maxPage, startPage, endPage, boardLimit);
		return pi;
	}
}
