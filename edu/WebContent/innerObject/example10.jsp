<%@ page 
			language="java" 
			contentType="text/html;charset=UTF-8"
			pageEncoding="UTF-8"
%>
    
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>Result</title>
	</head>

	<body>
		<% 
			request.setCharacterEncoding("UTF-8");
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			
			if(id.isEmpty() || pwd.isEmpty()) {
				request.setAttribute("error", "ID 또는 비밀번호를 입력해 주세요");
				RequestDispatcher dispatcher = request.getRequestDispatcher("logInOut.jsp");
				dispatcher.forward(request, response);
				return;
			}
		%>
		
		<%= id %> / <%= pwd %>
	</body>
</html>