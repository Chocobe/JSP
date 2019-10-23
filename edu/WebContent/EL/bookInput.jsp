<%@ page
		language="java"
		contentType="text/html;charset=UTF-8"
		pageEncoding="UTF-8"
		session="true"
		buffer="8kb"
		autoFlush="true"
		info="책정보 입력 페이지 입니다"
%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>Book Input</title>
	</head>
	
	<body>
		<form action="example22.jsp" method="POST">
			책제목 : <input type="text" name="title"><br/>
			책저자 : <input type="text" name="author"><br/>
			출판사 : <input type="text" name="publisher"><br/>
			<input type="submit" value="등록">
		</form>
	</body>
</html>