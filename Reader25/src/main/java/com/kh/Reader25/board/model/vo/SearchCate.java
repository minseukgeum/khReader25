package com.kh.Reader25.board.model.vo;

public class SearchCate {
	
	private String userId;
	private String cate;
	
	public SearchCate() {
	
	}

	public SearchCate(String userId, String cate) {
		super();
		this.userId = userId;
		this.cate = cate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCate() {
		return cate;
	}

	public void setCate(String cate) {
		this.cate = cate;
	}

	@Override
	public String toString() {
		return "SearchCate [userId=" + userId + ", cate=" + cate + "]";
	}
	
}
