<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성패여부판단</title>
</head>
<body>
	<%
		try {
		int count = 0;
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id"); 
		String password = request.getParameter("password");
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn =   DriverManager.getConnection("jdbc:mysql://localhost:3306/jspuser", "jspuser","a12345");
		
		PreparedStatement pstmt = conn.prepareStatement("SELECT id, password FROM userinfo WHERE id = ? AND password = ?"); //select쿼리
		pstmt.setString(1, id); 
		pstmt.setString(2, password);
		ResultSet rs = pstmt.executeQuery(); //결과값 도출
		
		while(rs.next()) {
			count++; //rs가 한번이라도  돌면 count의 값 추가
		}
		
		if(count == 0) {
			out.println("<script>alert('아이디 혹은 비밀번호가 잘못되셨습니다.'); location.href='LogIn.jsp'</script>"); //만약에 rs가 한번도 안 돌았으면-
		}
		
		else if(count == 1) {
			out.println("<script>alert('로그인 성공'); location.href='LogInSuccess.jsp'</script>");//만약에 rs가 한번 돌았으면- 그 값이 이미 있다는 뜻
		}
	
		pstmt.close();
		conn.close();
		}
	
		catch(Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>