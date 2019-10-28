<%@ tag
		language="java"
		pageEncoding="UTF-8"
		body-content="scriptless"
%>

<%@ attribute name="title" required="true" %>
<%@ attribute name="color" required="true" %>

<p>
	<table border="1">
		<tr>
			<th>${title}</th>
		</tr>
		
		<tr>
			<td bgcolor="${color}"><jsp:doBody/></td>
		</tr>		
	</table>
</p>
