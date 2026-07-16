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

@WebServlet("/ForgotServlet")
public class Forgot extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		UserDao udao= new UserDaoImpl();
		User u=udao.findByMail(req.getParameter("mail"));
		
		if(u!=null) {
			if(req.getParameter("password").equals(req.getParameter("confirm"))) {
				u.setPassword(req.getParameter("password"));
				udao.updateUser(u);
				req.setAttribute("success", "Password updated Successfully");
				req.getRequestDispatcher("userLogin.jsp").forward(req, resp);
			}
			else {
				req.setAttribute("error", "Password Mismatch");
				req.getRequestDispatcher("forgot.jsp").forward(req, resp);
			}
		}
		else {
			req.setAttribute("error", "User not Found");
			req.getRequestDispatcher("forgot.jsp").forward(req, resp);
		}
	}

}
