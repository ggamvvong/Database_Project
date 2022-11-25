<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="parking.DB" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	function LoginFailBox() {
		alert("아이디 또는 비밀번호가 틀립니다.");
		window.history.back();
	}
</script>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String id=request.getParameter("id");
	String passwd=request.getParameter("passwd");
	
	Connection con=DB.DBConnection();
	Statement stmt=con.createStatement();
	String lsql="select * from 사용자 where 아이디 = ? and 비밀번호 = ?";
	
	PreparedStatement pstmt=con.prepareStatement(lsql);
	
	pstmt.setString(1, id);
	pstmt.setString(2, passwd);
	ResultSet rs=pstmt.executeQuery();
	
	int idnum=0;
	int parknum=0;
	int count=rs.getRow();
	
	if(rs.next()){
		idnum=rs.getInt("사용자번호");
		parknum=rs.getInt("주차장식별번호_사용자");
	}
	else if(count==0)
	{
		%>
		<script>LoginFailBox();</script>
		<%
	}
	session.setAttribute("idnum", idnum);
	session.setAttribute("parknum", parknum);
	
	DB.close(rs);
	DB.close(pstmt);
	DB.close(con);
	
	%>
<script>
	location.href="UsingUserPage.jsp";
</script>
</body>
</html>