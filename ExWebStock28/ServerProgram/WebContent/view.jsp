<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>   <%-- JDBC 관련 클래스 import --%>
<%@ page import = "java.time.*" %>
<%@ page import = "java.time.format.*" %>
<% // parameter 받아오기
	int pid = Integer.parseInt(request.getParameter("pid"));
	// ※ 이단계에서 parameter 검증 필요
%>
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
	final String SQL_WRITE_SELECT_BY_PID = 
			"SELECT pid, name, info, stock, regdate FROM exam_stock "
			+ "WHERE pid = ?";

	String name = "";
	String info = "";
	int stock = 0;
	String regdate = "";
%>
<%
	try{
		Class.forName(DRIVER);
		out.println("드라이버 로딩 성공<br>");  // 테스트 출력
		conn = DriverManager.getConnection(URL, USERID, USERPW);
		out.println("conn 성공<br>");  // 테스트 출력
		
		// 트랜잭션 수행
		conn.setAutoCommit(false);  // 일단 auto-commit 을  끈다.
				
		pstmt = conn.prepareStatement(SQL_WRITE_SELECT_BY_PID);
		pstmt.setInt(1, pid);
		rs = pstmt.executeQuery();

		// 한개의 레코드만 select 된다.
		if(rs.next()){
		pid = rs.getInt("pid");  // 컬럼명
		name = rs.getString("name");
		info = rs.getString("info");
		stock = rs.getInt("stock");
		if(info == null) info = "";  // null 인경우 처리
		regdate = "";
		Timestamp timestamp = rs.getTimestamp("regdate");
		if(timestamp != null)
			regdate = timestamp.toLocalDateTime()
				.format(DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss"));
		} else {
			// pid 값의 글이 없는 것이다!
%>
			<script>
				alert("해당 정보가 삭제되거나 없습니다");
				history.back();
			</script>
<%		
			return; // ★더이상 JSP 프로세싱 하지 않고 종료★
		} // end if
				
		conn.commit();  // 트랜잭션이 성공적으로 끝나면 commit
		
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
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title><%= name %></title>
</head>
<script>
function chkDelete(pid){
	var r = confirm("삭제하시겠습니까?");
	if(r){
		location.href = "deleteOk.jsp?pid=" + pid;
	}
}
</script>
<body>
<h2><%= name %> 정보</h2>
<br>
제품ID : <%= pid %><br>
제품명 : <%= name %><br>
제품재고 : <%= stock %><br>
등록일: <%= regdate %><br><br>
제품소개 <br>
<hr>
<div>
<%= info %>
</div>
<hr>
<br>
<button onclick="location.href='update.jsp?pid=<%= pid%>'">수정하기</button>
<button onclick="location.href='list.jsp'">목록보기</button>
<button onclick="chkDelete(<%= pid %>)">삭제하기</button>
<button onclick="location.href='write.jsp'">신규등록</button>
</body>
</html>
