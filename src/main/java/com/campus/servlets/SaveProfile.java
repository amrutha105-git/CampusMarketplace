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

@WebServlet("/saveprofile")
public class SaveProfile extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("signin");
        if (user == null) {
            resp.sendRedirect("userLogin.jsp");
            return;
        }

        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        long phNo = Long.parseLong(req.getParameter("phNo"));
        String gender = req.getParameter("gender");


        Profile profile = new Profile();
        profile.setUserId(user.getUser_id());
        profile.setFirstName(firstName);
        profile.setLastName(lastName);
        profile.setPhNo(phNo);
        profile.setGender(gender);

        System.out.println("New First Name = " + firstName);
        System.out.println("New Last Name = " + lastName);
        System.out.println("New Phone = " + phNo);
        System.out.println("New Gender = " + gender);
        System.out.println("User ID = " + user.getUser_id());

        ProfileDao dao = new ProfileDaoImpl();
        Profile existing = dao.getProfileByUserId(user.getUser_id());
        if (existing == null) {
            dao.addProfile(profile);
        } else {
            dao.updateProfile(profile);
        }

        resp.sendRedirect("viewprofile");

    }
}