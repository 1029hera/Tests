<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 목록</title>
<style>
table {width: 100%;}
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
th {
	background-color: #3296FF;
	font-weight: bold;
}
</style>
</head>
<body>
	<hr>
	<h2>쿠폰 목록</h2>
	<table>
		<tr>
			<th>CID</th>
			<th>쿠폰 이름</th>
			<th>쿠폰 종류</th>
		</tr>

		<c:choose>
		<c:when test="${empty list || fn:length(list) == 0 }">
		</c:when>
		<c:otherwise>
			<c:forEach var="dto" items="${list }">
				<tr>
					<td>${dto.cid }</td>  <%-- dto.getMid() --%>
					<td><a href="view?cid=${dto.cid }">${dto.name }</a></td>
					<td>${dto.kind }</td>  
				</tr>			
			</c:forEach>
		</c:otherwise>
		</c:choose>

	</table>
	<br>
	<button onclick="location.href='write'">신규등록</button>
</body>
</html>