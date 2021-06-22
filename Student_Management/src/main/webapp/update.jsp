<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="Assets/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="Assets/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
</head>
<body>
<%
	if (request.getParameter("submit") != null) {
		String id=request.getParameter("id");
		String name = request.getParameter("sname");
		String course = request.getParameter("course");
		String fees = request.getParameter("fees");

		//Coonection code
		Connection con;
		PreparedStatement ps;
		ResultSet rs;

		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost/student", "root", "");
		ps = con.prepareStatement("update records set sname=?,course=?,fees=? where sid=?");
		ps.setString(1, name);
		ps.setString(2, course);
		ps.setString(3, fees);
		ps.setString(4, id);
		ps.executeUpdate();
	%>

	<script type="text/javascript">
		alert("Record Updated Successfully!!");
	</script>



	<%
	}
	%>

	<h3 class="mt-2">STUDENT UPDATE</h3>



	<div class="row mt-2">
		<div class="col-sm-4">

			<div class="card p-4">
				<form method="post" action="#">


					<%
					//Coonection code
					Connection con;
					PreparedStatement ps;
					ResultSet rs;

					Class.forName("com.mysql.jdbc.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost/student", "root", "");
					
					String id=request.getParameter("id");
					ps=con.prepareStatement("select * from records where sid=?");
					ps.setString(1,id);
					rs=ps.executeQuery();
					
					while(rs.next())
					{
						%>
					
					
					

					

					<div align="left">
						<label class="form-label">Student Name:</label> <input type="text"
							class="form-control" placeholder="Enter Student Name..."
							name="sname" value="<%= rs.getString("sname") %>" required />
					</div>
					<br>


					<div align="left">
						<label class="form-label">Course:</label> <input type="text"
							class="form-control" placeholder="Enter Course..." value="<%= rs.getString("course") %>" name="course"
							required />
					</div>
					<br>


					<div align="left">
						<label class="form-label">Fees:</label> <input type="text"
							class="form-control" placeholder="Enter fees..." value="<%= rs.getString("fees") %>" name="fees"
							required />
					</div>
					<br>

                       <%
                       
					}
                       %>

					<div align="left">
						<input type="submit" name="submit" id="submit" value="UPDATE"
							class="btn btn-info" /> 

					</div>
					
					
					<div align="right">
					<a href="index.jsp">Click to Back</a>
					
					</div>
				</form>

			</div>

		</div>

	</div>

</body>
</html>