<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>
	<h1>로그인 성공</h1>
	<hr>
	<table>

	<%
		try {
			String session_id  = (String)session.getAttribute("id");
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn =   DriverManager.getConnection("jdbc:mysql://localhost:3306/jspuser", "jspuser","a12345");
			
			PreparedStatement pstmt = conn.prepareStatement("SELECT id, password, name, address FROM userinfo WHERE id = ?"); 
			pstmt.setString(1, session_id); 

			ResultSet rs = pstmt.executeQuery(); 
			while(rs.next()) {
				String id        = rs.getString(1); //결과 쿼리의 1번째 행의 값을 가져온다. id가 첫번째 이므로 id의 값을 가져온다.
				String password  = rs.getString(2);
				String name      = rs.getString(3);
				String address   = rs.getString(4);
	%>
	
	<tr>
		<td><b><%= id %></b>님 로그인을 축하드립니다. 회원님의 정보는</td>
		<td>비밀번호는 <b><%= password %></b></td>
		<td>이름은<b><%= name %></b></td>
		<td>주소는<b><%= address %></b> 입니다.</td>
	</tr>
	
	<% 
			}
		
			pstmt.close();
			conn.close();
		}
	
		catch(Exception e) {
			e.printStackTrace();
		}
	
	%>
</table>
</body>
</html>