<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>
</head>
<body>
	<%
		try {
		request.setCharacterEncoding("utf-8"); //받아오는 인코딩을 utf-8로 지정
		String id = request.getParameter("id"); //SingUpForm에서 데이터를 끌어오기, getParamter은 해당 데이터의 name값을 가져온다
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String address = request.getParameter("address");
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspuser", "jspuser", "a12345");
		PreparedStatement pstmt = conn.prepareStatement("INSERT INTO userinfo(id, password, name, address) VALUES(?, ?, ?, ?)"); //insert쿼리
		pstmt.setString(1, id); //preparestatment 의 ?에 순서대로 값 입력
		pstmt.setString(2, password);
		pstmt.setString(3, name);
		pstmt.setString(4, address);
		pstmt.executeUpdate(); //select같은 조회는 executeQuery(), 데이터에 수정이 생길 경우 executeUpdate() 사용
		
		pstmt.close();
		conn.close();
		out.println("<script>alert('회원가입 완료'); location.href='LogIn.jsp'</script>");
		}
	
		catch(Exception e) {
			e.printStackTrace();
		}
	%>
</body>
</html>