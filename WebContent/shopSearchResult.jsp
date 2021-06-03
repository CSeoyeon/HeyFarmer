<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.ac.heyfarmer.board.shopboardService" %>
<%@ page import="kr.ac.heyfarmer.board.Message" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import = "java.util.Calendar" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width" initial-scale="1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<title>로컬푸드 판매글 검색 결과</title>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</head>

<!-- 현재 month -->
<%
	Calendar c = Calendar.getInstance();
	int month = c.get(Calendar.MONTH);
%>

<%
	int totalprice = 0;
	int averageprice = 0;
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
	</script>

<%
	String user_id = null;
	if(session.getAttribute("userId") != null){
		user_id = (String)session.getAttribute("userId");
	}
%>
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
	

<body>
		<div class="container">
			
			<div class="form-group center">
					<h1 class = text-center class="display-1">Hey,Farmer</h1>


			<div class="form-group center">
				<div class="col-xs-6 col-xs-offset-3">
					<input class="form-control" type="text" size="20" id="searchBox" onkeyup="">
				</div>
				
				<div style = "text-align:center">
					<button class="btn btn-primary" type="button" onclick="search()">로컬푸드 사러 가기 </button>
					<h1 class="text-center" class="display-1"><%=month%>월가 "  <script>inputWord</script> " 의 로컬 푸드 가격 평균은 " <%=averageprice%> "원 입니다. </h1>
				</div>
				
			</div>
		
			<!-- 검색 결과 표시  -->
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">No.</th>
						<th style="background-color: #eeeeee; text-align: center;">제목 </th>
						<th style="background-color: #eeeeee; text-align: center;">값 </th>
						<th style="background-color: #eeeeee; text-align: center;">작성자 </th>
						<th style="background-color: #eeeeee; text-align: center;">작성날짜</th>
					</tr>
				</thead>	
				
				<tbody id="tableBody">
				<%
								shopboardService service = new shopboardService();
								ArrayList<Message> msgs = service.getMessages();
								for(int i=0; i<msgs.size(); i++)
								{
									Message msg = msgs.get(i);
				%>
					<tr>
						<td><%= msg.getMsg_id() %></td>
						<td><a href="shopView.jsp?msg_id=<%= msg.getMsg_id() %>"><%= msg.getMsg_title() %></a> </td>
						<td>값 불러오기</td>
						<td><%= msg.getUser_id() %></td>
						<td><%= msg.getMsg_date() %></td>
	
					<%
						}
					%>
				</tbody>
			</table>
		</div>
		
	<%
		if(user_id == null){
	%>
				<h6 class = text-right class="display-1">글 작성은 로그인 후에만 가능합니다.</h6>
	<%
		}
		else{
	%>
				<a href="salesmanWrite.jsp" class="btn btn-primary pull-right">글 작성</a>
	<%
		}
	%>

			</div>
	
</body>
</html>