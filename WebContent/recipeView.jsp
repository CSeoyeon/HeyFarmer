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
<title>게시판 작성글 보기</title>
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
	
	<!-- 네이버로 공유하기 (naver api 사용) -->
	<script>
    function share() {
      var url = encodeURI(encodeURIComponent(myform.url.value));
      var title = encodeURI(myform.title.value);
      var shareURL = "https://share.naver.com/web/shareView.nhn?url=" + url + "&title=" + title;
      document.location = shareURL;
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
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
				<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시글</th>
						</tr>
				</thead>
				<tbody>
				<%
					String msg_id = request.getParameter("msg_id");
							
							recipeboardService service = new recipeboardService();
							Message msg = service.getMessage(Integer.parseInt(msg_id));
				%>
					<tr>
						
						<td style="width: 20%; border-right: 1px solid #aaaaaa;">조회수</td>
						<!-- 조회수 (sql과 연동 x ) -->
						<% int click; 
						
					  //세선에 "click"라는 속성이 존재한다면
						if(session.getAttribute("click") != null)
						{
							click = ((Integer)session.getAttribute("click")).intValue();
							
						}
						else
						{
							click = 0;
						}
						
						click ++; 
						
						%>
						
						<td> <%=click %> </td>
					</tr>	
					<%
						//세션에 저장할 이름을 click으로 만들고, 전에 변수로 지정한 click의 값의 속성을 저장
						session.setAttribute("click", new Integer(click));
					%>
					
					<tr>
						<td style="width: 20%; border-right: 1px solid #aaaaaa;">제목</td>
						<td>
							<%= msg.getMsg_title() %>
						</td>
					</tr>
					<tr>
						<td style="width: 20%; border-right: 1px solid #aaaaaa;">글쓴이</td>
						<td>
							<%= msg.getUser_id() %>
						</td>
					</tr>
					<tr>
						<td style="width: 20%; border-right: 1px solid #aaaaaa;">게시 날짜</td>
						<td>
							<%= msg.getMsg_date() %>
						</td>
					</tr>
					<tr>
						<td style="width: 20%; border-right: 1px solid #aaaaaa; min-height: 200px;">레시피</td>
						<td style="text-align: left;">
							<%= msg.getMsg_content() %>
						</td>
					</tr>
					

						
					
				</tbody>
			</table>
			
		
			<a href="recipeSearchResult.jsp" class="btn btn-primary">목록</a>
			
			<%
	
	
					String author_id = msg.getUser_id();
					if((author_id.equals(user_id)) || ("PlanB".equals(user_id)))
					{
			%>
						<a href="recipedeleteAction.jsp?msg_id=<%= msg.getMsg_id() %>" class="btn btn-primary">삭제</a>
						<a href="recipeupdate.jsp?msg_id=<%= msg.getMsg_id() %>" class="btn btn-primary">수정</a>
			<%
					}
				
			%>
			  <input type="button" class="btn btn-primary" value="네이버 블로그/카페에 공유하기" onclick="share()"/>
			
			<br><br>
			
			
			<!-- 공유하려는 URL이 로컬 경로일 경우는 네이버 서버에서 해당 URL을 파싱할 수 없어 공유하기가  안 됨-->
  			<form id="myform">
  
   		    <!-- 공유 할 url, title 입력 -->
   		    <div class="col-xs-8">
   			 URL: <input type="text" id="url"  class="form-control" value=  "http://localhost:8080/HEYFARMER/recipeView.jsp?msg_id= <%= msg.getMsg_id() %> "><br/>
    		 게시글 제목: <input type="text" id="title"  class="form-control" value= <%= msg.getMsg_title() %>><br/>
  			</div>
  			</form>
			
		</div>
	</div>

	

 


  	



 
</body>
</html>