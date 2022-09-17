<%@page import="com.entity.Student" %>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.StudentDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Student Page</title>
<%@include file="allcss.jsp"%>
</head>
<body class="bg-light">
	<%@include file="navbar.jsp"%>

	<div class="container p-4">
		<div class="row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<p class="fs-3 text-center">Edit Student</p>

						<%
						int id = Integer.parseInt(request.getParameter("id"));
						StudentDAO dao = new StudentDAO(DBConnect.getConn());
						Student s = dao.getStudentById(id);
						%>


						<form action="update" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label> <input type="text"
									value="<%=s.getFullname()%>" name="name" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Date of Birth</label> <input
									value="<%=s.getDob() %>"  name="dob" type="date"
									class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Address</label> <input type="text"
									value="<%=s.getAddress() %>" name="address" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Qualification</label> <input
								  value="<%=s.getQualification() %>" 	name="qualification" type="text" class="form-control">
							</div>

							<div class="mb-3">
								<label class="form-label">Email</label> <input type="email"
									value="<%=s.getEmail() %>"  name="email" class="form-control">
			 				</div>

							<input type="hidden" name="id"  value="<%=s.getId()%>">
					
							<button type="submit"  class="btn btn-primary col-md-12">Update</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>