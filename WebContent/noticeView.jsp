<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.ac.heyfarmer.board.noticeboardService" %>
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
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">공지사항</th>
						</tr>
				</thead>
				<tbody>
				<%
					String msg_id = request.getParameter("msg_id");
							
							noticeboardService service = new noticeboardService();
							Message msg = service.getMessage(Integer.parseInt(msg_id));
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
						<td style="width: 20%; border-right: 1px solid #aaaaaa; min-height: 200px;">공지 내용</td>
						<td style="text-align: left;">
							<%= msg.getMsg_content() %>
						</td>
					</tr>
				</tbody>
			</table>
			
			<a href="notice.jsp" class="btn btn-primary">목록</a>
			
			<!-- 관리자만 수정/ 삭제 허용 -->
			<%
	
				if("PlanB".equals(user_id))
				{
			%>
						<a href="noticedeleteAction.jsp?msg_id=<%= msg.getMsg_id() %>" class="btn btn-primary">삭제</a>
						<a href="noticeupdate.jsp?msg_id=<%= msg.getMsg_id() %>" class="btn btn-primary">수정</a>
			<%
				}
			%>
			
		</div>
	</div>
</body>
</html>