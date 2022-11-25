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
<title>회원가입 완료</title>
</head>
<body>
<script>
<%
	request.setCharacterEncoding("UTF-8");
	int usernum=0;
	String name=request.getParameter("name");
	String nickname=request.getParameter("nickname");
	String id=request.getParameter("id");
	String password=request.getParameter("password");
	int phonenumber=Integer.parseInt(request.getParameter("phonenumber"));
	String car=request.getParameter("car");
	String carnumber=request.getParameter("carnumber");
	
	Connection con=DB.DBConnection();
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select 사용자번호 from 사용자 order by 사용자번호 desc limit 1");
	while(rs.next())
	{
		usernum=rs.getInt("사용자번호");
		usernum+=1;
	}
	
	
	String isql="insert into 사용자(사용자번호, 사용자이름, 닉네임, 아이디, 비밀번호, 전화번호, 차종류, 차량번호) values(?, ?, ?, ?, ?, ?, ?, ?)";
	PreparedStatement pstmt=con.prepareStatement(isql);
	
	pstmt.setInt(1, usernum);
	pstmt.setString(2, name);
	pstmt.setString(3, nickname);
	pstmt.setString(4, id);
	pstmt.setString(5, password);
	pstmt.setInt(6, phonenumber);
	pstmt.setString(7, car);
	pstmt.setString(8, carnumber);
	pstmt.executeUpdate();	

	DB.close(pstmt);
	DB.close(stmt);
	DB.close(con);
	System.out.println("작업 완료");
%>
</script>
</body>
</html>