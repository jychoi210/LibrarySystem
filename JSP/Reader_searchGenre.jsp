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
		String rnum = request.getParameter("rnum");

	    try{
	    	String url = "jdbc:mysql://localhost:3306/ESQL";
	        String id = "root";
	        String pwd ="0000";
	        
	        Class.forName("com.mysql.jdbc.Driver");
	        conn = DriverManager.getConnection(url, id, pwd);
	        stmt = conn.createStatement();
	        
	        String query ="SELECT READER.rname, READER.rfield, BOOK.bname, PUBLISHER.pname, BOOK.bprice FROM READER,PUBLISHER,BOOK"
	        +"WHERE READER.rfield = PUBLISHER.pfield AND PUBLISHER.pnum = BOOK.bpno AND rnum='"+rnum+"'";
	        rs = stmt.executeQuery(query);
	        
	        %>
	       	<table style="border-style:double" border = "1px double" bordercolor="pink" cellspacing="0" align="center">
	        <caption><h2>�˻� ���</h2></caption>
	        <tr bgcolor="pink">
	        	<td bordercolor="white" style="border-style:double">�����̸�</td>
	        	<td bordercolor="white" style="border-style:double">���� ��ȣ �帣</td>
	        	<td bordercolor="white" style="border-style:double">��õ�ϴ� å �̸�</td>
	        	<td bordercolor="white" style="border-style:double">å ���ǻ�</td>
	        	<td bordercolor="white" style="border-style:double">å ����</td>
	        </tr>	        
	       <%
	        if(rs.next()){
	      	%>
	        	
	        	<tr>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getString("rname") %></td>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getString("rfield") %></td>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getString("bname") %></td>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getString("pname") %></td>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getInt("bprice") %></td>
	        	</tr>
	        	<%
	        	}else{
		        	%>
		        	<script>
		        	alert("�˻������ �����ϴ�.");
		        	history.go(-1);
		        	</script><%
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