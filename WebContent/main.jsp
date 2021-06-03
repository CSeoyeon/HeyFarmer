<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width" initial-scale="1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<title>���� ������</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
</head>
<body>
<%
	String user_id = null;
	if(session.getAttribute("userId") != null){
		user_id = (String)session.getAttribute("userId");
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
	
	
	<!-- ��ư, �˻���, �̹��� ����  -->
	<br>
		<div class="container">
			
	
				<div class="form-group center">
					<h1 class = text-center >Hey,Farmer</h1>
				</div>
				
	
				<br>

				<div style = "text-align:center">
					<a href = "mainhighchart.jsp" target = "_blank" >���� �α��ִ� ��깰 �˾ƺ���</a>
				</div>
		
				<br><br><br>
				
				
				<div class="col-xs-500">
					<a href = "foodNews.jsp" target = "_blank">
						<img src = "file:///C:/Users/82105/eclipse-workspace/HEYFARME/WebContent/image/�����%20Ű����%20����%20���Ⱑ%20�ִ�(����Ʈ��%20����).jpg" class="img-fluid" alt="foodNews" width = "27%" height ="55%" align ="left">
					</a>
					<a href = "recipeSearchResult.jsp" target = "_blank">
						<img src = "file:///C:/Users/82105/eclipse-workspace/HEYFARME/WebContent/image/����%20��%20�����ϴ�%20��%20����%20���ƶ�.jpg"class="img-fluid" alt="recipeFirst" width = "30%" height ="60%" align ="right"> 
					</a>
					<div style = "text-align: center;">
						<a href = "shopSearchResult.jsp" target = "_blank"> 
							<img src = "file:///C:/Users/82105/eclipse-workspace/HEYFARME/WebContent/image/��ξ�%20����%20����%20������..jpg" class="img-fluid" alt="advertisementFirst"  width = "33%" height ="68%" >
						</a>
					</div>
					<br><br>
					<a href = "recipeSearchResult.jsp" target = "_blank">
						<img src = "file:///C:/Users/82105/eclipse-workspace/HEYFARME/WebContent/image/������%20��%20�䵵%20�ٸ���.jpg"class="img-fluid" alt="recipeSecond" width = "46%" height ="42%" align ="left"> 
					</a>
					
					<a href = "shopSearchResult.jsp" target = "_blank">
						<img src = "file:///C:/Users/82105/eclipse-workspace/HEYFARME/WebContent/image/�ɴٹ�%20��ſ�%20�ݸ��ö��.jpg" class="img-fluid" alt="advertisementSecond" width = "46%" height ="42%" align ="right"> 
					</a>
				</div>
				
				
			</div>


</body>
</html>