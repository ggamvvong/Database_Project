package parking;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DB {

	public static Connection DBConnection() {
		Connection con=null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url="jdbc:mysql://localhost:3306/parking";
			String user="root";
			String passwd="asd159375*";
			con=DriverManager.getConnection(url,user,passwd);
		} catch(java.lang.ClassNotFoundException e) {
			System.err.print("ClassNotFoundException: ");
			System.err.println(e.getMessage());
		} catch(SQLException e) {
			System.err.println("SQLException: "+e.getMessage());
		}
		
		return con;
	}
	
	public static void close(Connection con) {
		try {if(con!=null) {con.close();}}catch(Exception e) {e.printStackTrace();}
	}
	public static void close(Statement stmt) {
		try {if(stmt!=null) {stmt.close();}}catch(Exception e) {e.printStackTrace();}
	}
	public static void close(PreparedStatement pstmt) {
		try {if(pstmt!=null) {pstmt.close();}}catch(Exception e) {e.printStackTrace();}
	}
	public static void close(ResultSet rs) {
		try {if(rs!=null) {rs.close();}}catch(Exception e) {e.printStackTrace();}
	}
}
