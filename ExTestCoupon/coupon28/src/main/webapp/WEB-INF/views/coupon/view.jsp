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
<title>쿠폰 조회</title>
</head>
<script>

function chkDelete(cid){
	// 삭제 여부, 다시 확인 하고 진행하기
	var r = confirm("삭제하시겠습니까?");
	
	if(r){
		location.href = 'deleteOk?cid=' + cid;
	}
} // chkDelete

</script>
<body>
<h2>쿠폰 조회</h2>
		<br>
		CID : ${list[0].cid }<br>
		쿠폰 이름 : ${list[0].name }<br>
		쿠폰 종류: ${list[0].kind }<br>
		쿠폰 일련번호: ${list[0].sno }<br>
		<hr>
		<br>
		<button onclick="location.href='update?cid=${list[0].cid }'">수정하기</button>
		<button onclick="location.href='list'">목록보기</button>
		<button onclick="chkDelete(${list[0].cid })">삭제하기</button>
		<button onclick="location.href='write'">신규등록</button>

</body>
</html>

	</c:otherwise>
</c:choose>