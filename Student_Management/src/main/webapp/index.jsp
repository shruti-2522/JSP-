<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>

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
		String name = request.getParameter("sname");
		String course = request.getParameter("course");
		String fees = request.getParameter("fees");

		//Coonection code
		Connection con;
		PreparedStatement ps;
		ResultSet rs;

		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost/student", "root", "");
		ps = con.prepareStatement("insert into records(sname,course,fees)values(?,?,?)");
		ps.setString(1, name);
		ps.setString(2, course);
		ps.setString(3, fees);
		ps.executeUpdate();
	%>

	<script type="text/javascript">
		alert("Record Added Successfully!!");
	</script>



	<%
	}
	%>







	<h3 class="mt-2">STUDENT MANAGEMNT SYSTEM</h3>

	<br>



	<div class="row mt-2">
		<div class="col-sm-4">

			<div class="card p-4">
				<form method="post" action="#">

					<div align="left">
						<label class="form-label">Student Name:</label> <input type="text"
							class="form-control" placeholder="Enter Student Name..."
							name="sname" required />
					</div>
					<br>


					<div align="left">
						<label class="form-label">Course:</label> <input type="text"
							class="form-control" placeholder="Enter Course..." name="course"
							required />
					</div>
					<br>


					<div align="left">
						<label class="form-label">Fees:</label> <input type="text"
							class="form-control" placeholder="Enter fees..." name="fees"
							required />
					</div>
					<br>


					<div align="right">
						<input type="submit" name="submit" id="submit" value="SUBMIT"
							class="btn btn-info" /> <input type="reset" name="btnreset"
							value="RESET" class="btn btn-warning" />

					</div>
			</div>

		</div>
		</form>


		<div class="col-sm-8">


			<div class="panel-body">
				<table class="table table-responsive table-bordered" cellpadding="0"
					width="100%">

					<thead>
						<tr>
							<th>Student Name</th>
							<th>Course</th>
							<th>Fees</th>
							<th>Delete</th>
							<th>Edit</th>
						</tr>
					</thead>

					<tbody>
						<%
						//Coonection code
						Connection con;
						PreparedStatement ps;
						ResultSet rs;

						Class.forName("com.mysql.jdbc.Driver");
						con = DriverManager.getConnection("jdbc:mysql://localhost/student", "root", "");

						String query = "select * from records";
						Statement stmt = con.createStatement();

						rs = stmt.executeQuery(query);

						while (rs.next()) {
							String id = rs.getString("sid");
						%>


						<tr>
							<td><%= rs.getString("sname") %></td>
							<td><%= rs.getString("course") %></td>
							<td><%= rs.getString("fees") %></td>
							<td><a href="delete.jsp?id=<%= id %>" class="btn btn-danger btn-sm">DELETE</a></td>
							<td><a href="update.jsp?id=<%= id %>" class="btn btn-success btn-sm">EDIT</a></td>

						</tr>

					</tbody>

					<%
					}
					%>

				</table>

			</div>




		</div>


	</div>


</body>
</html>