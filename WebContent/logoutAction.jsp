<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import= "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>logout Action</title>
</head>
<body>
<%
	session.invalidate();
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("location.href = 'login.jsp'");
	script.println("</script>");
%>
</body>
</html>