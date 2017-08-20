package com.dgit.controller;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MySQLConnectionTest {
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	private static final String URL = "jdbc:mysql://127.0.0.1:3306/book_ex";
	private static final String id = "root";
	private static final String pw = "rootroot";
	
	@Test
	public void testConnection() throws ClassNotFoundException{
		Class.forName(DRIVER);
		Connection conn = null;
		
		try{
			conn = DriverManager.getConnection(URL, id, pw);
			System.out.println(conn);
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}



