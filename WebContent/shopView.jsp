<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="kr.ac.heyfarmer.board.shopboardService" %>
<%@ page import="kr.ac.heyfarmer.board.Message" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>�Ǹ��� �ۼ� �Խñ�</title>
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

<!-- ���̹��� �����ϱ� (naver api ���) -->
	<script>
    function share() {
      var url = encodeURI(encodeURIComponent(myform.url.value));
      var title = encodeURI(myform.title.value);
      var shareURL = "https://share.naver.com/web/shareView.nhn?url=" + url + "&title=" + title;
      document.location = shareURL;
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
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd;">
				<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">�Ǹű�</th>
						</tr>
				</thead>
				<tbody>
				<tr>
						
						<td style="width: 20%; border-right: 1px solid #aaaaaa;">��ȸ��</td>
						<!-- ��ȸ�� (sql�� ���� x ) -->
						<% int click; 
						
					  //������ "click"��� �Ӽ��� �����Ѵٸ�
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
					String msg_id = request.getParameter("msg_id");
							
							shopboardService service = new shopboardService();
							Message msg = service.getMessage(Integer.parseInt(msg_id));
				%>
					<tr>
						<td style="width: 20%; border-right: 1px solid #aaaaaa;">����</td>
						<td>
							<%= msg.getMsg_title() %>
						</td>
					</tr>
					<tr>
						<td style="width: 20%; border-right: 1px solid #aaaaaa;">�۾���</td>
						<td>
							<%= msg.getUser_id() %>
						</td>
					</tr>
					<tr>
						<td style="width: 20%; border-right: 1px solid #aaaaaa;">�Խ� ��¥</td>
						<td>
							<%= msg.getMsg_date() %>
						</td>
					</tr>
					<tr>
						<td style="width: 20%; border-right: 1px solid #aaaaaa; min-height: 200px;">��ǰ ����</td>
						<td style="text-align: left;">
							<%= msg.getMsg_content() %>
						</td>
					</tr>
				</tbody>
			</table>
			
			 <input type="button" class="btn btn-primary" value="���̹� ��α�/ī�信 �����ϱ�" onclick="share()"/>
			
			<a href="recipeSearchResult.jsp" class="btn btn-primary">���</a>
			
			<%
			
			String author_id = msg.getUser_id();
			if((author_id.equals(user_id)) || ("PlanB".equals(user_id)))
			{
			%>
						<a href="shopdeleteAction.jsp?msg_id=<%= msg.getMsg_id() %>" class="btn btn-primary">����</a>
						<a href="shopupdate.jsp?msg_id=<%= msg.getMsg_id() %>" class="btn btn-primary">����</a>
			<%
					}
				
			%>
			
			
			 
			<br><br>
			<!-- �����Ϸ��� URL�� ���� ����� ���� ���̹� �������� �ش� URL�� �Ľ��� �� ���� �����ϱⰡ  �� ��-->
  			<form id="myform">
  
   		    <!-- ���� �� url, title �Է� -->
   		    <div class="col-xs-8">
   			 URL: <input type="text" id="url"  class="form-control" value=  "http://localhost:8080/HEYFARMER/recipeView.jsp?msg_id= <%= msg.getMsg_id() %> "><br/>
    		 �Խñ� ����: <input type="text" id="title"  class="form-control" value= <%= msg.getMsg_title() %>><br/>
  			</div>
  			</form>
  			
			
		</div>
	</div>
</body>
</html>