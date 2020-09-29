<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%request.setCharacterEncoding("UTF-8"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>독자 insert</title>
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
	        
	        String rnum = null;
	        String rname = null;
	        int rage = 0;
	        int rdate = 0;
	        String rano = null;
	        String rfield = null;
	        
	        rnum= new String(request.getParameter("rnum"));
	        rname= new String(request.getParameter("rname"));
	        rage= Integer.parseInt(request.getParameter("rage"));
	        rdate= Integer.parseInt(request.getParameter("rdate"));
	        rano = new String(request.getParameter("rano"));
	        rfield= new String(request.getParameter("rfield"));
	        
	        stmt = conn.createStatement();
	        rs = stmt.executeQuery("SELECT rnum FROM READER WHERE rnum = '"+rnum+"'");
	        
		        if(rs.next()){
		        	%>
		        	<script>
		        	alert("중복된 독자번호(R#)입니다.");
		        	history.go(-1);
		        	</script>
		        	<%
		        }else{
		        	stmt.executeUpdate("insert into READER values ('"+rnum+"','"+rname+"','"+rage+"','"+rdate+"','"+rano+"','"+rfield+"')");
		        	response.sendRedirect("Reader_list.jsp");
	        	}
		        stmt.close();
		        conn.close();
	        }catch(Exception e){
	        	e.printStackTrace();
	        	out.println("new 독자 데이터 1개 추가에 실패했습니다.");
	        }
	%>
	</body>
</html>
    
        