package com.training.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MyConnection {
	
	public static Connection getConnection() throws SQLException
	{
		Connection conn = null;
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		System.out.println("Driver Loaded");
		//conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tpo","ft","ft123");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/tpo", "root", "");
		
		System.out.println("Connection Established");
		return conn;
		}
		catch(ClassNotFoundException e){
			e.printStackTrace();
		}
		
		return null;
	}
	
	
	
	

}
