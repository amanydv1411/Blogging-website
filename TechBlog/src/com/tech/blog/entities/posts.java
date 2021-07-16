package com.tech.blog.entities;

import java.sql.Timestamp;

public class posts {
	private int pid;
	private String tittle;
	private String content;
	private String pic;
	private Timestamp pdate;
	private int cid;
	private int userId;
	public posts() {
		
	}

	public posts(int pid, String content, String tittle, String pic, Timestamp pdate, int cid,int userId) {
		this.pid = pid;
		this.tittle = tittle;
		this.content = content;
		this.pic = pic;
		this.pdate = pdate;
		this.cid = cid;
		this.userId=userId;
	}
	
	public posts(String tittle, String content, String pic, int cid,int userId) {
	
		this.tittle = tittle;
		this.content = content;
		this.pic = pic;
		this.cid = cid;
		this.userId=userId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getPid() {
		return pid;
	}

	public void setPid(int pid) {
		this.pid = pid;
	}

	public String getTittle() {
		return tittle;
	}

	public void setTittle(String tittle) {
		this.tittle = tittle;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPic() {
		return pic;
	}

	public void setPic(String pic) {
		this.pic = pic;
	}

	public Timestamp getPdate() {
		return pdate;
	}

	public void setPdate(Timestamp pdate) {
		this.pdate = pdate;
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	
}
