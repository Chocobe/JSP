<%@ page
		language="java"
		contentType="text/html;charset=UTF-8"
		pageEncoding="UTF-8"
		session="true"
		buffer="8kb"
		autoFlush="true"
		info="입력받은 책정보를 처리하는 페이지 입니다"
%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>Input data Processor</title>
	</head>
	
	<body>
		<%
		request.setCharacterEncoding("UTF-8");
		%>
		
		<jsp:useBean class="com.edu.beans.BookBean" id="book"/>
		<jsp:setProperty name="book" property="*"/>
		
		<%
		application.setAttribute("book", book);
		%>
		
		<jsp:forward page="bookOutput.jsp"/>
	</body>
</html>