package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnect;
import com.dao.StudentDAO;

/**
 * Servlet implementation class DeleteServlet
 */
@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		int id = Integer.parseInt(req.getParameter("id"));
		StudentDAO dao = new StudentDAO(DBConnect.getConn());
		boolean f = dao.deleteStudent(id);
		HttpSession session= req.getSession();
		
		if(f) {
			session.setAttribute("succMsg", "Student datails Deleted successfully... ");
			resp.sendRedirect("index.jsp");
//			System.out.println("Student datails submit successfully... ");
		}else {
			session.setAttribute("ErrorMsg", "Something wrong on server... ");
			resp.sendRedirect("index.jsp");
//			System.out.println("Something went wrong on server  ");
		}
		

	
	}

}
