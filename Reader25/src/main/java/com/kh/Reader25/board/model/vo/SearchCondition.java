package com.kh.Reader25.board.model.vo;

public class SearchCondition {
	
	
	private String mId;
	
	private String title;
	
	private String content;
	
	private int code;
	
	
	public SearchCondition() {}


	public SearchCondition(String mId, String title, String content, int code) {
		super();
		this.mId = mId;
		this.title = title;
		this.content = content;
		this.code = code;
	}


	public String getmId() {
		return mId;
	}


	public void setmId(String mId) {
		this.mId = mId;
	}


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getCode() {
		return code;
	}


	public void setCode(int code) {
		this.code = code;
	}


	@Override
	public String toString() {
		return "SearchCondition [mId=" + mId + ", title=" + title + ", content=" + content + ", code=" + code + "]";
	}
	
	










	

	
	
	
	
	
	
	
	
	
	
	

}
