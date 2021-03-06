<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>   <%-- JDBC 관련 클래스 import --%>
<%@ page import = "java.time.*" %>
<%@ page import = "java.time.format.*" %>
<%!
	// JDBC 관련 기본 객체 변수들 선언
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;    // SELECT 결과,  executeQuery()
	int cnt = 0;            // DML 결과,   executeUpdate()
	
	// Connection 에 필요한 값 세팅
	// ORACLE 버젼
	final String DRIVER = "oracle.jdbc.driver.OracleDriver"; // JDBC 드라이버 클래스
	final String URL = "jdbc:oracle:thin:@localhost:1521:XE"; // DB 접속 URL
	final String USERID = "scott26";   // DB 접속 계정 정보
	final String USERPW = "tiger26";
%>
<%!
	// 쿼리문 준비
	final String SQL_WRITE_SELECT =
		"SELECT pid, name, info, stock, regdate FROM exam_stock";
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>목록</title>
<style>
table {width: 100%;}
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<body>
<%
	try{
		Class.forName(DRIVER);
		out.println("드라이버 로딩 성공<br>");  // 테스트 출력
		conn = DriverManager.getConnection(URL, USERID, USERPW);
		out.println("conn 성공<br>");  // 테스트 출력
		
		// 트랜잭션 수행
pstmt = conn.prepareStatement(SQL_WRITE_SELECT);
		
		rs = pstmt.executeQuery();
		out.println("쿼리성공<br>");
		
%>
		<hr>
		<h2>리스트</h2>
		<table>
			<tr>
				<th>제품ID</th>
				<th>제품명</th>
				<th>제품재고</th>
				<th>등록일</th>
			</tr>
<%
	while(rs.next()){
		
		int pid = rs.getInt("pid");  // 컬럼명
		String name = rs.getString("name");
		int stock = rs.getInt("stock");
		String regdate = "";
		Timestamp timestamp = rs.getTimestamp("regdate");
		if(timestamp != null)
			regdate = timestamp.toLocalDateTime()
			.format(DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss"));
		
		
		out.println("<tr>");
		out.println("<td>" + pid + "</td>");
		out.println("<td><a href='view.jsp?pid=" + pid + "'>" + name + "</a></td>");
		out.println("<td>" + stock + "</td>");
		out.println("<td>" + regdate + "</td>");
		out.println("</tr>");
	} // end while
%>		
		</table>
		<br>
		<button onclick="location.href='write.jsp'">신규등록</button>
<%	
	} catch(Exception e){
		e.printStackTrace();
		// ※ 예외처리를 하든지, 예외 페이지를 설정해주어야 한다.
	} finally {
		// DB 리소스 해제
		try{			
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		} catch(Exception e){
			e.printStackTrace();
		}		
	} //  end try
%>
</body>
</html>
