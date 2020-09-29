<%@ page import="java.sql.*" contentType="text/html;charset=EUC-KR" %>
<% request.setCharacterEncoding("euc-kr"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<HTML>
<HEAD>
<TITLE> BookProgramMenu </TITLE>
</HEAD>
<body>
<h2><a target="data" href="data.jsp" style="background-color:pink;"><font color="white">menu</font></a></h2>

	<a target ="data" href="Reader_InsertForm.jsp">New Reader</a><br/>
	<a target ="data" href="Reader_list.jsp">Reader list</a><br/>
	<a target ="data" href="Reader_searchForm.jsp">Search Reader </a><br/>
	<a target ="data" href="Reader_searchNeedForm.jsp">Find Reader's need</a><br/>
	<a target ="data" href="Book_InsertForm.jsp">New Book</a><br/>
	<a target ="data" href="Book_list.jsp">Book list</a><br/>
	<a target ="data" href="Book_searchForm.jsp">Search Book </a><br/>
	<a target ="data" href="SaleStatus.jsp">Detail Sale Status </a>
</body>
</HTML>