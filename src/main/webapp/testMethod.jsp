<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.company.dao.*" %>
<%@page import="com.company.modal.*" %>
<%@page import="com.company.connection.DbCon" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		OrderDao odao = new OrderDao(DbCon.getConnection());
		Order o = odao.getOrderById(36);
	%>
	<p><%=o.getOrderId() %></p>
</body>
</html>