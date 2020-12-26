package com.kh.Reader25.member.model.service;

import java.util.HashMap;

import com.kh.Reader25.member.model.vo.Member;

public interface MemberService {

	Member memberLogin(String id);

	String searchId(HashMap<String, String> map);

}
