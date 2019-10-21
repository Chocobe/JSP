<%@ page
		language="java"
		contentType="text/html;charset=UTF-8"
		pageEncoding="UTF-8" 
%>

<%@ page import="java.sql.*" %>
    
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>

	<body>
		<%
		// 1. JDBC Driver 로딩하기
		Class.forName("oracle.jdbc.driver.OracleDriver");
		
		// 2. DB 서버 접속하기
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		Connection conn = DriverManager.getConnection(url, "JSP", "tiger");
		
		// 3. Statement or PreparedStatement 객체 생성하기
		Statement statement = conn.createStatement();
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		PreparedStatement preStatement = conn.prepareStatement("INSERT INTO TEST VALUES(?, ?)");
		preStatement.setString(1, id);
		preStatement.setString(2, pwd);
		preStatement.executeUpdate();
		
		// 4. SQL 실행
		/* statement.executeQuery("CREATE TABLE TEST(ID VARCHAR2(5), PWD VARCHAR2(5))"); */
		statement.executeUpdate("INSERT INTO TEST VALUES('aa', '11')");
		statement.executeUpdate("INSERT INTO TEST VALUES('bb', '22')");
		statement.executeUpdate("INSERT INTO TEST VALUES('cc', '33')");
		
		ResultSet resultSet = statement.executeQuery("SELECT * FROM TEST");
		
		while(resultSet.next()) {
			out.print("<br>" + resultSet.getString("ID") + " : " + resultSet.getString(2));
		}
		
		// 5. 자원 해제
		resultSet.close();
		statement.close();
		conn.close();
		%>
	</body>
</html>