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
		${param.id} / ${param.pwd}<br/>
		${param["id"]} / ${param["pwd"]}
	</body>
</html>