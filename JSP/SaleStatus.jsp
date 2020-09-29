<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Detail Sale Status</title>
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
	        stmt = conn.createStatement();
	        
	        String query ="SELECT * FROM SALESTATUS_DETAIL";
	        rs = stmt.executeQuery(query);
	        
	        %>
	        <table cellpadding="2px" style="border-style:double" border = "1px double" bordercolor="pink" cellspacing="0" align="center" width="80%" height= "100px">
	        <caption><h2>Detail Sale Status</h2></caption>
	        <tr bgcolor="pink" align= "center" >
	        	<td  bordercolor="white" style="border-style:double">순위</td>
	        	<td bordercolor="white" style="border-style:double">작가 이름</td>
	        	<td bordercolor="white" style="border-style:double">책이름</td>
	        	<td bordercolor="white" style="border-style:double">출판사 이름</td>
	        	<td bordercolor="white" style="border-style:double">판매개수</td>
	        </tr>	        
	       <%
	        while(rs.next()){
	      	%>	       	
	        	<tr>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getInt("rank") %></td>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getString("aname") %></td>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getString("bname") %></td>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getString("pname") %></td>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getInt("sale") %></td>
	        	</tr>
	        	<%
	        	}
	       		%>
	       	</table><% 	
	        	}catch(Exception e){
	        		
	        	e.printStackTrace();
	        	out.println("인기순위 호출에 실패했습니다.");
	        	out.println(e.getMessage());
	        	}finally{
	        	if(rs != null) try{rs.close();} catch(SQLException sqle){}
	        	if(stmt != null) try{stmt.close();} catch(SQLException sqle){}
	        	if(conn != null) try{conn.close();} catch(SQLException sqle){}
	        	}
	        	%>	        	
	</body>
</html>
