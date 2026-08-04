package com.campus.servlets;

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.campus.dao.ProfileDao;
import com.campus.dao.impl.ProfileDaoImpl;
import com.campus.dto.Profile;
import com.campus.dto.User;
import com.campus.utility.Connector;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@WebServlet("/saveprofile")
@MultipartConfig
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

        // Default image path
//        String image = "images/default.png";
        Part filePart = req.getPart("profileImage");

        String fileName = filePart.getSubmittedFileName();

        String uploadPath = getServletContext().getRealPath("") + "images";

        File uploadDir = new File(uploadPath);

        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }

        if (fileName != null && !fileName.isEmpty()) {
            filePart.write(uploadPath + File.separator + fileName);
        }

        String image = "images/" + fileName;

        Profile profile = new Profile();
        profile.setUserId(user.getUser_id());
        profile.setFirstName(firstName);
        profile.setLastName(lastName);
        profile.setPhNo(phNo);
        profile.setGender(gender);
        profile.setProfileImage(image);

        ProfileDao dao = new ProfileDaoImpl();
        System.out.println("Logged In User ID = " + user.getUser_id());
        System.out.println("First Name = " + firstName);
        System.out.println("Last Name = " + lastName);
        System.out.println("Phone = " + phNo);
        System.out.println("Gender = " + gender);
        
        Profile existing = dao.getProfileByUserId(user.getUser_id());
        if (existing == null) {
            dao.addProfile(profile);
        } else {
            dao.updateProfile(profile);
        }

        resp.sendRedirect("viewprofile");

    }
}