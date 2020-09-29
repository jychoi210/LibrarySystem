<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>책 modify</title>
	</head>
	<body>
	<div align="center">
	<%
	    Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String bnum = request.getParameter("bnum");
		String bname = request.getParameter("bname");
		String bano = request.getParameter("bano");
		int bprice = Integer.parseInt(request.getParameter("bprice"));
		int byear = Integer.parseInt(request.getParameter("byear"));
		String bpno = request.getParameter("bpno");
		int n = 0;

	    try{
	    	String url = "jdbc:mysql://localhost:3306/ESQL";
	        String id = "root";
	        String pwd ="0000";
	        
	        Class.forName("com.mysql.jdbc.Driver");
	        conn = DriverManager.getConnection(url, id, pwd);

	        String query = "UPDATE BOOK SET bname=?, bano=?, bprice=?, byear=?, bpno=? WHERE bnum=?";
	        pstmt = conn.prepareStatement(query);
	        
	        pstmt.setString(1,bname);
	        pstmt.setString(2, bano);
	        pstmt.setInt(3, bprice);
	        pstmt.setInt(4, byear);
	        pstmt.setString(5, bpno);
	        pstmt.setString(6, bnum);
	        
	        n = pstmt.executeUpdate();
	        
	    }catch(SQLException e){
	    	out.println(e.getMessage());
	    }finally{
	    	if(pstmt != null){try{pstmt.close();} catch(SQLException e){}}
	    	if(conn != null){try{conn.close();} catch(SQLException e){}}
	    }
	 %>
	 <script>
	 if(<%=n%> > 0){
		 alert("수정되었습니다.");
		 location.href="Book_list.jsp"
	 }else{
		 alert("수정에 실패했습니다.");
		 history.go(-1);
	 }
	 </script>
	 </div>
	 </body>
</html>

