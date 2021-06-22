<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
	
		String id = request.getParameter("id");
	
		//Coonection code
		Connection con;
		PreparedStatement ps;
		ResultSet rs;

		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost/student", "root", "");
		ps = con.prepareStatement("delete from records where sid=?");
		ps.setString(1, id);
		
		ps.executeUpdate();
	%>

	<script type="text/javascript">
		alert("Record Deleted Successfully!!");
	</script>




</body>
</html>