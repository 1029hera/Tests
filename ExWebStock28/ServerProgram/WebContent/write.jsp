<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성 페이지</title>
</head>
<script>
function chkSubmit(){
	frm = document.forms['frm'];
	
	var name = frm['name'].value.trim();
	var stock = frm['stock'].value.trim();

	if(name == ""){
		alert("제품명은 반드시 입력해야 합니다.");
		frm['name'].focus();
		return false;
	}
	if(stock < 0){
		alert("제품제고는 0 이상이여야 합니다.");
		frm['stock'].focus();
		return false;
	}
	return true;
}
</script>
<body>
<h2>제품 정보 작성</h2>
<form name="frm" action="writeOk.jsp" method="post" onsubmit="return chkSubmit()">
제품명
<input type="text" name="name"/><br>
제품소개<br>
<textarea name="info"></textarea><br>
제품재고
<input type="number" name="stock"/><br>
<br><br>
<input type="submit" value="등록"/>
</form>
<br>
<button type="button" onclick="location.href = 'list.jsp'">목록으로</button>
</body>
</html>