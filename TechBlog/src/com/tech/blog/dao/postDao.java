package com.tech.blog.dao;
import java.sql.*;
import java.util.ArrayList;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.posts;
public class postDao {
	Connection con;
	public postDao() {
	}
	
	public postDao(Connection con) {
		this.con = con;
	}
	 
	//get all categories
	public ArrayList<Category> getCategory(){
		ArrayList<Category> cat=new ArrayList<>();
		try {
			String query="SELECT * FROM CATEGORY";
			Statement s=con.createStatement();
			ResultSet r=s.executeQuery(query);
			while(r.next()) {
				Category c=new Category();
				c.setCid(r.getInt(1));//r.getInt(cid);
				c.setName(r.getString(2));
				c.setDescription(r.getString(3));
				cat.add(c);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return cat;
	}
	
	//add posts
	public boolean addPost(posts p) {
		try {
			String query="INSERT INTO POSTS(CONTENT,TITTLE,PIC,CID,USERID) VALUES(?,?,?,?,?)";
			PreparedStatement pstmt=con.prepareStatement(query);
			pstmt.setString(1, p.getContent());
			pstmt.setString(2, p.getTittle());
			pstmt.setString(3, p.getPic());
			pstmt.setInt(4, p.getCid());
			pstmt.setInt(5, p.getUserId());
			
			int i=pstmt.executeUpdate();
			if(i>0) {
				
				return true;
			}
			else
				return false;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//get all posts
	public ArrayList<posts> getposts(){
		ArrayList<posts> al=new ArrayList<>();
		try {
			String query="SELECT * FROM POSTS ORDER BY PID DESC";
			PreparedStatement p=con.prepareStatement(query);
			ResultSet r=p.executeQuery();
			while(r.next()) {
				posts post=new posts(r.getInt(1) , r.getString(2), r.getString(3),r.getString(4) , r.getTimestamp(5),r.getInt(6), r.getInt(7));
				al.add(post);
			}
			return al;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	
	//get all posts by category id
	public ArrayList<posts> getpostsCid(int cid){
		ArrayList<posts> al=new ArrayList<>();
		try {
			String query="SELECT * FROM POSTS WHERE CID=? ORDER BY PID DESC";
			PreparedStatement p=con.prepareStatement(query);
			p.setInt(1, cid);
			ResultSet r=p.executeQuery();
			while(r.next()) {
				posts post=new posts(r.getInt(1) , r.getString(2), r.getString(3),r.getString(4) , r.getTimestamp(5),cid, r.getInt(7));
				al.add(post);
			}
			return al;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return al;
	}
	
	//get single post using post id
	public posts getPostPid(int pid) {
		posts post=null;
		try {
			String query="SELECT * FROM POSTS WHERE PID=?";
			PreparedStatement p=con.prepareStatement(query);
			p.setInt(1,pid);
			ResultSet r=p.executeQuery();
			if(r.next()) {
				post=new posts(pid , r.getString(2), r.getString(3),r.getString(4) , r.getTimestamp(5),r.getInt(6), r.getInt(7));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return post;
	}
}
