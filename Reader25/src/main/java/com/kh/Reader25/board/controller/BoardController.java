package com.kh.Reader25.board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.Reader25.board.model.exception.BoardException;
import com.kh.Reader25.board.model.service.BoardService;
import com.kh.Reader25.board.model.vo.Board;
import com.kh.Reader25.board.model.vo.PageInfo;
import com.kh.Reader25.common.Pagination;

@Controller
public class BoardController {
	@Autowired
	private BoardService bService;
	
	// 공지사항 code = 0
	@RequestMapping("notice.no")
	public ModelAndView NoticeList(@RequestParam(value="page", required=false) Integer page,
							ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int code = 0;
		int listCount = bService.getListCount(code);
		PageInfo pi = Pagination.getPageInfo1(currentPage, listCount);
		ArrayList<Board> bList = bService.selectList(pi, code);
		if(bList != null) {
			mv.addObject("bList", bList)
				.addObject("page", currentPage)
				.setViewName("noticeList");
		}else {
			throw new BoardException("게시글 전체 조회에 실패하였습니다.");
		}
		return mv;
	}
	
}
