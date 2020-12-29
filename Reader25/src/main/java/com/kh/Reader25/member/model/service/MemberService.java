package com.kh.Reader25.member.model.service;

import java.util.HashMap;

import com.kh.Reader25.member.model.vo.Member;

public interface MemberService {

	//Member memberLogin(String id);

	String searchId(HashMap<String, String> map);

	int insertMember(Member m);

	Member memberLogin(Member m);

	int checkIdDup(String id);

	int checkEmailDup(String email);

	int changePw(HashMap<String, String> map);



}
