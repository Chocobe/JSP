<%@ page
		language="java"
		contentType="text/html;charset=UTF-8"
		pageEncoding="UTF-8"
		session="true"
		buffer="8kb"
		autoFlush="true"
		info="전달받은 데이터를 출력하는 페이지 입니다"
%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>Output data</title>
	</head>
	
	<body>
		책제목 : ${book.title}
		책저자 : ${book.author}
		출판사 : ${book.publisher}
	</body>
</html>