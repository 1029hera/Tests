<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<c:choose>
	<c:when test="${empty list || fn:length(list) == 0 }">
		<script>
			alert("해당 정보가 삭제되거나 없습니다");
			history.back();
		</script>
	</c:when>
	
	<c:otherwise>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰 수정</title>
</head>


<body>
<h2>쿠폰 수정</h2>
<form name="frm" action="updateOk" method="post" >
	<input type="hidden" name="cid" value="${list[0].cid }"/>
	쿠폰 이름: 
	<input type="text" name="name" value="${list[0].name }"/><br>
	쿠폰 종류: 
	<input type="text" name="kind" value="${list[0].kind }"/><br>
	쿠폰 일련번호
	<input type="text" name="sno" value="${list[0].sno }"/><br>
	<br><br>
	<input type="submit" value="수정"/>
	</form>
	<button onclick="history.back();">이전으로</button>
	<button onclick="location.href='list'">목록보기</button>
<br>

</body>
</html>
	</c:otherwise>
</c:choose>
