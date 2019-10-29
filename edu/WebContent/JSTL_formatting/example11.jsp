<%@ page
	language="java"
	contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"
%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<fmt:setLocale value="en"/>
<fmt:setBundle basename="com.edu.bundle.msg1"/>

<fmt:message var="name" key="name">
	<fmt:param>Amy</fmt:param>
</fmt:message> 

${name}