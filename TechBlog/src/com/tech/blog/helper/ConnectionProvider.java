package com.tech.blog.helper;
import java.sql.*;
public class ConnectionProvider {
	public static Connection con;
	public static Connection getConnection() {
		try {
		
				Class.forName("com.mysql.jdbc.Driver");
				String url="jdbc:mysql://localhost:3306/techblog";
				Connection con=	DriverManager.getConnection(url,"root","Mysql@123");
				return con;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}
}
