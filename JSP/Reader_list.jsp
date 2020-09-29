<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>독자 list</title>
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
	        
	        String query ="SELECT * FROM READER";
	        rs = stmt.executeQuery(query);
	        
	        String rnum = request.getParameter("rnum");
	        %>
	        <table cellpadding="2px" style="border-style:double" border = "1px double" bordercolor="pink" cellspacing="0" align="center">
	        <caption><h2>Reader list</h2></caption>
	        <tr bgcolor="pink" align= "center">
	        	<td bordercolor="white" style="border-style:double">독자번호</td>
	        	<td bordercolor="white" style="border-style:double">독자이름</td>
	        	<td bordercolor="white" style="border-style:double">독자나이</td>
	        	<td bordercolor="white" style="border-style:double">독자 등록일</td>
	        	<td bordercolor="white" style="border-style:double"> 선호하는<br/>작가번호</td>
	        	<td bordercolor="white" style="border-style:double">선호하는 장르</td>
	        	<td bordercolor="white" style="border-style:double">비고</td>
	        </tr>	        
	       <%
	        while(rs.next()){
	      	%>
	        	
	        	<tr>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getString("rnum") %></td>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getString("rname") %></td>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getInt("rage") %></td>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getInt("rdate") %></td>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getString("rano") %></td>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getString("rfield") %></td>
	        		<td bordercolor="pink" style="border-style:double">	        		
	        		<a href="Reader_delete.jsp?rnum=<%=rs.getString("rnum")%>" onClick="alert('<%=rs.getString("rnum")%>의 데이터가 삭제됩니다.')" >삭제</a>
	        		<INPUT type = "button" value="수정" onClick = "location.href='Reader_modifyForm.jsp?rnum=<%=rs.getString("rnum")%>'">
	        		</td>
	        	</tr>
	        	<%
	        	}
	       		%>
	       	</table><% 	
	        	}catch(Exception e){
	        		
	        	e.printStackTrace();
	        	out.println("독자 list 호출에 실패했습니다.");
	        	}finally{
	        	if(rs != null) try{rs.close();} catch(SQLException sqle){}
	        	if(stmt != null) try{stmt.close();} catch(SQLException sqle){}
	        	if(conn != null) try{conn.close();} catch(SQLException sqle){}
	        	}
	        	%>	        	
	</body>
</html>
