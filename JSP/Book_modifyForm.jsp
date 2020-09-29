<%@page import="java.sql.*"%>
<%@page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>book_ModifyForm</title>
	</head>
	<body>
	<%
		String bnum = request.getParameter("bnum"); 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String bname = null;
		String bano = null;
		int bprice = 0;
		int byear = 0;
		String bpno = null;
		
		
		try{
			String url = "jdbc:mysql://localhost:3306/ESQL";
			String id = "root";
	        String pwd ="0000";
	        
	        Class.forName("com.mysql.jdbc.Driver");
	        conn = DriverManager.getConnection(url, id, pwd);
	        
	        String query = "SELECT * FROM BOOK WHERE bnum=?";
	        pstmt = conn.prepareStatement(query);
	        
	        pstmt.setString(1,bnum);
	        rs=pstmt.executeQuery();
	        
	        if(rs.next()){
	        
	        bname = rs.getString("bname");
	        bano = rs.getString("bano");
	        bprice = rs.getInt("bprice");
	        byear = rs.getInt("byear");
	        bpno = rs.getString("bpno");
	        }

	%>
	<fieldset>
	    <legend><h2><center><a style="background-color:pink">책 정보 수정</a></center></h2></legend>
	    <form name="form1" method="post" action="Book_modify.jsp">
	        <table>
	            <tr>
	                <td width ="169" align="left" class="edit1" scope="col"> 책번호(B#)</td>
	                <td width ="517" scope="col">
	                    <%=bnum %><input type="hidden" name ="bnum" id="bnum" value="<%=bnum%>">
	                </td>
	            </tr>
	            <tr>
	                <td width ="169" align="left" class="edit1" scope="col"> 책 이름</td>
	                <td width ="517" scope="col">
	                    <input type="text" name ="bname" id="bname" value="<%=bname%>">
	                </td>
	            </tr>
	            <tr>
	                <td width ="169" align="left" class="edit1" scope="col"> 작가번호(A#)</td>
	                <td width ="517" scope="col">
	                    <input type="text" name ="bano" id="bano" value="<%=bano%>">
	                </td>
	            </tr>
	           	<tr>
	                <td width ="169" align="left" class="edit1" scope="col"> 책 가격</td>
	                <td width ="517" scope="col">
	                    <input type="text" name ="bprice" id="bprice" value="<%=bprice%>">
	                </td>
	            </tr>
	            <tr>
	                <td width ="169" align="left" class="edit1" scope="col"> 출판연도</td>
	                <td width ="517" scope="col">
	                    <input type="text" name ="byear" id="byear" value="<%=byear%>">
	                </td>
	            </tr>
	            <tr>
	                <td width ="169" align="left" class="edit1" scope="col"> 출판사번호(P#)</td>
	                <td width ="517" scope="col">
	                    <input type="text" name ="bpno" id="bpno" value="<%=bpno%>">
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