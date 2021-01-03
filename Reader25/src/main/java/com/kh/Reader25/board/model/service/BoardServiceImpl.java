package com.kh.Reader25.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.Reader25.board.model.dao.BoardDAO;
import com.kh.Reader25.board.model.vo.Attachment;
import com.kh.Reader25.board.model.vo.Board;
import com.kh.Reader25.board.model.vo.PageInfo;
import com.kh.Reader25.board.model.vo.SearchCondition;

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

	@Override
	public int getTIWListCount() {
		// TODO Auto-generated method stub
		return bDAO.getTIWListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectTIWList(PageInfo pi) {
		// TODO Auto-generated method stub
		return bDAO.selectTIWList(sqlSession, pi);
	}

	@Override
	public Board selectTIWBoard(int boardNo) {
		int result = bDAO.addTIWReadCount(sqlSession, boardNo);
		
		Board b = null;
		if(result > 0) {
			b = bDAO.selectTIWBoard(sqlSession, boardNo);
		}
		
		return b;
	}

	@Override
	public int insertBoardAndFiles(Board b, ArrayList<Attachment> atList) {
		int result = bDAO.insertBoard(sqlSession, b);
		if(result > 0) {
			result = bDAO.insertAttachmentList(sqlSession, atList);
		}
		
		return result;
	}

	public Board selectupTIWBoard(int boardNo) {
		Board b = null;
		
		b = bDAO.selectTIWBoard(sqlSession, boardNo);
		
		return b;
	}

	@Override
	public int updateTIWBoard(Board b) {
		// TODO Auto-generated method stub
		return bDAO.updateTIWBoard(sqlSession, b);
	}

	@Override
	public int deleteTIWBoard(int boardNo) {
		// TODO Auto-generated method stub
		return bDAO.deleteTIWBoard(sqlSession, boardNo);
	}

	

	@Override
	public int getSearchResultListCount(SearchCondition sc) {
		// TODO Auto-generated method stub
		return bDAO.getSearchResultListCount(sqlSession, sc);
	}

	
	
}
