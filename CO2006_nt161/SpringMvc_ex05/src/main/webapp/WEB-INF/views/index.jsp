<!DOCTYPE HTML>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html lang="en">
<head> 
    <title>JSP output</title> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
</head>
<body>
<!--  
	<c:choose>
		<c:when test="${!empty name}"> 
			<p>Hello, ${name} !</p>
		</c:when>
		<c:when test="${!empty value}">
			<p>The value is ${value} !</p>
		</c:when>
		<c:otherwise>
			<p>Nothing to add.</p>
		</c:otherwise>
	</c:choose> 
-->
	<p><a href="/student"/>GO TO FORM</a></p>
	<hr/>
	<form:form method="GET" action="/redirect">
		<table>
		    <tr>
		    <td>
		    <input type="submit" value="Redirect Page"/>
		    </td>
		    </tr>
		</table>  
	</form:form>
</body>
</html>
