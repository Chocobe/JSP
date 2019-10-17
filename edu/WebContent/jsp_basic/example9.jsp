<%@ page 
			language="java" 
			contentType="text/html;charset=UTF-8"
			pageEncoding="UTF-8"
%>
    
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>

	<body>
		<h3>선언문으로 구현한 덧셈</h3>
		<%!
			public int sum(int a, int b) {
			return a + b;
		}
		%>
		
		덧셈결과 : <%= sum(20, 30) %>
	</body>
</html>