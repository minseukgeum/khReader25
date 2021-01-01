package com.kh.Reader25.board.model.service;

import java.util.ArrayList;

import com.kh.Reader25.board.model.vo.Board;
import com.kh.Reader25.board.model.vo.PageInfo;

public interface BoardService {

	int getListCount(int code);

	ArrayList<Board> selectList(PageInfo pi, int code);

	int insertTIW(Board b);

	
}
