<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>�α���</title>
</head>
<body>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
	<%
		String user_id = (String)session.getAttribute("userId");
		if(user_id != null)
		{
	%>
			<script type="text/javascript">
				location.href = 'main.jsp'
			</script>
	<%
		}
	%>
	
	<!-- ���� �޴�  -->
	<nav class="navbar navbar-default">
		<div class="navbar-brand"> <a href="main.jsp">Hey, Farmer</a></div>
		<div class="navbar-header">
			<button class="navbar-toggle" 
			        data-target="#menu-items"
			        data-toggle="collapse">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		</div>
		
		<div class="collapse navbar-collapse" id="menu-items">
			<ul class="nav navbar-nav">
				<li><a href="priceSearchResult.jsp">��깰 ���� �˻� </a></li>
				<li><a href="shopSearchResult.jsp">���� Ǫ�� ��</a></li>
				<li><a href ="recipeSearchResult.jsp">������ ������</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" 
					   data-toggle="dropdown">
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="main.jsp">���� ������</a></li>
						<li><a href="shopSearchResult.jsp">��깰 ����</a></li>
						<li><a href="priceSearchResult.jsp">��깰 ���� ã��</a></li>
							<ul>
								<li><a href="springPrice.jsp">��</a></li>
								<li><a href="summerPrice.jsp">����</a></li>
								<li><a href="fallPrice.jsp">����</a></li>
								<li><a href="winterPrice.jsp">�ܿ�</a></li>
							</ul>
						<li><a href="recipeSearchResult.jsp">������ ������</a></li>
						<li><a href="foodNews.jsp">Ǫ�崺��</a></li>
						<li><a href="QnA.jsp">������</a></li>
							<ul>
								<li><a href="notice.jsp">��������</a></li>
								<li><a href="QnA.jsp">QnA</a></li>
							</ul>
						<%
						if(user_id != null){
						%>
						<li><a href="logoutAction.jsp">�α׾ƿ� </a></li>
						<% 
						} else{
						%>
						<li><a href="login.jsp">�α��� </a></li>
						<li><a href="join.jsp">ȸ������ </a></li>
						<%
						} 
						%>	
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	
	<div class="container">
		<div class="jumbotron" style="padding-top:20px;">
			<h3 style="text-align: center;">Login</h3>
			<form method="post" action="loginAction.jsp">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="User ID" name="userId" maxlength="20">
				</div>
				<div class="form-group">
					<input type="password" class="form-control" placeholder="Password" name="userPw" maxlength="20">
				</div>
				<input type="submit" class="btn btn-primary form-control" value="Login">
			</form>
		</div>
	</div>
</body>
</html>

