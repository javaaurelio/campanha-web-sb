package com.in28minutes.springboot.web.model;

public class Emails {
	private String user;
	private String desc;

	public Emails(String user, String desc) {
		super();
		this.user = user;
		this.desc = desc;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getDesc() {
		return desc;
	}

	public void setDesc(String desc) {
		this.desc = desc;
	}


}