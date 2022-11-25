<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="parking.DB" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	int idnum=(int)session.getAttribute("idnum");
	
	Connection con=DB.DBConnection();
	Statement stmt=con.createStatement();
	String sql="delete from 사용자 where 사용자번호 = "+idnum;
	
	stmt.executeUpdate(sql);
	DB.close(con);
%>
<script>
	alert("정상적으로 회원 탈퇴 되었습니다.");
	location.href="LoginPage.jsp";
</script>
</body>
</html>