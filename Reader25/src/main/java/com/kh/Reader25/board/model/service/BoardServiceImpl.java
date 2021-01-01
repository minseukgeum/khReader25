package com.kh.Reader25.board.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.Reader25.board.model.dao.BoardDAO;
import com.kh.Reader25.board.model.vo.Board;
import com.kh.Reader25.board.model.vo.PageInfo;

@Service("bService")
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDAO bDAO;
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getListCount(int code) {
		return bDAO.getListCount(sqlSession, code);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi, int code) {
		return bDAO.selectList(sqlSession, pi, code);
	}

	@Override
	public int insertTIW(Board b) {
		// TODO Auto-generated method stub
		return bDAO.insertTIW(sqlSession, b);
	}

	
	
}
