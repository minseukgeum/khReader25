package com.kh.Reader25.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.Reader25.board.model.dao.BoardDAO;
import com.kh.Reader25.board.model.vo.Attachment;
import com.kh.Reader25.board.model.vo.Board;
import com.kh.Reader25.board.model.vo.Comments;
import com.kh.Reader25.board.model.vo.Liketo;
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
	public Board selectBoard(int boardNo) {
		Board b = null;
		// 1. 조회수 증가
		int result = bDAO.addReadCount(sqlSession, boardNo);
		if(result > 0) {
			b = bDAO.selectBoard(sqlSession, boardNo);
		}
		return b;
	}

	@Override
	public ArrayList<Attachment> selectAttachmentList(int boardNo) {
		return bDAO.selectAttachmentList(sqlSession, boardNo);
	}

	@Override
	public int findLike(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return bDAO.findLike(sqlSession, map);
	}

	@Override
	public void deleteLike(Liketo like) {
		// TODO Auto-generated method stub
		
		
		bDAO.deleteLike(sqlSession, like);
	}

	@Override
	public void insertLike(Liketo like) {
		// TODO Auto-generated method stub
		bDAO.insertLike(sqlSession, like);
		
	}

	public ArrayList<Attachment> selectAttachmentTList(int atcCode) {
		return bDAO.selectAttachmentTList(sqlSession, atcCode);
	}

	@Override
	public int insertBoardAndFile(Board b, Attachment at) {
		int result = bDAO.insertBoard(sqlSession, b);
		if(result > 0) {
			result = bDAO.insertAttachment(sqlSession, at);
		}
		return result;
	}

	@Override
	public int insertComments(Comments c) {
		// TODO Auto-generated method stub
		return bDAO.insertComments(sqlSession, c);
	}

	@Override
	public int updateCount(Comments c) {
		// TODO Auto-generated method stub
		return bDAO.updateCount(sqlSession, c);
	}

	@Override
	public ArrayList<Comments> selectCommentsList(int bId) {
		// TODO Auto-generated method stub
		return bDAO.selectCommentsList(sqlSession, bId);
	}

	@Override
	public int updateLike(Liketo like) {
		// TODO Auto-generated method stub
		return bDAO.updateLike(sqlSession, like.getB_no());
	}



	
	
}
