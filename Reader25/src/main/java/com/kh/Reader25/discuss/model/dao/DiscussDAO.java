package com.kh.Reader25.discuss.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.Reader25.board.model.vo.Attachment;
import com.kh.Reader25.board.model.vo.PageInfo;
import com.kh.Reader25.discuss.model.vo.Discuss;

@Repository("dDAO")
public class DiscussDAO {

	
	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("DiscussMapper.ListCount");
	}

	public ArrayList<Discuss> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = pi.getBoardLimit() * (pi.getCurrentPage() -1);
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("DiscussMapper.selectList", rowBounds);
	}


	public int insertDAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.insert("DiscussMapper.insertDAttachment", at);
	}

	public int insertDiscuss(SqlSessionTemplate sqlSession, Discuss d) {
		return sqlSession.insert("DiscussMapper.insertDiscuss", d);
	}

	public Discuss selectDiscussDetail(SqlSessionTemplate sqlSession, int dNo) {
		return sqlSession.selectOne("DiscussMapper.selectDiscuss", dNo);
	}
}
