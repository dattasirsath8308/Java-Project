package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.*;

import com.conn.DBConnect;
import com.dao.StudentDAO;
import com.entity.Student;

/**
 * Servlet implementation class UpdateServlet
 */

@WebServlet("/update")
//@WebServlet("/register")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String  name  = req.getParameter("name");
		String dob = req.getParameter("dob"); 
		String address = req.getParameter("address");
		String qualification = req.getParameter("qualification");
		String email = req.getParameter("email");
//		int id = Integer.parseInt(req.getParameter("id"));
//		int id = Integer.parseInt(req.getParameter("id")); 
		int id =Integer.parseInt(req.getParameter("id"));
		
		
		Student student = new Student(id, name, dob, address, qualification, email);
		System.out.println(student); // Error Occurs Here 
		
		StudentDAO dao = new StudentDAO(DBConnect.getConn());
		
		HttpSession session= req.getSession();
		
		boolean f = dao.updateStudent(student);
		
		if(f) {
			session.setAttribute("succMsg", "Student datails Updated successfully... ");
			resp.sendRedirect("index.jsp");
//			System.out.println("Student details submit successfully... ");
		}else {
			session.setAttribute("ErrorMsg", "Something wrong on server... ");
			resp.sendRedirect("index.jsp");
//			System.out.println("Something went wrong on server  ");
		}
		
	}

}
