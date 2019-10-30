<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page
	language="java"
	contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"
%>

<!-- Database에 MEMBER 테이블 생성 페이지 -->

<%
final String URL = "jdbc:oracle:thin:@127.0.0.1:1521:orcl";
final String USER = "JSP";
final String PW = "tiger";
final String SQL = "CREATE TABLE MEMBER(ID VARCHAR2(10) PRIMARY KEY, " +
									   "PASSWD VARCHAR2(10), " +
									   "NAME VARCHAR2(10), " +
									   "MAIL VARCHAR2(20))";

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection conn = DriverManager.getConnection(URL, USER, PW);
Statement statement = conn.createStatement();
statement.executeUpdate(SQL);

out.print("MEMBER 테이블이 생성되었습니다");

statement.close();
conn.close();

%>
