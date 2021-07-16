package com.tech.blog.dao;
import java.sql.*;

import com.tech.blog.entities.User;


public class userDao {
	private Connection con;
	
	public userDao(Connection con) {
		this.con=con;
	}
	
	//add new user with about(bio)
	public int addUser(User u) {
			
		try {
			
			String query="INSERT INTO USER(NAME,EMAIL,INSTITUTE,PASSWORD) VALUES(?,?,?,?)";
			PreparedStatement p=con.prepareStatement(query);
			p.setString(1,u.getUsername());
			p.setString(2,u.getEmail());
			p.setString(3,u.getInstitute());
			p.setString(4,u.getPassword());
			//p.setString(5,u.getAbout());
			int a=p.executeUpdate();
			return a;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	//add new user with about 
	public int addUserAbt(User u) {
		try {
			
			String query="INSERT INTO USER(NAME,EMAIL,INSTITUTE,PASSWORD,ABOUT) VALUES(?,?,?,?,?)";
			PreparedStatement p=con.prepareStatement(query);
			p.setString(1,u.getUsername());
			p.setString(2,u.getEmail());
			p.setString(3,u.getInstitute());
			p.setString(4,u.getPassword());
			p.setString(5,u.getAbout());
			int a=p.executeUpdate();
			return a;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	//get user by email and password
	public User getUser(String email,String pass) {
		User u=null;
		try {
			String query="SELECT * FROM USER WHERE EMAIL=? AND PASSWORD=?";
			PreparedStatement p=con.prepareStatement(query);
			p.setString(1, email);
			p.setString(2, pass);
			ResultSet r=p.executeQuery();
			if(r.next()) {
				u=new User();
				
				u.setUsername(r.getString("NAME"));
				u.setEmail(r.getString("EMAIL"));
				u.setId((r.getInt("ID")));
				u.setInstitute(r.getString("INSTITUTE"));
				u.setAbout(r.getString("ABOUT"));
				u.setPassword(r.getString("PASSWORD"));
				u.setProfile(r.getString("PROFILE"));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return u;
	}
	
	//update user by using id
	public boolean updateUser(User u) {
		try {
			
			String query="UPDATE USER SET NAME=?,INSTITUTE=?,PASSWORD=?,ABOUT=?,PROFILE=? WHERE ID=?";
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1,u.getUsername());
			ps.setString(2, u.getInstitute());
			ps.setString(3, u.getPassword());
			ps.setString(4, u.getAbout());
			ps.setString(5, u.getProfile());
			ps.setInt(6, u.getId());
			
			int a=ps.executeUpdate();
			if(a>0) {
				return true;
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//get user by user id
	public User getUserByUserId(int uid) {
		User u=null;
		try {
			String Query="SELECT * FROM USER WHERE ID=?";
			PreparedStatement p=con.prepareStatement(Query);
			p.setInt(1, uid);
			ResultSet r=p.executeQuery();
			if(r.next()) {
				u=new User();

				u.setUsername(r.getString("NAME"));
				u.setEmail(r.getString("EMAIL"));
				u.setId(uid);
				u.setInstitute(r.getString("INSTITUTE"));
				u.setAbout(r.getString("ABOUT"));
				u.setPassword(r.getString("PASSWORD"));
				u.setProfile(r.getString("PROFILE"));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return u;
	}
}
