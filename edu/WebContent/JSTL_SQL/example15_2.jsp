<%@ page
	language="java"
	contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:update dataSource="jdbc/myoracle">
	UPDATE TEST SET PASSWORD=? WHERE ID=?
	<sql:param value="${'1004'}"/>
	<sql:param value="${'aa'}"/>
</sql:update>

<sql:query var="rs" dataSource="jdbc/myoracle">
	SELECT * FROM TEST
</sql:query>

<table border="1">
	<tr>
		<c:forEach var="colName" items="${rs.columnNames}">
			<th><c:out value="${colName}"/></th>
		</c:forEach>
	</tr>
	
	<c:forEach var="row" items="${rs.rows}">
		<tr>
			<td><c:out value="${row.id}"/></td>
			<td><c:out value="${row.password}"/></td>
		</tr>
	</c:forEach>
</table>
