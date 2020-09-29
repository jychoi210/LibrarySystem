<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Reader_InsertForm</title>
	</head>
	<body>
	<fieldset>
	    <legend><h2><center><a style="background-color:pink">독자 정보 등록</a></center></h2>(모든 정보를 입력해주세요.)</legend>
	    <form name="form1" method="post" action="Reader_Insert.jsp">
	    <!-- <form name="form1" method="post" action="insert_pstmt.jsp"> -->
	        <table>
	            <tr>
	                <td width ="169" align="left" class="edit1" scope="col"> 독자번호(R#)</td>
	                <td width ="517" scope="col">
	                    <input type="text" name ="rnum" id="rnum">
	                </td>
	            </tr>
	            <tr>
	                <td width ="169" align="left" class="edit1" scope="col"> 독자이름</td>
	                <td width ="517" scope="col">
	                    <input type="text" name ="rname" id="rname">
	                </td>
	            </tr>
	            <tr>
	                <td width ="169" align="left" class="edit1" scope="col"> 독자나이</td>
	                <td width ="517" scope="col">
	                    <input type="text" name ="rage" id="rage">
	                </td>
	            </tr>
	           	<tr>
	                <td width ="169" align="left" class="edit1" scope="col"> 독자 등록일(YYMMDD)</td>
	                <td width ="517" scope="col">
	                    <input type="text" name ="rdate" id="rdate">
	                </td>
	            </tr>
	            <tr>
	                <td width ="169" align="left" class="edit1" scope="col"> 선호하는 작가번호(A#)</td>
	                <td width ="517" scope="col">
	                    <input type="text" name ="rano" id="rano">
	                </td>
	            </tr>
	            <tr>
	                <td width ="169" align="left" class="edit1" scope="col"> 선호하는 장르</td>
	                <td width ="517" scope="col">
	                    <input type="text" name ="rfield" id="rfield">
	                </td>
	            </tr>
	            <tr>
	                <td colspan="2" class="edit1"> <input type="submit" value="등록"></td></tr>          
	        </table>       
	    </form>
	    </fieldset>
	</body>
</html>