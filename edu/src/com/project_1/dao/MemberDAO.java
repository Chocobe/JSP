package com.project_1.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.project_1.beans.Member;

public class MemberDAO {
	private static final String DRIVER;
	private static final String URL;
	private static final String USER;
	private static final String PW;
	
	static {
		DRIVER = "oracle.jdbc.driver.OracleDriver";
		URL = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
		USER = "JSP";
		PW = "tiger";
	}
	
	public Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName(DRIVER);
			conn = DriverManager.getConnection(URL, USER, PW);
		
		} catch(ClassNotFoundException e) {
			System.out.println(e.getMessage());
			
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return conn;
	}
	
	
	public void insertMember(Member member) {
		String sql = "INSERT INTO MEMBER(ID, PASSWD, NAME, MAIL) VALUES(?, ?, ?, ?)";
		
		try {
			PreparedStatement preStatement = getConnection().prepareStatement(sql);
			preStatement.setString(1, member.getId());
			preStatement.setString(2, member.getPasswd());
			preStatement.setString(3, member.getName());
			preStatement.setString(4, member.getMail());
			
			preStatement.executeUpdate();
			
		} catch(SQLException e) {
			System.out.println(e.getMessage());
		}
	}
}
