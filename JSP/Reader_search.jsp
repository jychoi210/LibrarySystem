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
	        
	        String query ="SELECT * FROM READER WHERE rnum='"+rnum+"'";
	        rs = stmt.executeQuery(query);
	        
	        %>
	        <table style="border-style:double" border = "1px double" bordercolor="pink" cellspacing="0" align="center">
	        <caption><h2>�˻� ���</h2></caption>
	        <tr bgcolor="pink">
	        	<td bordercolor="white" style="border-style:double">���ڹ�ȣ</td>
	        	<td bordercolor="white" style="border-style:double">�����̸�</td>
	        	<td bordercolor="white" style="border-style:double">���ڳ���</td>
	        	<td bordercolor="white" style="border-style:double">���� �����</td>
	        	<td bordercolor="white" style="border-style:double">��ȣ�ϴ� �۰���ȣ</td>
	        	<td bordercolor="white" style="border-style:double">��ȣ�ϴ� �帣</td>
	        	<td bordercolor="white" style="border-style:double">���</td>
	        </tr>	        
	       <%
	        if(rs.next()){
	      	%>
	        	
	        	<tr>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getString("rnum") %></td>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getString("rname") %></td>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getInt("rage") %></td>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getInt("rdate") %></td>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getString("rano") %></td>
	        		<td bordercolor="pink" style="border-style:double"><%=rs.getString("rfield") %></td>
	        		<td bordercolor="pink" style="border-style:double">	        		
	        		<a href="Reader_delete.jsp?rnum=<%=rs.getString("rnum")%>" onClick="alert('<%=rs.getString("rnum")%>�� �����Ͱ� �����˴ϴ�.')" >����</a>
	        		<INPUT type = "button" value="����" onClick = "location.href='Reader_modifyForm.jsp?rnum=<%=rs.getString("rnum")%>'">
	        		</td>
	        	</tr>
	        	<%
	        	}
	        else{
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