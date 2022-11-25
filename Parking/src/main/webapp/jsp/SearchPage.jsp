<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="parking.DB" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
	<script type="text/javascript">
	function OnChange1(t){
		if(t=="경기도"){
			mid=new Array("선택","시흥시","안산시","안양시","부천시");
			vmid=new Array("선택","시흥시","안산시","안양시","부천시");
		}
		else if(t=="충청남도"){
			mid=new Array("선택","천안시","아산시","공주시");
			vmid=new Array("선택","천안시","아산시","공주시");
		}
		
		for(i=0;i<form.middle.length;i++){
			form.middle.options[i]=null;
		}
		
		for(i=0;i<mid.length;i++){
			form.middle.options[i]=new Option(mid[i],vmid[i]);
		}
	}
	
	function OnChange2(m){
		if(m=="천안시"){
			btm=new Array("선택","두정동","신부동","불당동");
			vbtm=new Array("선택","두정동","신부동","불당동");
		}
		else{
			btm=new Array("선택");
			vbtm=new Array("선택");
		}
		
		for(i=0;i<form.bottom.length;i++){
			form.bottom.options[i]=null;
		}
		for(i=0;i<btm.length;i++){
			form.bottom.options[i]=new Option(btm[i],vbtm[i]);
		}
	}
	</script>
	
<head>
	<meta charset="utf-8">
	<meta name="description" content="프로젝트_01">
	<meta name="keywords" content="HTML5, CSS, JavaScript">
	
	<!-- 웹 페이지와 외부 자원간의 관계를 정의, 주로 스타일시트(CSS)파일 링크에 사용됨. -->
	<link rel="stylesheet" type="text/css" href="../css/main.css">
	
	<title>SearchPage_도로명주소</title>
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
		<form name="form" action="<%=request.getContextPath()%>/jsp/SearchListPage.jsp" method="post">
		<input type="hidden" name="ip" value=<%=request.getRemoteAddr() %>/>
		<table width="400" align="center" border="1">
		<tr><th colspan="2">지역 선택</th></tr>
		<label for="top" font-size="10px;" text-align="center" background-color="#F8C9E5">도</label>
		<select id="top" name="top" size="1" onchange="OnChange1(value)" font-size="7px;" text-align="center" background-color="#F8C9E5">
			<option value="" font-size="7px;" text-align="center" background-color="#F8C9E5">선택</option>
			<option value="경기도" font-size="7px;" text-align="center" background-color="#F8C9E5">경기도</option>
			<option value="강원도" font-size="7px;" text-align="center" background-color="#F8C9E5">강원도</option>
			<option value="충청북도" font-size="7px;" text-align="center" background-color="#F8C9E5">충청북도</option>
			<option value="충청남도" font-size="7px;" text-align="center" background-color="#F8C9E5">충청남도</option>
			<option value="전라북도" font-size="7px;" text-align="center" background-color="#F8C9E5">전라북도</option>
			<option value="전라남도" font-size="7px;" text-align="center" background-color="#F8C9E5">전라남도</option>
			<option value="경상북도" font-size="7px;" text-align="center" background-color="#F8C9E5">경상북도</option>
			<option value="경상남도" font-size="7px;" text-align="center" background-color="#F8C9E5">경상남도</option>
			<option value="제주도" font-size="7px;" text-align="center" background-color="#F8C9E5">제주도</option>
		</select><br><br>

		<label for="middle" font-size="10px;" text-align="center" background-color="#F8C9E5">시</label>
		<select id="middle" name="middle" size="1" onchange="OnChange2(value)" font-size="7px;" text-align="center" background-color="#F8C9E5">
		<option value="" font-size="7px;" text-align="center" background-color="#F8C9E5">선택</option>	
		</select><br><br>
		
		<label for="bottom" font-size="10px;" text-align="center" background-color="#F8C9E5">동</label>
		<select id="bottom" name="bottom" size="1">
		<option value=" "font-size="7px;" text-align="center" background-color="#F8C9E5">선택</option>	
		</select>
		
		<tr>
			<td colspan="2" align="center"><input type="submit" value="지역 선택" font-size="7px;" text-align="center" background-color="#F8C9E5"/></td>
		</tr>

		</table>
		</form>
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