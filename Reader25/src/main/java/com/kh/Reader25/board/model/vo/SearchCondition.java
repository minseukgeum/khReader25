package com.kh.Reader25.board.model.vo;

public class SearchCondition {
	
	private String writer;
	private String title;
	private String Content;
	
	public SearchCondition() {
		
	}

	public SearchCondition(String writer, String title, String content) {
		super();
		this.writer = writer;
		this.title = title;
		Content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}

	@Override
	public String toString() {
		return "SearchCondition [writer=" + writer + ", title=" + title + ", Content=" + Content + "]";
	}
}
