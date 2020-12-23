package com.kh.Reader25.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.Reader25.member.model.service.MemberService;
import com.kh.Reader25.member.model.service.MemberServiceImpl;
import com.kh.Reader25.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	//로그인 클릭시 로그인 페이지로 이동
	@RequestMapping("loginView.me")
	public String loginView() {
		return "Login";
	}
	
	
	//회원가입 후 로그인
		@RequestMapping("login.me")
		public String login(Member m, Model model) {

			//MemberServiceImpl mService = new MemberServiceImpl();
			Member loginUser = mService.memberLogin(m);
			//아이디만 일치했을때에 대한 멤버 정보가 있음
			
			if(bcrypt.matches(m.getPwd(), loginUser.getPwd())) {
				model.addAttribute("loginUser", loginUser);
				return "redirect:home.do";
			} else {
				//model.addAttribute("message", "로그인에 실패하였습니다.");
				//return "../common/errorPage";
				throw new MemberException("로그인에 실패했습니다.");
			}
				
		}
}
