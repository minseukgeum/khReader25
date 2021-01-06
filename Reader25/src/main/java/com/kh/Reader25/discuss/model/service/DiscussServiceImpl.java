package com.kh.Reader25.discuss.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.Reader25.board.model.vo.Attachment;
import com.kh.Reader25.board.model.vo.PageInfo;
import com.kh.Reader25.discuss.model.dao.DiscussDAO;
import com.kh.Reader25.discuss.model.vo.Discuss;

@Service("dService")
public class DiscussServiceImpl  implements DiscussService{

	@Autowired
	private DiscussDAO dDAO; 
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount() {
		return dDAO.getListCount(sqlSession);
	}

	@Override
	public ArrayList<Discuss> selectList(PageInfo pi) {
		return dDAO.selectList(sqlSession, pi);
	}

	@Override
	public int insertDiscuss(Discuss d, Attachment at) {
		int result = 0;
		if(at != null) {
			result = dDAO.insertDAttachment(sqlSession, at);
		}
		if(result > 0) {
			result = dDAO.insertDiscuss(sqlSession, d);
		}
		return result;
	}

}
