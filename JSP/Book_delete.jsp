<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>독자 delete</title>
	</head>
	<body>
	<%
	    Connection conn = null;
		PreparedStatement pstmt = null;
		String bnum = request.getParameter("bnum");
		int n = 0;

	    try{
	    	String url = "jdbc:mysql://localhost:3306/ESQL";
	        String id = "root";
	        String pwd ="0000";
	        
	        Class.forName("com.mysql.jdbc.Driver");
	        conn = DriverManager.getConnection(url, id, pwd);
	        
	        String query ="DELETE FROM BOOK WHERE bnum = ?";
	        pstmt = conn.prepareStatement(query);
	        
	        pstmt.setString(1,bnum);
	        //pstmt.executeUpdate();

	        n = pstmt.executeUpdate();
	        
	        pstmt.close();
	        conn.close();
	    }catch(ClassNotFoundException e){
	    	out.println(e);
	    }catch(SQLException e){
	    	out.println(e);
	    }
	    response.sendRedirect("Book_list.jsp");
	 %>
	</body>
</html>