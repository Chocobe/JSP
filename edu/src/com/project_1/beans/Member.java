package com.project_1.beans;

// Java Beans 파일

public class Member {
	private String id;
	private String passwd;
	private String name;
	private String mail;
	
	
	public void setId(String id) {
		this.id = id;
	}
	public String getId() {
		return id;
	}
	
	
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getPasswd() {
		return passwd;
	}
	
	
	public void setName(String name) {
		this.name = name;
	}
	public String getName() {
		return name;
	}
	
	
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getMail() {
		return mail;
	}
}
