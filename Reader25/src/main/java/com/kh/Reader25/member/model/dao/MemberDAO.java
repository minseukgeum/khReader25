package com.kh.Reader25.member.model.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.Reader25.member.model.vo.Member;

@Repository("mDAO")
public class MemberDAO {

	public Member selectMember(SqlSessionTemplate sqlSession, String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.selectMember", id);
	}

	public String searchId(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.searchId", map);
	}

}
