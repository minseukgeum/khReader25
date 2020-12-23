package com.kh.Reader25.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	//로그인 클릭시 로그인 페이지로 이동
	@RequestMapping("/login.me")
	public String loginView() {
		System.out.println("로그인");
		return "Login";
	}
}
