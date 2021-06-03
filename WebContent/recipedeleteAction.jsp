<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="kr.ac.heyfarmer.board.recipeboardService" %>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String msg_id = request.getParameter("msg_id");
			
			recipeboardService service = new recipeboardService();
			service.deleteMessage(msg_id);
	%>
	
	<script type="text/javascript">
		location.href = 'recipeSearchResult.jsp'
	</script>
	
</body>
</html>