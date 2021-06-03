<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.ac.heyfarmer.board.recipeboardService" %>
<%@ page import="kr.ac.heyfarmer.board.Message" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width" initial-scale="1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<title>������ �˻� ���</title>
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
						<li><a href="QnA.jsp">��������</a></li>
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
			
			<div class="form-group center">
					<h1 class = text-center class="display-1">Hey,Farmer</h1>
			<div class="form-group center">
				<div class="col-xs-6 col-xs-offset-3">
					<input class="form-control" type="text" size="20" id="searchBox" onkeyup="">
				</div>
					<button class="btn btn-primary" type="button" onclick="">������ ã��  </button>
			</div>
			
			<!-- �˻� ��� ǥ��  -->
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">No.</th>
						<th style="background-color: #eeeeee; text-align: center;">���� </th>
						<th style="background-color: #eeeeee; text-align: center;">�ۼ��� </th>
						<th style="background-color: #eeeeee; text-align: center;">�ۼ���¥</th>
					</tr>
				</thead>	
				
				<tbody id="tableBody">
				<%
					recipeboardService service = new recipeboardService();
								ArrayList<Message> msgs = service.getMessages();
								for(int i=0; i<msgs.size(); i++)
								{
									Message msg = msgs.get(i);
				%>
					<tr>
						<td><%= msg.getMsg_id() %></td>
						<td><a href="recipeView.jsp?msg_id=<%= msg.getMsg_id() %>"><%= msg.getMsg_title() %></a> </td>
						<td><%= msg.getUser_id() %></td>
						<td><%= msg.getMsg_date() %></td>
					</tr>	
					<%
						}
					%>
					
				</tbody>
				</table>
		</div>
		
	<%
		if(user_id == null){
	%>
				<h6 class = text-right class="display-1">�� �ۼ��� �α��� �Ŀ��� �����մϴ�.</h6>
	<%
		}
		else{
	%>
				<a href="recipeWrite.jsp" class="btn btn-primary pull-right">�� �ۼ�</a>
	<%
		}
	%>

	</div>

</body>
</html>