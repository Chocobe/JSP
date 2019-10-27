<%@ tag
		language="java"
		pageEncoding="UTF-8"
		body-content="empty"
%>

<%@ tag import="java.util.Calendar" %>

<% Calendar date = Calendar.getInstance(); %>

<%= date.get(Calendar.YEAR) %> -
<%= date.get(Calendar.MONTH) %> -
<%= date.get(Calendar.DATE) %>
