<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Book_InsertForm</title>
	</head>
	<body>
	<fieldset>
	    <legend><h2><center><a style="background-color:pink">å ���� ���</a></center></h2>(��� ������ �Է����ּ���.)</legend>
	    <form name="form2" method="post" action="Book_Insert.jsp">
	    <!-- <form name="form1" method="post" action="insert_pstmt.jsp"> -->
	        <table>
	            <tr>
	                <td width ="169" align="left" class="edit1" scope="col"> å��ȣ(B#)</td>
	                <td width ="517" scope="col">
	                    <input type="text" name ="bnum" id="bnum">
	                </td>
	            </tr>
	            <tr>
	                <td width ="169" align="left" class="edit1" scope="col"> å�̸�</td>
	                <td width ="517" scope="col">
	                    <input type="text" name ="bname" id="bname">
	                </td>
	            </tr>
	            <tr>
	                <td width ="169" align="left" class="edit1" scope="col"> �۰���ȣ(A#)</td>
	                <td width ="517" scope="col">
	                    <input type="text" name ="bano" id="bano">
	                </td>
	            </tr>
	           	<tr>
	                <td width ="169" align="left" class="edit1" scope="col"> å ����</td>
	                <td width ="517" scope="col">
	                    <input type="text" name ="bprice" id="bprice">
	                </td>
	            </tr>
	            <tr>
	                <td width ="169" align="left" class="edit1" scope="col"> ���� ����</td>
	                <td width ="517" scope="col">
	                    <input type="text" name ="byear" id="byear">
	                </td>
	            </tr>
	            <tr>
	                <td width ="169" align="left" class="edit1" scope="col"> ���ǻ��ȣ(P#)</td>
	                <td width ="517" scope="col">
	                    <input type="text" name ="bpno" id="bpno">
	                </td>
	            </tr>
	            <tr>
	                <td colspan="2" class="edit1"> <input type="submit" value="���"></td></tr>          
	        </table>       
	    </form>
	    </fieldset>
	</body>
</html>