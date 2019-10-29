<%@ page
	language="java"
	contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<sql:setDataSource var="myoracle2"
				   driver="oracle.jdbc.driver.OracleDriver"
				   url="jdbc:oracle:thin:@127.0.0.1:1521:orcl"
				   user="scott"
				   password="tiger"/>
				   
<sql:query var="result" dataSource="${myoracle2}">
	SELECT * FROM DEPT
</sql:query>

<table border="1">
	<tr>
		<c:forEach var="colName" items="${result.columnNames}">
			<th><c:out value="${colName}"/></th>
		</c:forEach>
	</tr>
	
	<c:forEach var="row" items="${result.rows}">
		<tr>
			<td><c:out value="${row.deptno}"/></td>
			<td><c:out value="${row.dname}"/></td>
			<td><c:out value="${row.loc}"/></td>
		</tr>
	</c:forEach>
</table>
