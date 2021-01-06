package com.kh.Reader25.discuss.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.Reader25.board.model.vo.PageInfo;
import com.kh.Reader25.common.Pagination;
import com.kh.Reader25.discuss.model.exception.DiscussException;
import com.kh.Reader25.discuss.model.service.DiscussService;
import com.kh.Reader25.discuss.model.vo.Discuss;

@Controller
public class DiscussController {
	
	@Autowired
	private DiscussService dService;
	
	// 토론방 전체 페이지
	@RequestMapping("discuss.di")
	public ModelAndView discussList(@RequestParam(value="page", required=false) Integer page, ModelAndView mv) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		int code = 0;
		int listCount = dService.getListCount();
		PageInfo pi = Pagination.getPageInfo1(currentPage, listCount);
		ArrayList<Discuss> dList = dService.selectList(pi);
		if(dList != null) {
			mv.addObject("dList", dList)
				.addObject("pi", pi)
				.setViewName("discussList");
		}else {
			throw new DiscussException("공지사항 게시글 전체 조회에 실패하였습니다.");
		}
		return mv;
	}
	
	// 토론방 글쓰기 페이지로 이동
	@RequestMapping("discussWrite.di")
	public String discussWriteForm() {
		return "discussWriteForm";
	}
	
}
