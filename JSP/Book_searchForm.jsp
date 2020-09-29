<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
	<form action="Book_searchBnum.jsp" method="get">
	<table>
		<tr>
		<td> <p>검색할 책번호(B#)</p> </td>
		<td><input name ="bnum" type="text" size ="20" /></td>
		<td align="center"colspan="2"><input type="submit" value=" 검색" onClick ="true"></td>
		</tr>
	</table>
	</form>
	<form action="Book_searchAnum.jsp" method="get">
	<table>
		<tr>
		<td> <p>검색할 작가번호(A#)</p> </td>
		<td><input name ="bano" type="text" size ="20" /></td>
		<td align="center"colspan="2"><input type="submit" value=" 검색" onClick ="true"></td>
		</tr>
	</table>
	</form>
	<form action="Book_searchPnum.jsp" method="get">
	<table>
		<tr>
		<td> <p>검색할 출판사번호(P#)</p> </td>
		<td><input name ="bpno" type="text" size ="20" /></td>
		<td align="center"colspan="2"><input type="submit" value=" 검색" onClick ="true"></td>
		</tr>
	</table>
	</form>
	<form action="Book_searchRank.jsp" method="get">
	<table>
		<tr>
		<td> <p>검색할 책 인기순위(1~20)</p> </td>
		<td><input name ="rank" type="text" size ="20" /></td>
		<td align="center"colspan="2"><input type="submit" value=" 검색" onClick ="true"></td>
		</tr>
	</table>
	</form>
	</body>
</html>