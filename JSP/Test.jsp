<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>
<html>
	<head>
		<title>�����ͺ��̽� ����</title>
	</head>
	<body>
		<%@page import="java.sql.*" %>
			<h3>Databases�� ����̹� ���� ����</h3>
			<%
			try {
			String url = "jdbc:mysql://localhost:3306/ESQL";
			String id = "root";
			String pass = "0000";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(url,id,pass);
			out.println("Database�� ���ӵǾ����ϴ�.");
			con.close();
			}
			catch(Exception e){
			out.println("Database���� �Ұ�");
			out.println(e.getMessage());
			e.printStackTrace();
			}%>
	</body>
</html>