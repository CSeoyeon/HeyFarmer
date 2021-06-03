<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.ac.heyfarmer.data.ReadCsv" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width" initial-scale="1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<title>�ܿ� ����</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>

<%
	int winterfarmerprice = 0;
	int wintermartprice  = 0;
	int pricedif = 0;
%>
	<script type="text/javascript">
		function search()
		{
			String keyword = document.getElementById("searchBox").value.trim();
			if(ret.indexOf(keyword) > 0)
			{
				var index = ret.indexOf(keyword);
				// Ű���忡 �ش��ϴ� ��깰�� �ܿ� ���� 
				winterfarmerprice = (ret[index][11] + ret[index][12] + ret[index][1] + ret[index][2]) / 4;
				wintermartprice = (ret[index][23] + ret[index][24] + ret[index][13] + ret[index][14]) / 4;
				if(wintermartprice > winterfarmerprice)
				{
					pricedif = wintermartprice - winterfarmerprice;
				}
				else
				{
					pricedif = winterfarmerprice - wintermartprice;
				}	
			}
		}
	</script>
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
	<div class="form-group center">
			
				<h1 class = text-center class="display-1">Hey,Farmer</h1>
				
				<div class="col-xs-6 col-xs-offset-3">
						<input class="form-control" type="text" size="15" id="searchBox" placeholder ="�ܿ�" onkeyup="">
				</div>
				<div style = "text-align:center">
					<button class="btn btn-primary" type="button" onclick="search()">��깰 ���� �˻��ϱ� </button>			
				</div>
				<br>
			</div>
			
	<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #aaaaaa; text-align: center; color: white;">����Ǫ�� ��հ�</th>
						<th style="background-color: #aaaaaa; text-align: center; color: white;">��Ʈ ��հ� </th>
						<th style="background-color: #aaaaaa; text-align: center; color: white;">����Ǫ��� ��Ʈ ��հ� ���� ���� </th>
					</tr>
				</thead>	
				
				<tbody id="tableBody">
					<tr>
						<td>1kg:<%= winterfarmerprice %>��</td>
						<td>1kg:<%= wintermartprice %>��</td>
						<td>1kg:<%= pricedif %>��</td>
					</tr>
				</tbody>
			</table>
</body>
</html>