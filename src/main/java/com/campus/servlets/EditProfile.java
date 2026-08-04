package com.campus.servlets;

import java.io.IOException;

import com.campus.dao.ProfileDao;
import com.campus.dao.impl.ProfileDaoImpl;
import com.campus.dto.Profile;
import com.campus.dto.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/editprofile")
public class EditProfile extends HttpServlet {

    @Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("signin");
        
        if (user == null) {
            resp.sendRedirect("userLogin.jsp");
            return;
        }

        ProfileDao dao = new ProfileDaoImpl();
        Profile profile = dao.getProfileByUserId(user.getUser_id());
        req.setAttribute("profile", profile);
        req.getRequestDispatcher("editprofile.jsp").forward(req, resp);
    }
}