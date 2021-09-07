<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>쿠폰 등록</title>
</head>
<body>
<h2>쿠폰 등록</h2>
<form name="frm" action="writeOk" method="post">
쿠폰 이름
<input type="text" name="name"/><br>
쿠폰 종류
<input type="text" name="kind"/><br>
<!-- 
<select name="kind">
    <option value="정기권">정기권</option>
    <option value="할인권">할인권</option>
</select><br>
 -->

쿠폰 일련번호
<input type="text" name="sno" placeholder="####-##-##"/><br>
<br><br>
<input type="submit" value="등록"/>
</form>
<br>
<button type="button" onclick="location.href = 'list'">목록으로</button>
</body>
</html>