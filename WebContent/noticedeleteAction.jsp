<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="kr.ac.heyfarmer.board.noticeboardService" %>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String msg_id = request.getParameter("msg_id");
			
			noticeboardService service = new noticeboardService();
			service.deleteMessage(msg_id);
	%>
	
	<script type="text/javascript">
		location.href = 'notice.jsp'
	</script>
	
</body>
</html>