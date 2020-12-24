package com.kh.Reader25.board.model.vo;

import java.sql.Date;

public class Comments {
	private int comNo;
	private String comment;
	private Date comDate;
	private String status;
	private int boardNo;
	private String userId;
	
	public Comments() {}

	public Comments(int comNo, String comment, Date comDate, String status, int boardNo, String userId) {
		super();
		this.comNo = comNo;
		this.comment = comment;
		this.comDate = comDate;
		this.status = status;
		this.boardNo = boardNo;
		this.userId = userId;
	}

	public int getComNo() {
		return comNo;
	}

	public void setComNo(int comNo) {
		this.comNo = comNo;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getComDate() {
		return comDate;
	}

	public void setComDate(Date comDate) {
		this.comDate = comDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "Comments [comNo=" + comNo + ", comment=" + comment + ", comDate=" + comDate + ", status=" + status
				+ ", boardNo=" + boardNo + ", userId=" + userId + "]";
	}
}
