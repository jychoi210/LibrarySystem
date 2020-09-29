<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>독자 modify</title>
	</head>
	<body>
	<%
	    Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String rnum = request.getParameter("rnum");
		String rname = request.getParameter("rname");
		int rage = Integer.parseInt(request.getParameter("rage"));
		int rdate = Integer.parseInt(request.getParameter("rdate"));
		String rano = request.getParameter("rano");
		String rfield = request.getParameter("rfield");
		int n = 0;

	    try{
	    	String url = "jdbc:mysql://localhost:3306/ESQL";
	        String id = "root";
	        String pwd ="0000";
	        
	        Class.forName("com.mysql.jdbc.Driver");
	        conn = DriverManager.getConnection(url, id, pwd);

	        String query = "UPDATE READER SET rname=?, rage=?, rdate=?, rano=?, rfield=? WHERE rnum=?";
	        pstmt = conn.prepareStatement(query);
	        
	        pstmt.setString(1,rname);
	        pstmt.setInt(2, rage);
	        pstmt.setInt(3, rdate);
	        pstmt.setString(4, rano);
	        pstmt.setString(5, rfield);
	        pstmt.setString(6, rnum);
	        
	        n = pstmt.executeUpdate();
	        
	    }catch(SQLException e){
	    	out.println(e.getMessage());
	    }finally{
	    	if(pstmt != null){try{pstmt.close();} catch(SQLException e){}}
	    	if(conn != null){try{conn.close();} catch(SQLException e){}}
	    }
	    //response.sendRedirect("Reader_list.jsp");
	 %>
	 <script>
	 if(<%=n%> > 0){
		 alert("수정되었습니다.");
		 location.href="Reader_list.jsp"
	 }else{
		 alert("수정에 실패했습니다.");
		 history.go(-1);
	 }
	 </script>
	 </body>
</html>

