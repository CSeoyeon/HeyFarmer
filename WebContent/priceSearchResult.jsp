<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.util.Calendar" %>
<%@ page import="kr.ac.heyfarmer.data.ReadCsv" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width" initial-scale="1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<title>��깰 ���� �˻� ���</title>
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

<!-- ���� month -->
<%
Calendar c = Calendar.getInstance();
int month = c.get(Calendar.MONTH); 
%>
<%
	List<List<String>> ret = ReadCsv.readcsv();
%>


<%
	int totalprice = 0;
	int totalfarmerprice = 0;
	int totalmartprice = 0;
	int averagefarmerprice = 0;
	int averagemartprice = 0;
	int averageprice = 0;
	int pricedif = 0;
%>
	<script type="text/javascript">
	function search()
	{
		String keyWord = document.getElementById("searchBox").value.trim();
		if(ret.indexOf(keyword) > 0)
		{
			index = ret.indexOf(keyword);
			//Ű���忡 �ش��ϴ� ��깰�� ��հ�
			for(var i = 1; i < 25; i++)
			{
				totalprice += ret[index][i];
				averageprice = totalprice / 24;
			}
			//Ű���忡 �ش��ϴ� ��깰�� ����Ǫ�� ��հ�
			for(var i = 1; i < 13; i++)
			{
				totalfarmerprice += ret[index][i];
				averagefarmerprice = totalfarmerprice / 12;
			}
			//Ű���忡 �ش��ϴ� ��깰�� ��Ʈ ��հ�
			for(var i = 13; i < 25; i++)
			{
				totalmartprice += ret[index][i];
				averagemartprice = totalmartprice / 12;
			}
			//Ű���忡 �ش��ϴ� ��깰�� ����Ǫ��� ��Ʈ ��հ��� ����
			if(averagemartprice > averagefarmerprice)
			{
				pricedif = averagemartprice - averagefarmerprice;
			}
			else
			{
				pricedif = averagefarmerprice - averagemartprice;
			}	
		}
	}
	</script>
	
	<script type="text/javascript">
	
			var request = new XMLHttpRequest();
			
			function search2()
			{
				if(event.keyCode == 13)
			    {
					var keyword = document.getElementById("searchBox").value.trim();
					if(keyword.length > 0)
					{
					request.open("Post", "./SearchServlet?query=" + encodeURIComponent(keyword), true);
					request.onreadystatechange = showResult;
					request.send(null);
					}
				}
			}		
	</script>




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
			
			<div class="form-group center">
			
				<h1 class = text-center class="display-1">Hey,Farmer</h1>
				
				<div class="col-xs-6 col-xs-offset-3">
						<input class="form-control" type="text" size="15" id="searchBox" placeholder ="�ܿ￡�� ������!" onkeyup="search2()">
				</div>
				<div style = "text-align:center">
					<button class="btn btn-primary" type="button" onclick="search()">��깰 ���� �˻��ϱ�</button>			
				</div>
				
				<h2 class="text-center" class="display-1"><%= month %>���� "  <script>inputWord</script> " �� ���� ����� "<%= averageprice %>"�� �Դϴ�. </h2>
				
				
			</div>
			
			<!-- �˻� ��� ǥ��  -->
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
						<td><%= averagefarmerprice %>��</td>
						<td><%= averagemartprice %>��</td>
						<td><%= pricedif %>��</td>
					</tr>
					
				</tbody>
			</table>
			
				<div class = text-center>
					<h4 class="display-3" style ="color: gray;" >�� ������ ���� ���� ��</h4>

					<a href = "winterPrice.jsp">11�� 12�� 1�� 2��</a> <a href = "springPrice.jsp"> 3�� 4�� 5��</a>
					<a href = "summerPrice.jsp"> 6�� 7�� 8��</a><a href = "fallPrice.jsp"> 9�� 10��</a>

				</div>
		
			</div>

</body>
</html>