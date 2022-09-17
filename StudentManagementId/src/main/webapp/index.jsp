
<%@page import="com.entity.Student" %>
<%@page import="java.util.List"%>
<%@page import="com.dao.StudentDAO"%>
<%@page import="com.conn.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%--  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false"  %>
   
 --%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Management System</title>
<%@include file="allcss.jsp"%>
</head>
<body class="bg-light">

	<%@include file="navbar.jsp"%>
	
	

	<div class="container p-3">
		<div class="card">
			<div class="card-body">

				<p class="text-center fs-1">All Student Details</p>
				<%--
				<c:if test="${not empty succMsg }">
						<p class="text-center text-success">${succMsg} </p>
						<c:remove var="succMsg"/>
					</c:if>
	
					<c:if test="${not empty ErrorMsg }">
						<p class="text-center text-success">${ErrorMsg } </p>
						<c:remove var="ErrorMsg "/>
					</c:if>
				--%>
				
				<table class="table">
					<thead>
						<tr>
							<th scope="col">Id No</th>
							<th scope="col">Full Name</th>
							<th scope="col">DOB</th>
							<th scope="col">Address</th>
							<th scope="col">Qualification</th>
							<th scope="col">Email</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
					
					<% 
						StudentDAO dao = new StudentDAO(DBConnect.getConn());
						List<Student> list = dao.getAllStudent();
						for(Student s:list){
						%>
					
						<tr>
							<th scope="row"><%=s.getId() %></th>
							<td><%=s.getFullname() %></td>
							<td><%=s.getDob() %></td>
							<td><%=s.getAddress() %></td>
							<td><%=s.getQualification() %></td>
							<td><%=s.getEmail() %></td>
							<td><a href="edit_student.jsp?id=<%=s.getId() %>"
								class="btn btn-sm btn-primary">Edit </a> 
								<a href="delete?id=<%=s.getId() %> "
								class="btn btn-sm btn-danger ms-1">Delete </a></td>
						</tr>			 
						 <%
						}
					%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>