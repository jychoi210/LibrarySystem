<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Reader_ModifyForm</title>
	</head>
	<body>
	<%
		String rnum = request.getParameter("rnum"); 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String rname = null;
		String rano = null;
		String rfield = null;
		int rage = 0;
		int rdate = 0;
		
		
		try{
			String url = "jdbc:mysql://localhost:3306/ESQL";
			String id = "root";
	        String pwd ="0000";
	        
	        Class.forName("com.mysql.jdbc.Driver");
	        conn = DriverManager.getConnection(url, id, pwd);
	        
	        String query = "SELECT * FROM READER WHERE rnum=?";
	        pstmt = conn.prepareStatement(query);
	        
	        pstmt.setString(1,rnum);
	        rs=pstmt.executeQuery();
	        
	        if(rs.next()){
	        
	        rname = rs.getString("rname");
	        rage = rs.getInt("rage");
	        rdate = rs.getInt("rdate");
	        rano = rs.getString("rano");
	        rfield = rs.getString("rfield");
	        }

	%>
	<fieldset>
	    <legend><h2><center><a style="background-color:pink">독자 정보 수정</a></center></h2></legend>
	    <form name="form1" method="post" action="Reader_modify.jsp">
	        <table>
	            <tr>
	                <td width ="169" align="left" class="edit1" scope="col"> 독자번호(R#)</td>
	                <td width ="517" scope="col">
	                    <%=rnum %><input type="hidden" name ="rnum" id="rnum" value="<%=rnum%>">
	                </td>
	            </tr>
	            <tr>
	                <td width ="169" align="left" class="edit1" scope="col"> 독자이름</td>
	                <td width ="517" scope="col">
	                    <input type="text" name ="rname" id="rname" value="<%=rname%>">
	                </td>
	            </tr>
	            <tr>
	                <td width ="169" align="left" class="edit1" scope="col"> 독자나이</td>
	                <td width ="517" scope="col">
	                    <input type="text" name ="rage" id="rage" value="<%=rage%>">
	                </td>
	            </tr>
	           	<tr>
	                <td width ="169" align="left" class="edit1" scope="col"> 독자 등록일(YYMMDD)</td>
	                <td width ="517" scope="col">
	                    <input type="text" name ="rdate" id="rdate" value="<%=rdate%>">
	                </td>
	            </tr>
	            <tr>
	                <td width ="169" align="left" class="edit1" scope="col"> 선호하는 작가번호(A#)</td>
	                <td width ="517" scope="col">
	                    <input type="text" name ="rano" id="rano" value="<%=rano%>">
	                </td>
	            </tr>
	            <tr>
	                <td width ="169" align="left" class="edit1" scope="col"> 선호하는 장르</td>
	                <td width ="517" scope="col">
	                    <input type="text" name ="rfield" id="rfield" value="<%=rfield%>">
	                </td>
	            </tr>
	            <tr>
	                <td colspan="2" class="edit1"> <input type="submit" value="수정"></td></tr>          
	        </table>       
	    </form>
	    </fieldset>
	    <%
	    }catch(SQLException e){
	    	out.println(e.getMessage());
	    }finally{
	    	try{
	    		if(rs != null) rs.close();
	    		if(pstmt != null) pstmt.close();
	    		if(conn != null) conn.close();
	    	}catch(SQLException e){
	    		out.println(e.getMessage());
	    	}
	    }
	    %>
	</body>
</html>