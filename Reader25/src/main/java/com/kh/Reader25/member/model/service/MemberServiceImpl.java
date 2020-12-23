package com.kh.Reader25.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.Reader25.member.model.dao.MemberDAO;
import com.kh.Reader25.member.model.vo.Member;

@Service("mService")
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO mDAO;

	@Override
	public Member memberLogin(Member m) {
		// TODO Auto-generated method stub
		return null;
	}

}
