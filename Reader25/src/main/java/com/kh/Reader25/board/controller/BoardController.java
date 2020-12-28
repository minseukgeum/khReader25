package com.kh.Reader25.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardController {
	
	// 공지사항 code = 0
	@RequestMapping("notice.no")
	public String NoticeList() {
		return "noticeList";
		
	}
	
}
