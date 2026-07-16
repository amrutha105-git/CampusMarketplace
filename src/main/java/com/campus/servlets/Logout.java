package com.campus.servlets;

import java.io.IOException;

import com.campus.dto.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/LogoutServlet")
public class Logout extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session=req.getSession();
		User u=(User)session.getAttribute("signin");
		if(u!= null) {
			session.invalidate();
			resp.sendRedirect("userLogin.jsp");
			
		}
		else {
			req.setAttribute("loginError", "Session expired!");
			req.getRequestDispatcher("userLogin.jsp").forward(req, resp);
		}
	}

}
