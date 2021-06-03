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
	<title>농산물 가격 검색 결과</title>
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

<!-- 현재 month -->
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
			//키워드에 해당하는 농산물의 평균가
			for(var i = 1; i < 25; i++)
			{
				totalprice += ret[index][i];
				averageprice = totalprice / 24;
			}
			//키워드에 해당하는 농산물의 로컬푸드 평균가
			for(var i = 1; i < 13; i++)
			{
				totalfarmerprice += ret[index][i];
				averagefarmerprice = totalfarmerprice / 12;
			}
			//키워드에 해당하는 농산물의 마트 평균가
			for(var i = 13; i < 25; i++)
			{
				totalmartprice += ret[index][i];
				averagemartprice = totalmartprice / 12;
			}
			//키워드에 해당하는 농산물의 로컬푸드와 마트 평균가의 차이
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




	<!-- 상위 메뉴  -->
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
				<li><a href="priceSearchResult.jsp">농산물 가격 검색 </a></li>
				<li><a href="shopSearchResult.jsp">로컬 푸드 샵</a></li>
				<li><a href ="recipeSearchResult.jsp">나만의 레시피</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" 
					   data-toggle="dropdown">
						<span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="main.jsp">메인 페이지</a></li>
						<li><a href="shopSearchResult.jsp">농산물 구매</a></li>
						<li><a href="priceSearchResult.jsp">농산물 가격 찾기</a></li>
							<ul>
								<li><a href="springPrice.jsp">봄</a></li>
								<li><a href="summerPrice.jsp">여름</a></li>
								<li><a href="fallPrice.jsp">가을</a></li>
								<li><a href="winterPrice.jsp">겨울</a></li>
							</ul>
						<li><a href="recipeSearchResult.jsp">나만의 레시피</a></li>
						<li><a href="foodNews.jsp">푸드뉴스</a></li>
						<li><a href="QnA.jsp">고객센터</a></li>
							<ul>
								<li><a href="notice.jsp">공지사항</a></li>
								<li><a href="QnA.jsp">QnA</a></li>
							</ul>
						<%
						if(user_id != null){
						%>
						<li><a href="logoutAction.jsp">로그아웃 </a></li>
						<% 
						} else{
						%>
						<li><a href="login.jsp">로그인 </a></li>
						<li><a href="join.jsp">회원가입 </a></li>
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
						<input class="form-control" type="text" size="15" id="searchBox" placeholder ="겨울에는 딸기지!" onkeyup="search2()">
				</div>
				<div style = "text-align:center">
					<button class="btn btn-primary" type="button" onclick="search()">농산물 가격 검색하기</button>			
				</div>
				
				<h2 class="text-center" class="display-1"><%= month %>월의 "  <script>inputWord</script> " 의 가격 평균은 "<%= averageprice %>"원 입니다. </h2>
				
				
			</div>
			
			<!-- 검색 결과 표시  -->
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #aaaaaa; text-align: center; color: white;">로컬푸드 평균가</th>
						<th style="background-color: #aaaaaa; text-align: center; color: white;">마트 평균가 </th>
						<th style="background-color: #aaaaaa; text-align: center; color: white;">로컬푸드와 마트 평균가 가격 차이 </th>
					</tr>
				</thead>	
				
				<tbody id="tableBody">
					<tr>
						<td><%= averagefarmerprice %>원</td>
						<td><%= averagemartprice %>원</td>
						<td><%= pricedif %>원</td>
					</tr>
					
				</tbody>
			</table>
			
				<div class = text-center>
					<h4 class="display-3" style ="color: gray;" >↓ 계절별 가격 보기 ↓</h4>

					<a href = "winterPrice.jsp">11월 12월 1월 2월</a> <a href = "springPrice.jsp"> 3월 4월 5월</a>
					<a href = "summerPrice.jsp"> 6월 7월 8월</a><a href = "fallPrice.jsp"> 9월 10월</a>

				</div>
		
			</div>

</body>
</html>