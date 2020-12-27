package com.kh.Reader25.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BoardController {
	
	// 공지사항 code = 0
	@RequestMapping("notice.bo")
	public String NoticeList(@RequestParam(value="page", required=false) int page) {
		int currentPgae = 1;
		
		
		return null;
		
	}
	
}
