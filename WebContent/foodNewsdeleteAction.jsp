<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="kr.ac.heyfarmer.board.foodnewsboardService" %>
<html>
<head>
<meta http-equiv = "Content-Type" content = "text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String msg_id = request.getParameter("msg_id");
			
			foodnewsboardService service = new foodnewsboardService();
			service.deleteMessage(msg_id);
	%>
	
	<script type="text/javascript">
		location.href = 'foodNews.jsp'
	</script>
	
</body>
</html>