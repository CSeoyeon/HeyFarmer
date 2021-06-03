<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import= "kr.ac.heyfarmer.user.UserService" %>
<%@ page import= "java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	String user_id = request.getParameter("userId");
	String user_pw = request.getParameter("userPw");
	String user_name = request.getParameter("userName");
	String user_gender = request.getParameter("userGender");
	String user_email = request.getParameter("userEmail");
	
	UserService service = new UserService();
	int result = service.join(user_id, user_pw, user_name, user_gender, user_email);
	
	if(result == 0)
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("location.href = 'main.jsp'");
		script.println("</script>");
	}
	else
	{
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 존재하는 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
%>
</body>
</html>
