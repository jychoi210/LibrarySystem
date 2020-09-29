<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	    Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String bpno = request.getParameter("bpno");

	    try{
	    	String url = "jdbc:mysql://localhost:3306/ESQL";
	        String id = "root";
	        String pwd ="0000";
	        
	        Class.forName("com.mysql.jdbc.Driver");
	        conn = DriverManager.getConnection(url, id, pwd);
	        stmt = conn.createStatement();
	        
	        String query ="SELECT * FROM BOOK WHERE bpno='"+bpno+"'";
	        rs = stmt.executeQuery(query);
	        
	        %>
	        <table style="border-style:double" border = "1px double" bordercolor="pink" cellspacing="0" align="center">
	        <caption><h2>검색 결과</h2></caption>
	        <tr bgcolor="pink">
	        	<td bordercolor="white" style="border-style:double">책번호</td>
	        	<td bordercolor="white" style="border-style:double">책이름</td>
	        	<td bordercolor="white" style="border-style:double">작가번호</td>
	        	<td bordercolor="white" style="border-style:double">책가격</td>
	        	<td bordercolor="white" style="border-style:double">출판연도</td>
	        	<td bordercolor="white" style="border-style:double">출판사번호</td>
	        	<td bordercolor="white" style="border-style:double">비고</td>
	        </tr>	        
	       <%
	        while(rs.next()){
	      	%>
	        	
	        	<tr>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getString("bnum") %></td>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getString("bname") %></td>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getString("bano") %></td>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getInt("bprice") %></td>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getInt("byear") %></td>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getString("bpno") %></td>
	        		<td bordercolor="pink" style="border-style:double">	        		
	        		<a href="Book_delete.jsp?bnum=<%=rs.getString("bnum")%>" onClick="alert('<%=rs.getString("bnum")%>의 데이터가 삭제됩니다.')" >삭제</a>
	        		<INPUT type = "button" value="수정" onClick = "location.href='Book_modifyForm.jsp?bnum=<%=rs.getString("bnum")%>'">
	        		</td>
	        	</tr>
	        	<%
	        	}
	       		%>
	       	</table><% 	
	        	}catch(Exception e){
	        		
	        	e.printStackTrace();
	        	out.println("호출에 실패했습니다.");
	        	}finally{
	        	if(rs != null) try{rs.close();} catch(SQLException sqle){}
	        	if(stmt != null) try{stmt.close();} catch(SQLException sqle){}
	        	if(conn != null) try{conn.close();} catch(SQLException sqle){}
	        	}
	        	%>
</body>
</html>