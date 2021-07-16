package com.tech.blog.dao;
import java.sql.*;

public class likeDao {
	Connection con;
	
	public likeDao(Connection con) {
		this.con=con;
	}
	
	//addlike
	public boolean addLike(int postId,int userId) {
		try {
			String query="INSERT INTO LIKED_(PID,UID) VALUES(?,?)";
			PreparedStatement p=con.prepareStatement(query);
			p.setInt(1,postId);
			p.setInt(2,userId);
			int i=p.executeUpdate();
			if(i>0) {
				return true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//count like
	public int countLike(int postId) {
		int c=0;
		try {
			String query="SELECT COUNT(*) FROM LIKED_ WHERE PID=?";
			PreparedStatement p=con.prepareStatement(query);
			p.setInt(1, postId);
			ResultSet r=p.executeQuery();
			if(r.next()) {
				c=r.getInt("count(*)");  //r.getInt(1);
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return c;
	}

	//check already liked or not
	public boolean isAlreadyLiked(int postId,int userId) {
		
		try {
			String query="SELECT * FROM LIKED_ WHERE PID=? AND UID=?";
			PreparedStatement p=con.prepareStatement(query);
			p.setInt(2, userId);
			p.setInt(1, postId);
			ResultSet r=p.executeQuery();
			if(r.next())
				return true;
			else
				return false;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//dislike function
	public boolean deleteLike(int postId,int userId) {
		try {
			String query="DELETE  FROM LIKED_ WHERE PID=? AND UID=?";
			PreparedStatement p=con.prepareStatement(query);
			p.setInt(1,postId);
			p.setInt(2, userId);
			int i=p.executeUpdate();
			if(i>0) {
				return true;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
