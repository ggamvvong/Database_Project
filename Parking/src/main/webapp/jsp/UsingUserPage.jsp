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
	
	<title>UsingUserPage_사용중마이페이지</title>
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
	int idnum=(int)session.getAttribute("idnum");
	int parknum=(int)session.getAttribute("parknum");
	
	String name=null;
	String nickname=null;
	int phonenumber=0;
	String car=null;
	String carnumber=null;
	int cost=0;
	int spacenum=0;
	
	Connection con=DB.DBConnection();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from 사용자 where 사용자번호 = "+idnum);
	
	if(rs.next()){
		name=rs.getString("사용자이름");
		nickname=rs.getString("닉네임");
		phonenumber=rs.getInt("전화번호");
		car=rs.getString("차종류");
		carnumber=rs.getString("차량번호");
		cost=rs.getInt("현재사용료");
		spacenum=rs.getInt("주차장자리번호_사용자");
	}
	
	session.setAttribute("spacenum", spacenum);
	
	if(cost!=0){
	%>
	 
	<table width="400" align="center" border="1">
		<tr><th colspan="2">사용자 정보</th></tr>
		<tr>
			<td width="200" align="center">이름</td>
			<td width="200" align="center"><input type="text" name="사용자이름" value="<%= name %>"></td>
		</tr>
		<tr>
			<td width="200" align="center">닉네임</td>
			<td width="200" align="center"><input type="text" name="닉네임" value="<%= nickname %>"></td>
		</tr>
		<tr>
			<td width="200" align="center">차종류</td>
			<td width="200" align="center"><input type="text" name="차종류" value="<%= car %>"></td>
		</tr>
		<tr>
			<td width="200" align="center">차량번호</td>
			<td width="200" align="center"><input type="text" name="차량번호" value="<%= carnumber %>"></td>
		</tr>
		<tr>
			<td width="200" align="center">현재사용료</td>
			<td width="200" align="center"><input type="text" name="현재사용료" value="<%= cost %>"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">현재 주차장 사용중</td>
		</tr>
		<tr>
			<td colspan="2" align="center"><button onclick="location='EndParkingPage.jsp'">사용 종료</button></td>
		</tr>
	</table>
		<%
		}
		
		else {
		%>
	<form name="form" action="<%=request.getContextPath()%>/jsp/SearchPage.jsp" method="post">	 
	<table width="400" align="center" border="1">
		<tr><th colspan="2">사용자 정보</th></tr>
		<tr>
			<td width="200" align="center">이름</td>
			<td width="200" align="center"><input type="text" name="사용자이름" readonly value="<%= name %>"></td>
		</tr>
		<tr>
			<td width="200" align="center">닉네임</td>
			<td width="200" align="center"><input type="text" name="닉네임" readonly value="<%= nickname %>"></td>
		</tr>
		<tr>
			<td width="200" align="center">차종류</td>
			<td width="200" align="center"><input type="text" name="차종류" readonly value="<%= car %>"></td>
		</tr>
		<tr>
			<td width="200" align="center">차량번호</td>
			<td width="200" align="center"><input type="text" name="차량번호" readonly value="<%= carnumber %>"></td>
		</tr>
		<tr>
			<td width="200" align="center">현재사용료</td>
			<td width="200" align="center"><input type="text" name="현재사용료" readonly value="<%= cost %>"></td>
		</tr>
		<tr>
			<td colspan="2" align="center"><input type="submit" value="주차장 선택"/></td>
		</tr>
	</table>
	</form>
	<table width="400" align="center" border="1"><tr>
			<td colspan="2" align="center"><button onclick="location='WithdrawalPage.jsp'">회원 탈퇴</button></td>
		</tr>
	</table>
	<%
		}
		
		DB.close(rs);
		DB.close(stmt);
	%>
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