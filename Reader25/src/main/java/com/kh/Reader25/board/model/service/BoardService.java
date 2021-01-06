package com.kh.Reader25.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.Reader25.board.model.vo.Attachment;
import com.kh.Reader25.board.model.vo.Board;
import com.kh.Reader25.board.model.vo.Comments;
import com.kh.Reader25.board.model.vo.Liketo;
import com.kh.Reader25.board.model.vo.PageInfo;

public interface BoardService {

	int getListCount(int code);

	ArrayList<Board> selectList(PageInfo pi, int code);

	int insertTIW(Board b);

	int getTIWListCount();

	ArrayList<Board> selectTIWList(PageInfo pi);

	Board selectTIWBoard(int boardNo);

	int insertBoardAndFiles(Board b, ArrayList<Attachment> atList);
	Board selectupTIWBoard(int boardNo);

	int updateTIWBoard(Board b);

	int deleteTIWBoard(int boardNo);

	Board selectBoard(int boardNo);

	ArrayList<Attachment> selectAttachmentList(int boardNo);

	int findLike(HashMap<String, Object> map);

	void deleteLike(Liketo like);

	void insertLike(Liketo like);

	ArrayList<Attachment> selectAttachmentTList(int atcCode);

	int insertBoardAndFile(Board b, Attachment at);

	int insertComments(Comments c);

	int updateCount(Comments c);

	ArrayList<Comments> selectCommentsList(int bId);

	int updateLike(Liketo like);



	
}
