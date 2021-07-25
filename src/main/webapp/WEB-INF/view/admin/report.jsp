<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Search</title>
</head>
<body>
	<h3>inventory</h3>
<table  style="width:100%"class="table table-striped">
<tr>
	<th>Categories</th>
	<th>Total cost</th>
	<th>Quantity</th>
</tr>
<c:forEach var="item" items="${items}">
	<tr>
		<td>${item.group.name}</td>
		<td>${item.sum}</td>
		<td>${item.count}</td>
	</tr>
</c:forEach>
</table>
</body>
</html>