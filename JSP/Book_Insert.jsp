<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>책 insert</title>
	</head>
	<body>
	<%
	    Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
	    
	    try{
	    	String url = "jdbc:mysql://localhost:3306/ESQL";
	        String id = "root";
	        String pwd ="0000";
	        
	        Class.forName("com.mysql.jdbc.Driver");
	        conn = DriverManager.getConnection(url, id, pwd);
	        
	        String bnum = null;
	        String bname = null;
	        String bano = null;
	        int bprice = 0;
	        int byear = 0;
	        String bpno = null;
	        
	        bnum= new String(request.getParameter("bnum"));
	        bname= new String(request.getParameter("bname"));
	        bano = new String(request.getParameter("bano"));
	        bprice= Integer.parseInt(request.getParameter("bprice"));
	        byear= Integer.parseInt(request.getParameter("byear"));
	        bpno= new String(request.getParameter("bpno"));
	        
	        stmt = conn.createStatement();
	        rs = stmt.executeQuery("SELECT bnum FROM BOOK WHERE bnum = '"+bnum+"'");
	        
		        if(rs.next()){
		        	%>
		        	<script>
		        	alert("중복된 책번호(B#)입니다.");
		        	history.go(-1);
		        	</script>
		        	<%
		        }else{
		        	stmt.executeUpdate("insert into BOOK values ('"+bnum+"','"+bname+"','"+bano+"','"+bprice+"','"+byear+"','"+bpno+"')");
		        	response.sendRedirect("Book_list.jsp");
	        	}
		        stmt.close();
		        conn.close();
	        }catch(Exception e){
	        	e.printStackTrace();
	        	out.println("new 책 데이터 1개 추가에 실패했습니다.");
	        }
	%>
	</body>
</html>
    
        