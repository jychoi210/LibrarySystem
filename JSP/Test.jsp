<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<html>
	<head>
		<title>데이터베이스 설계</title>
	</head>
	<body>
		<%@page import="java.sql.*" %>
			<h3>Databases와 드라이버 연결 여부</h3>
			<%
			try {
			String url = "jdbc:mysql://localhost:3306/ESQL";
			String id = "root";
			String pass = "0000";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,id,pass);
			out.println("Database에 접속되었습니다.");
			con.close();
			}
			catch(Exception e){
			out.println("Database접속 불가");
			out.println(e.getMessage());
			e.printStackTrace();
			}%>
	</body>
</html>