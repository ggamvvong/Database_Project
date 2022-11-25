<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="parking.DB" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="description" content="프로젝트_01">
	<meta name="keywords" content="HTML5, CSS, JavaScript">
	
	<!-- 웹 페이지와 외부 자원간의 관계를 정의, 주로 스타일시트(CSS)파일 링크에 사용됨. -->
	<link rel="stylesheet" type="text/css" href="../css/main.css">
	
	<title>SearchListPage_주차장 목록</title>
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
		<br><br>			<!-- 네비게이션 영역 시작 -->
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
	String address="\"";
	address+=request.getParameter("top")+" ";
	address+=request.getParameter("middle")+" ";
	address+=request.getParameter("bottom")+"\"";
	
	int parknum=0;
	String parkaddress=null;
	String parkname=null;
	int weekcost=0;
	int weekendcost=0;
	int parkarea=0;
	
	Connection con=DB.DBConnection();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from 주차장 where 주차장주소 = "+address);
	
	%>
	<table width="400" align="center" border="1">
	<tr><th colspan="2">주차장</th></tr>
	<%
	while(rs.next())
	{
		parknum=rs.getInt("주차장번호");
		session.setAttribute("parknum", parknum);
		parkaddress=rs.getString("주차장주소");
		parkname=rs.getString("주차장이름");
		weekcost=rs.getInt("평일요금");
		weekendcost=rs.getInt("주말요금");
		parkarea=rs.getInt("전체공간");
	%>
	<form action="<%=request.getContextPath()%>/jsp/SearchOnePage.jsp" method="post">
	<tr>
		<td width="200" align="center" font-size="7px;" background-color="#F8C9E5">번호</td>
		<td width="200" align="center"><input type="text" name="주차장번호" readonly value="<%= parknum %>"></td>
	</tr>
	<tr>
		<td width="200" align="center" font-size="7px;" background-color="#F8C9E5">이름</td>
		<td width="200" align="center"><input type="text" name="주차장이름" readonly value="<%= parkname %>"></td>
	</tr>
	<tr>
		<td width="200" align="center" font-size="7px;" background-color="#F8C9E5">주소</td>
		<td width="200" align="center"><input type="text" name="주차장주소" readonly value="<%= parkaddress %>"></td>
	</tr>
	<tr>
		<td width="200" align="center" font-size="7px;" background-color="#F8C9E5">전체공간</td>
		<td width="200" align="center"><input type="text" name="전체공간" readonly value="<%= parkarea %>"></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="보기"/></td>
	</tr>
	</form>
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