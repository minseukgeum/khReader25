package com.kh.Reader25.board.model.vo;

import java.sql.Date;

public class Attachment {
	private int atcNo;
	private int atvLevel;
	private int atcCode; //첨부위치
	private String atcOrigin; // 원본파일명
	private String atcName; // 변경한 파일명
	private String atcPath; // 파일경로
	private Date atcDate; // 등록일
	private String atcStatus; 
	private int boardNo;
	
	public Attachment() {}

	public Attachment(int atcNo, int atvLevel, int atcCode, String atcOrigin, String atcName, String atcPath,
			Date atcDate, String atcStatus, int boardNo) {
		super();
		this.atcNo = atcNo;
		this.atvLevel = atvLevel;
		this.atcCode = atcCode;
		this.atcOrigin = atcOrigin;
		this.atcName = atcName;
		this.atcPath = atcPath;
		this.atcDate = atcDate;
		this.atcStatus = atcStatus;
		this.boardNo = boardNo;
	}

	public int getAtcNo() {
		return atcNo;
	}

	public void setAtcNo(int atcNo) {
		this.atcNo = atcNo;
	}

	public int getAtvLevel() {
		return atvLevel;
	}

	public void setAtvLevel(int atvLevel) {
		this.atvLevel = atvLevel;
	}

	public int getAtcCode() {
		return atcCode;
	}

	public void setAtcCode(int atcCode) {
		this.atcCode = atcCode;
	}

	public String getAtcOrigin() {
		return atcOrigin;
	}

	public void setAtcOrigin(String atcOrigin) {
		this.atcOrigin = atcOrigin;
	}

	public String getAtcName() {
		return atcName;
	}

	public void setAtcName(String atcName) {
		this.atcName = atcName;
	}

	public String getAtcPath() {
		return atcPath;
	}

	public void setAtcPath(String atcPath) {
		this.atcPath = atcPath;
	}

	public Date getAtcDate() {
		return atcDate;
	}

	public void setAtcDate(Date atcDate) {
		this.atcDate = atcDate;
	}

	public String getAtcStatus() {
		return atcStatus;
	}

	public void setAtcStatus(String atcStatus) {
		this.atcStatus = atcStatus;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "Attachment [atcNo=" + atcNo + ", atvLevel=" + atvLevel + ", atcCode=" + atcCode + ", atcOrigin="
				+ atcOrigin + ", atcName=" + atcName + ", atcPath=" + atcPath + ", atcDate=" + atcDate + ", atcStatus="
				+ atcStatus + ", boardNo=" + boardNo + "]";
	}
}
