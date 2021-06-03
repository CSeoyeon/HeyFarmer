<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import= "kr.ac.heyfarmer.board.Message" %>
<%@ page import= "kr.ac.heyfarmer.board.QnAboardService" %>
<%@ page import= "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	String msg_title = request.getParameter("msg_title");
	String msg_content = request.getParameter("msg_content");
	String msg_id = request.getParameter("msg_id");
	
	QnAboardService service = new QnAboardService();
	service.updateMessage(msg_title, msg_content, msg_id);
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("location.href = 'QnAView.jsp?msg_id=" + msg_id + "'");
	script.println("</script>");
%>
</body>
</html>
