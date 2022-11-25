<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="parking.DB" %>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.ResultSet" %>
<!DOCTYPE html>
<html>
<script type="text/javascript">
	function ErrorBox() {
		alert("이미 선택된 자리입니다.");
		window.history.back();
	}
</script>
<head>
<meta charset="UTF-8">
<title>Start.jsp</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	int idnum=(int)session.getAttribute("idnum");
	int parknum=Integer.parseInt(request.getParameter("주차장번호"));
	int spacenum=Integer.parseInt(request.getParameter("공간번호"));
	int checknum=0;
	int weekcost=Integer.parseInt(request.getParameter("평일요금"));
	
	session.setAttribute("parknum", parknum);
	
	Connection con=DB.DBConnection();
	Statement stmt=con.createStatement();
	Statement stmt2=con.createStatement();
	Statement stmt3=con.createStatement();
	ResultSet rs=stmt.executeQuery("select 사용여부 from 주차공간 where 주차장식별번호_주차공간 = "+parknum+" and 공간번호 = "+spacenum);
	String sql="update 주차공간 set 사용여부 = 1 where 주차장식별번호_주차공간 = "+parknum+" and 공간번호 = "+spacenum;
	String sql2="update 사용자 set 현재사용료 = "+weekcost+", 주차장식별번호_사용자 = "+parknum+", 주차장자리번호_사용자 = "+spacenum+" where 사용자번호 = "+idnum;
	
	while(rs.next())
	{
		checknum=rs.getInt("사용여부");
		if(checknum==1){
			%>
			<script>ErrorBox();</script>
			<% 
		}
		else{
			stmt2.executeUpdate(sql);
			stmt3.executeUpdate(sql2);
		}
	}
	
	DB.close(rs);
	DB.close(con);
	%>
	<script>
		confirm("사용 시작");
		location.href="UsingUserPage.jsp";
	</script>
</body>
</html>