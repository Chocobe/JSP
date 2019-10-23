<%@page import="java.util.Enumeration"%>
<%@ page
		language="java"
		contentType="text/html;charset=UTF-8"
		pageEncoding="UTF-8"
%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>EL</title>
	</head>
	
	<body>
		<%
		Enumeration<String> list = request.getHeaderNames();
		while(list.hasMoreElements()) {
			String key = list.nextElement();
			out.print("<br/>" + key + " : " + request.getHeader(key));
		}
		%>
		
		<hr/>
		
		${header}
	</body>
</html>