package com.conn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {

	public static String DBName="userdb";
	public static String DBUSER="root";
	public static String DBPASSWORD="root";
	
	public static Connection conn = null;
	
	//getCon()
	public static Connection getConn()  {
		
		try
		{
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("Driver Registered....");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+DBName,DBUSER,DBPASSWORD);
			System.out.println("Connection established....");
		}
		catch(Exception e)
		{
//			e.printStackTrace();
			throw new RuntimeException("something went wrong : "+ e);
		}
		return conn;
			
	}	
}


