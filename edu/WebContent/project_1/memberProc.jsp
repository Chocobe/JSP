<%@page import="com.project_1.biz.MemberService"%>
<%@ page
	language="java"
	contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"
%>

<%
request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="member" class="com.project_1.beans.Member"/>
<jsp:setProperty name="member" property="*"/>

<%
MemberService service = new MemberService();
service.memberInsert(member);

RequestDispatcher dispatcher = request.getRequestDispatcher("memberOutput.jsp");
dispatcher.forward(request, response);
%>

<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		
	</body>
</html>