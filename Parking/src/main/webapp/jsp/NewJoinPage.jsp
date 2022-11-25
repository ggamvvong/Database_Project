<%@ page language="java" contentType="text/html; charset=UTF-8"
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
	
	<title>NewJoinPage_회원가입</title>
	<script type="text/javascript">
	var xmlhttp = false;
	if(window.XMLHttpRequest){
	    xmlhttp = new XMLHttpRequest();
	}
	function sign_up_chk() {
		var sign_up_name = document.getElementById("name").value;
		var sign_up_nickname = document.getElementById("nickname").value;
		var sign_up_id = document.getElementById("id").value;
		var sign_up_pw = document.getElementById("password").value;
		var sign_up_pw_chk = document.getElementById("doublepass").value;
		var sign_up_mobile = document.getElementById("phonenumber").value;
		var sign_up_car = document.getElementById("car").value;
		var sign_up_carnumber = document.getElementById("carnumber").value;
		var pattern_chk1 = /[`~!@#$%^&*|\\\'\";:\/?]/gi; //아이디 특수문자 체크
		var pattern_chk2 = /[0-9]/;
		var pattern_chk3 = /[a-zA-Z]/;
		var pattern_chk4 = /[~!@#$%^&*()_+|<>?:{}]/;
		
		if (sign_up_name.length == 0) {
			alert("이름을 입력해 주십시오.");
		}
		else if (sign_up_name.search(/\s/) != -1) {
			alert("이름에 공백은 들어갈 수 없습니다.");
		}
		else if (pattern_chk1.test(sign_up_name)) {
			alert("이름에 특수문자는 들어갈 수 없습니다.");
		}
		
		else if (sign_up_nickname.length == 0) {
			alert("닉네임을 입력해 주십시오.");
		}
		else if (sign_up_nickname.search(/\s/) != -1) {
			alert("닉네임에 공백은 들어갈 수 없습니다.");
		}
		
		else if (sign_up_id.length == 0) {
			alert("아이디를 입력해 주십시오.");
		}
		else if (sign_up_id.search(/\s/) != -1) {
			alert("아이디에 공백은 들어갈 수 없습니다.");
		}
		else if (pattern_chk1.test(sign_up_id)) { 
			alert("아이디에 특수문자는 들어갈 수 없습니다.");
		}
	
		else if (!pattern_chk2.test(sign_up_pw) || !pattern_chk3.test(sign_up_pw) || !pattern_chk4.test(sign_up_pw) || sign_up_pw.length <8) {
			alert("비밀번호는 8자리 이상 문자, 숫자, 특수문자로 구성하여야 합니다.");
		}
	
		else if (sign_up_pw != sign_up_pw_chk) {
			alert("입력하신 비밀번호가 다릅니다.");
		}
	
		else if (sign_up_mobile.length == 0 || pattern_chk1.test(sign_up_mobile) || !pattern_chk2.test(sign_up_mobile) || pattern_chk3.test(sign_up_mobile) || sign_up_mobile.search(/\s/) != -1) {
			alert("잘못된 휴대전화 정보입니다.");
		}
		
		else if (sign_up_car.length == 0) {
			alert("차종류를 입력해 주십시오.");
		}
		else if (sign_up_car.search(/\s/) != -1) {
			alert("공백은 들어갈 수 없습니다.");
		}
		else if (pattern_chk1.test(sign_up_car)) { 
			alert("특수문자는 들어갈 수 없습니다.");
		}
		
		else if (sign_up_carnumber.length == 0) {
			alert("차량번호를 입력해 주십시오.");
		}
		else if (sign_up_carnumber.search(/\s/) != -1) {
			alert("차량번호에 공백은 들어갈 수 없습니다.");
			window.history.back();
		}
		else if (pattern_chk1.test(sign_up_carnumber)) { 
			alert("차량번호에 특수문자는 들어갈 수 없습니다.");
		}
		else{
			var url = 'NewJoin.jsp?';
			var qry="name="+sign_up_name+"&"+"nickname="+sign_up_nickname+"&"+
			"id="+sign_up_id+"&"+"password="+sign_up_pw+"&"+"phonenumber="+sign_up_mobile+"&"+"car="+sign_up_car+
			"&"+"carnumber="+sign_up_carnumber;
			xmlhttp.open("POST", url, true);
			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlhttp.send(qry);
			alert("회원 가입이 완료되었습니다.");
			location.href="LoginPage.jsp";
			}
	}
</script>
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
		<form>
		<input type="hidden" name="ip" value=<%=request.getRemoteAddr() %>/>
		<table width="400" align="center" border="1" font-size="7px;" background-color="#F8C9E5">
			<tr><th colspan="2">회원 가입</th></tr>
			<tr>
				<td width="200" align="center">이름</td>
				<td width="200" align="center"><input type="text" id="name" name="name"/></td>
			</tr>
			<tr>
				<td width="200" align="center">닉네임</td>
				<td width="200" align="center"><input type="text" id="nickname" name="nickname"/></td>
			</tr>
			<tr>
				<td width="200" align="center">아이디</td>
				<td width="200" align="center"><input type="text" id="id" name="id"/></td>
			</tr>
			<tr>
				<td width="200" align="center">비밀번호</td>
				<td width="200" align="center"><input type="password" id="password" name="password"/></td>
			</tr>
			<tr>
				<td width="200" align="center">중복체크</td>
				<td width="200" align="center"><input type="password" id="doublepass" name="doublepass"/></td>
			</tr>
			<tr>
				<td width="200" align="center">전화번호</td>
				<td width="200" align="center"><input type="text" id="phonenumber" name="phonenumber"/></td>
			</tr>
			<tr>
				<td width="200" align="center">차종류</td>
				<td width="200" align="center"><input type="text" id="car" name="car"/></td>
			</tr>
			<tr>
				<td width="200" align="center">차량번호</td>
				<td width="200" align="center"><input type="text" id="carnumber" name="carnumber"/></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" onclick="sign_up_chk()" value="회원가입 하기"/></td>
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