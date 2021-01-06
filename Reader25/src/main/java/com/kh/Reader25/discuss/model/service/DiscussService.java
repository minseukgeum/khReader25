package com.kh.Reader25.discuss.model.service;

import java.util.ArrayList;

import com.kh.Reader25.board.model.vo.Attachment;
import com.kh.Reader25.board.model.vo.PageInfo;
import com.kh.Reader25.discuss.model.vo.Discuss;

public interface DiscussService {

	int getListCount();

	ArrayList<Discuss> selectList(PageInfo pi);

	int insertDiscuss(Discuss d, Attachment at);

	Discuss selectDiscuss(int dNo);

}
