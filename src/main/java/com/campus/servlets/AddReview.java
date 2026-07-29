package com.campus.servlets;

import java.io.IOException;

import com.campus.dao.ReviewDao;
import com.campus.dao.impl.ReviewDaoImpl;
import com.campus.dto.Review;
import com.campus.dto.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AddReview")
public class AddReview extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        User u = (User) session.getAttribute("signin");

        if (u == null) {
            resp.sendRedirect("userLogin.jsp");
            return;
        }

        int productId = Integer.parseInt(req.getParameter("productId"));

        Review review = new Review();

        review.setUser_id(u.getUser_id());
        review.setProduct_id(productId);
        review.setRating(Integer.parseInt(req.getParameter("rating")));
        review.setComment(req.getParameter("comment"));

        ReviewDao dao = new ReviewDaoImpl();
        dao.addReview(review);

        resp.sendRedirect("ProductDetails?productId=" + productId);
    }
}