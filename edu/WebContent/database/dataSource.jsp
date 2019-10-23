<%@ page
		language="java"
		contentType="text/html;charset=UTF-8"
		pageEncoding="UTF-8"
%>

<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<%
		String resourceDirectory = "java:comp/env/jdbc/myoracle";
		
		// 1. JNDI 서버객체 생성 (WAS-Tomcat과 연결된다)
		InitialContext initContext = new InitialContext();
		
		// 2. WAS-Tomcat 으로부터 Resource를 가져온다. (DataSource객체) - JNDI서버 사용으로
		DataSource dataSource = (DataSource)initContext.lookup(resourceDirectory);
		
		// 3. DataSource객체를 통해서 Connection Pool에 있는 Connection 객체를 가져온다.
			// getConnection() 메소드에서 인자값이 있으면, 에러가 발생한다.
		Connection connection = dataSource.getConnection();
		
		// 4. 쿼리 수행
		Statement statement = connection.createStatement();
		ResultSet resultSet = statement.executeQuery("SELECT * FROM TEST");
		
		while(resultSet.next()) {
			out.print("<h3>ID : " + resultSet.getString("ID") + "<br/>");
			out.print("PW : " + resultSet.getString("PASSWORD") + "</h3><hr/>");
		}
		
		// 5. 사용했던 자원 해제
		resultSet.close();
		statement.close();
		connection.close();
		%>
	</body>
</html>