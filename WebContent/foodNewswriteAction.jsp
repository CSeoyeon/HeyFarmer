 <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import= "kr.ac.heyfarmer.board.Message" %>
<%@ page import= "kr.ac.heyfarmer.board.foodnewsboardService" %>
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
	String user_id = (String)session.getAttribute("userId");
	
	Message msg = new Message();
	msg.setMsg_title(msg_title);
	msg.setMsg_content(msg_content);
	msg.setUser_id(user_id);
	
	foodnewsboardService service = new foodnewsboardService();
	int result = service.write(msg);
	
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("location.href = 'foodNews.jsp'");
	script.println("</script>");
%>
</body>
</html>
