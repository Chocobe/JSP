<%@ page 
			language="java" 
			contentType="text/html;charset=UTF-8"
			pageEncoding="UTF-8"
			buffer="8kb"
			autoFlush="true"
%>
    
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>구구단</title>
	</head>

	<body>
		<h3>표현식으로 구구단 출력</h3>
		<%
			for(int i = 2; i < 10; i++) {
				for(int j = 2; j < 10; j++) { %>
					<%= i %> * <%= j %> = <%= i * j %><br/>
					<% } %><br/>
			<% } %>
	</body>
</html>