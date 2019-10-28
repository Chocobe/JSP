<%@ page
		language="java"
		contentType="text/html;charset=UTF-8"
		pageEncoding="UTF-8"
%>

<%@ taglib prefix="my" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<my:chart color="#F4FA58" title="서 적">
			소설<br/>
			역사<br/>
			인문<br/>
		</my:chart>
		
		<my:chart title="운 동" color="#58ACFA">
			축구<br/>
			배구<br/>
			농구<br/>
		</my:chart>
	</body>
</html>