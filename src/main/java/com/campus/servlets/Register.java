package com.campus.servlets;

import java.io.IOException;

import com.campus.dao.UserDao;
import com.campus.dao.impl.UserDaoImpl;
import com.campus.dto.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/RegisterServlet")
public class Register extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		UserDao udao=new UserDaoImpl();
		User u=new User();
		
		u.setName(req.getParameter("name"));
		u.setMail(req.getParameter("email"));
		u.setPassword(req.getParameter("password"));
		u.setRole(req.getParameter("role"));
		
		udao.addUser(u);
		req.setAttribute("success", "Account created");
	    req.getRequestDispatcher("userRegister.jsp").forward(req, resp);
		
	}

}
