<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
	<form action="Reader_searchAuthor.jsp" method="get">
	<table>
		<tr> <a style="background-color:pink"><font color="white">독자가 선호하는 작가에 따른 책 추천</font></a>
		<td> <p>검색할 독자번호(R#)</p> </td>
		<td><input name ="rnum" type="text" size ="20" /></td>
		<td align="center"colspan="2"><input type="submit" value=" 검색" onClick ="true"></td>
		</tr>
	</table>
	</form>
	<form action="Reader_searchGenre.jsp" method="get">
	<table>
		<tr> <a style="background-color:pink"><font color="white">독자가 선호하는 장르에 따른 책 추천</font></a>
		<td> <p>검색할 독자번호(R#)</p> </td>
		<td><input name ="rnum" type="text" size ="20" /></td>
		<td align="center"colspan="2"><input type="submit" value=" 검색" onClick ="true"></td>
		</tr>
	</table>
	</form>
	</body>
</html>