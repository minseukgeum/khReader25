package com.kh.Reader25.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.kh.Reader25.member.model.exception.MemberException;
import com.kh.Reader25.member.model.service.MemberService;
import com.kh.Reader25.member.model.service.MemberServiceImpl;
import com.kh.Reader25.member.model.vo.Member;

@SessionAttributes("loginUser")

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	//로그인 클릭시 로그인 페이지로 이동 컨트롤러
	@RequestMapping("loginView.me")
	public String loginView() {
		return "Login";
	}
	
	//회원가입 후 로그인 컨트롤러
	@RequestMapping("login.me")
	public String login(Member m, Model model) {

		//MemberServiceImpl mService = new MemberServiceImpl();
		Member loginUser = mService.memberLogin(m);
		//아이디만 일치했을때에 대한 멤버 정보가 있음
		
		System.out.println(m);
		System.out.println(loginUser);
		
		if(bcrypt.matches(m.getPwd(), loginUser.getPwd())) {
			model.addAttribute("loginUser", loginUser);
			return "redirect:home.do";
		} else {
			throw new MemberException("로그인에 실패했습니다.");
		}		
	}
	
	// 로그아웃용 컨트롤러 (@SessionAttributes을 사용했을 때 가능)
	@RequestMapping("logout.me")
	public String logout(SessionStatus status) {
		status.setComplete(); // 모든걸 다 없애줌
				
		return "redirect:home.do";
	}
	
	// 아이디 찾기 컨트롤러
	@RequestMapping("searchIdForm.me")
	public String searchIdFormView() {	
		return "SearchIdForm";
	}
	
	// 비밀번호 찾기 컨트롤러
	@RequestMapping("searchPwForm.me")
	public String searchPwFormView() {	
		return "SearchPwForm";
	}
	
}
