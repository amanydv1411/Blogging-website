package com.tech.blog.entities;

public class User {
	
	private int id;
	private String username;
	private String email;
	private String institute;
	private String about;
	private String password;
	private String profile;
	
	public User() {
		// TODO Auto-generated constructor stub
	}

	public User(int id, String username, String email, String institute, String about, String password) {
	
		this.id = id;
		this.username = username;
		this.email = email;
		this.institute = institute;
		this.about = about;
		this.password = password;
	}

	

	

	public User(String username, String email, String institute, String about, String password) {
	
		this.username = username;
		this.email = email;
		this.institute = institute;
		this.about = about;
		this.password = password;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getInstitute() {
		return institute;
	}

	public void setInstitute(String institute) {
		this.institute = institute;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}
	
}
