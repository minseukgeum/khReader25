package com.kh.Reader25.member.model.vo;

import java.sql.Date;

public class Member {
	
	private String id;
	private String pwd;
	private String name;
	private Date birthDay;
	private String email;
	private String gender;
	private int age;
	private String phone;
	private String address;
	private String mbti;
	private Date enrollDate;
	private int point;
	private int rank;
	private String mStatus;
	private int grantId;
	
	public Member() {
		
	}

	public Member(String id, String pwd) {
		super();
		this.id = id;
		this.pwd = pwd;
	}

	public Member(String id, String pwd, String name, Date birthDay, String email, String gender, int age, String phone,
			String address, String mbti, Date enrollDate, int point, int rank, String mStatus, int grantId) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.birthDay = birthDay;
		this.email = email;
		this.gender = gender;
		this.age = age;
		this.phone = phone;
		this.address = address;
		this.mbti = mbti;
		this.enrollDate = enrollDate;
		this.point = point;
		this.rank = rank;
		this.mStatus = mStatus;
		this.grantId = grantId;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(Date birthDay) {
		this.birthDay = birthDay;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getMbti() {
		return mbti;
	}

	public void setMbti(String mbti) {
		this.mbti = mbti;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public String getmStatus() {
		return mStatus;
	}

	public void setmStatus(String mStatus) {
		this.mStatus = mStatus;
	}

	public int getGrantId() {
		return grantId;
	}

	public void setGrantId(int grantId) {
		this.grantId = grantId;
	}

	@Override
	public String toString() {
		return "Member [id=" + id + ", pwd=" + pwd + ", name=" + name + ", birthDay=" + birthDay + ", email=" + email
				+ ", gender=" + gender + ", age=" + age + ", phone=" + phone + ", address=" + address + ", mbti=" + mbti
				+ ", enrollDate=" + enrollDate + ", point=" + point + ", rank=" + rank + ", mStatus=" + mStatus
				+ ", grantId=" + grantId + "]";
	}
	
	

}
