<%@ page
		language="java"
		contentType="text/html;charset=UTF-8"
		pageEncoding="UTF-8"
%>

<%@ taglib prefix="my" uri="http://myTags.com" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>Custom Tag</title>
	</head>
	
	<body>
		<my:first color="blue"><%= 1 + 2 %></my:first>
		<h1>Custom Tag Test !!</h1>
	</body>
</html>