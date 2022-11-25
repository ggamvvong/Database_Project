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
	
	<title>StartParkingPage_주차시작</title>
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
	   String parkname=request.getParameter("주차장이름");
	   String parkaddress=request.getParameter("주차장주소");
	   String parkarea=request.getParameter("전체공간");
	   int weekcost=0;
	   int weekendcost=0;
	   int parkusespace=0;//사용가능한 공간
	   int parkwantspace=0;//사용자가 원하는 공간
	   
	   Connection con=DB.DBConnection();
	   Statement stmt=con.createStatement();
	   Statement stmt2=con.createStatement();
	   Statement stmt3=con.createStatement();
	   Statement stmt4=con.createStatement();
	   ResultSet rs=stmt.executeQuery("select 평일요금, 주말요금 from 주차장 where 주차장이름 = "+"\""+parkname+"\"");
	   ResultSet rs2=stmt2.executeQuery("select count(사용여부) from 주차공간 where 사용여부 = 0 and 주차장식별번호_주차공간 = "+parknum);
	   ResultSet rs3=stmt3.executeQuery("select 공간번호 from 주차공간 s join 주차장 p on (s.주차장식별번호_주차공간 = p.주차장번호) where s.사용여부=0 order by 공간번호 asc limit 1");
	   
	   while(rs.next()){
	      weekcost=rs.getInt("평일요금");
	      weekendcost=rs.getInt("주말요금");
	   }
	   DB.close(rs);
	   while(rs2.next()){
	      parkusespace=rs2.getInt(1);
	   }
	   DB.close(rs2);
	   while(rs3.next()){
	      parkwantspace=rs3.getInt(1);
	   }
	   DB.close(rs3);
	   
	   %>
	   <table width="400" align="center" border="1">
	   <tr><th colspan="2">주차장</th></tr>
	   <tr>
	      <td width="200" align="center">이름</td>
	      <td width="200" align="center"><input type="text" name="주차장이름" value="<%= parkname %>"></td>
	   </tr>
	   <tr>
	      <td width="200" align="center">주소</td>
	      <td width="200" align="center"><input type="text" name="주차장주소" value="<%= parkaddress %>"></td>
	   </tr>
	   <tr>
	      <td width="200" align="center">평일요금</td>
	      <td width="200" align="center"><input type="text" name="평일요금" value="<%= weekcost %>"></td>
	   </tr>
	   <tr>
	      <td width="200" align="center">주말요금</td>
	      <td width="200" align="center"><input type="text" name="주말요금" value="<%= weekendcost %>"></td>
	   </tr>
	   <tr>
	      <td width="200" align="center">전체공간</td>
	      <td width="200" align="center"><input type="text" name="전체공간" value="<%= parkarea %>"></td>
	   </tr>
	   <tr>
	      <td width="200" align="center">사용공간</td>
	      <td width="200" align="center"><input type="text" name="사용공간" value="<%= parkusespace %>"></td>
	   </tr>
	   <tr>
	      <td width="200" align="center">원하는공간번호</td>
	      <td width="200" align="center"><input type="text" name="원하는공간번호" value="<%= parkwantspace %>"></td>
	   </tr>
	   <tr>
	      <td colspan="2" align="center"><input type="submit" value="사용시작"/></td>
	      <%
	      ResultSet rs4=stmt4.executeQuery("update 주차공간 set 사용여부='1' where 공간번호 = "+parkwantspace);
	      %>
	   </tr>
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