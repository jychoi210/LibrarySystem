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
	        <caption><h2>�˻� ���</h2></caption>
	        <tr bgcolor="pink">
	        	<td bordercolor="white" style="border-style:double">å��ȣ</td>
	        	<td bordercolor="white" style="border-style:double">å�̸�</td>
	        	<td bordercolor="white" style="border-style:double">�۰���ȣ</td>
	        	<td bordercolor="white" style="border-style:double">å����</td>
	        	<td bordercolor="white" style="border-style:double">���ǿ���</td>
	        	<td bordercolor="white" style="border-style:double">���ǻ��ȣ</td>
	        	<td bordercolor="white" style="border-style:double">���</td>
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
	        		<a href="Book_delete.jsp?bnum=<%=rs.getString("bnum")%>" onClick="alert('<%=rs.getString("bnum")%>�� �����Ͱ� �����˴ϴ�.')" >����</a>
	        		<INPUT type = "button" value="����" onClick = "location.href='Book_modifyForm.jsp?bnum=<%=rs.getString("bnum")%>'">
	        		</td>
	        	</tr>
	        	<%
	        	}
	       		%>
	       	</table><% 	
	        	}catch(Exception e){
	        		
	        	e.printStackTrace();
	        	out.println("ȣ�⿡ �����߽��ϴ�.");
	        	}finally{
	        	if(rs != null) try{rs.close();} catch(SQLException sqle){}
	        	if(stmt != null) try{stmt.close();} catch(SQLException sqle){}
	        	if(conn != null) try{conn.close();} catch(SQLException sqle){}
	        	}
	        	%>
</body>
</html>