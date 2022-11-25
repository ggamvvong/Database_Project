<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="parking.DB" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="description" content="프로젝트_01">
	<meta name="keywords" content="HTML5, CSS, JavaScript">
	
	<!-- 웹 페이지와 외부 자원간의 관계를 정의, 주로 스타일시트(CSS)파일 링크에 사용됨. -->
	<link rel="stylesheet" type="text/css" href="../css/main.css">
	
	<title>AddInfraPage_부가시설</title>
</head>

<body>
	<div>
		<!-- 헤더영역 시작 -->
		<!-- 사이트의 소개나 네비게이션 등을 표시하는 영역 -->
		<header class="header">
		<br>
			<a href="index.jsp">				
			</a>
			<font color="white">Parking</font>	
		<br><br>
			<!-- 네비게이션 영역 시작 -->
			<!-- 사이트의 네비게이션(메뉴) 항목을 표시 -->
			<nav class="nav">
				<a href="index.jsp">
					<img src="../images/main_parking.png" width="240px"height="70px">
				</a>
				<a href="NewJoinPage.jsp" >Join
					<img src="../images/join.png" width="70px"height="70px">
				</a>
				<a href="LoginPage.jsp" >Login
					<img src="../images/login.png" width="70px"height="70px">
				</a>
				<a href="SearchPage.jsp">ParkSearch
					<img src="../images/search.png" width="70px"height="70px">
				</a>
				<a href="AddInfraPage.jsp">AddInfra
					<img src="../images/addinfra.png" width="70px"height="70px">
				</a>
			</nav>
			<!-- 네비게이션 영역 끝 -->
		</header>
		<!-- 헤더영역 끝 -->
	</div>
	
	<!-- 콘텐츠 및 섹션 영역 시작 -->
	<div class="content_div">
	<% 
	request.setCharacterEncoding("UTF-8");
	int parknum=Integer.parseInt(request.getParameter("주차장번호"));
	String addname=null;
	String adddomain=null;
	
	Connection con=DB.DBConnection();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from 부가시설 where 주차장식별번호_부가시설 = "+parknum);
	%>
	<table width="400" align="center" border="1">
	<tr><th colspan="2">부가시설</th></tr>
	<% 
	while(rs.next())
	{
		addname=rs.getString("부가시설이름");
		adddomain=rs.getString("시설분류");
	%>
		
		<tr>
			<td width="200" align="center">이름</td>
			<td width="200" align="center"><input type="text" name="부가시설이름" value="<%= addname %>"></td>
		</tr>
		<tr>
			<td width="200" align="center">분류</td>
			<td width="200" align="center"><input type="text" name="시설분류" value="<%= adddomain %>"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">--------------------------------</td>
		</tr>
	<% 	
	}
	
	DB.close(rs);
	DB.close(con);
	%>	
	</table>
	</div>
	<!-- 콘텐츠 및 섹션 영역 끝 -->
	
	<!-- 푸터 영역 시작 -->
	<div class="footer">
		<footer>    
	      <div>
	        <p>201701755성주원, 201701802황종환, 201901386이영림</p> 
	      </div>     
	    </footer>  
	</div>
	<!-- 푸터 영역 끝 -->
	
</body>
</html>