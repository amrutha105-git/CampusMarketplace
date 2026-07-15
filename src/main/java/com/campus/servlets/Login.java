package com.campus.servlets;

import java.io.IOException;

import com.campus.dao.UserDao;
import com.campus.dao.impl.UserDaoImpl;
import com.campus.dto.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class Login extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDao udao=new UserDaoImpl();
		User u=udao.getByMailAndPassword(req.getParameter("email"),req.getParameter("password"));
		
		if(u!=null) {
			HttpSession session=req.getSession();
			session.setAttribute("signin", u);
			resp.sendRedirect("home.jsp");
		}
		else {
			req.setAttribute("error", "Invalid credentials");
			req.getRequestDispatcher("userLogin.jsp").forward(req, resp);
		}
		
		
	}
}
