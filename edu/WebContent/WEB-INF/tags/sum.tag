<%@ tag
		pageEncoding="UTF-8"
		body-content="empty"
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ attribute name="num1" required="true" %>
<%@ attribute name="num2" required="true" %>

<%@ variable name-given="result" variable-class="java.lang.Long" scope="AT_END" %>

<c:set var="result" value="${num1 + num2}"/>