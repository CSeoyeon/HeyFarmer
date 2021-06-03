<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<meta name="viewport" content="width=device-width" initial-scale="1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<title>메인 페이지</title>
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
	
	
	<!-- 버튼, 검색바, 이미지 삽입  -->
	<br>
		<div class="container">
			
	
				<div class="form-group center">
					<h1 class = text-center >Hey,Farmer</h1>
				</div>
				
	
				<br>

				<div style = "text-align:center">
					<a href = "mainhighchart.jsp" target = "_blank" >지금 인기있는 농산물 알아보기</a>
				</div>
		
				<br><br><br>
				
				
				<div class="col-xs-500">
					<a href = "foodNews.jsp" target = "_blank">
						<img src = "file:///C:/Users/82105/eclipse-workspace/HEYFARME/WebContent/image/사람이%20키우지%20않은%20딸기가%20있다(스마트팜%20딸기).jpg" class="img-fluid" alt="foodNews" width = "27%" height ="55%" align ="left">
					</a>
					<a href = "recipeSearchResult.jsp" target = "_blank">
						<img src = "file:///C:/Users/82105/eclipse-workspace/HEYFARME/WebContent/image/괜한%20거%20따라하다%20죽%20쓰지%20말아라.jpg"class="img-fluid" alt="recipeFirst" width = "30%" height ="60%" align ="right"> 
					</a>
					<div style = "text-align: center;">
						<a href = "shopSearchResult.jsp" target = "_blank"> 
							<img src = "file:///C:/Users/82105/eclipse-workspace/HEYFARME/WebContent/image/흥부야%20가을%20박이%20터졌다..jpg" class="img-fluid" alt="advertisementFirst"  width = "33%" height ="68%" >
						</a>
					</div>
					<br><br>
					<a href = "recipeSearchResult.jsp" target = "_blank">
						<img src = "file:///C:/Users/82105/eclipse-workspace/HEYFARME/WebContent/image/장인은%20흰%20밥도%20다르다.jpg"class="img-fluid" alt="recipeSecond" width = "46%" height ="42%" align ="left"> 
					</a>
					
					<a href = "shopSearchResult.jsp" target = "_blank">
						<img src = "file:///C:/Users/82105/eclipse-workspace/HEYFARME/WebContent/image/꽃다발%20대신에%20콜리플라워.jpg" class="img-fluid" alt="advertisementSecond" width = "46%" height ="42%" align ="right"> 
					</a>
				</div>
				
				
			</div>


</body>
</html>