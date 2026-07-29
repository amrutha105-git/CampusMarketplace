package com.campus.servlets;

import java.io.IOException;
import java.util.List;

import com.campus.dao.OrdersDao;
import com.campus.dao.ProductsDao;
import com.campus.dao.ReviewDao;
import com.campus.dao.impl.OrdersDaoImpl;
import com.campus.dao.impl.ProductsDaoimpl;
import com.campus.dao.impl.ReviewDaoImpl;
import com.campus.dto.Products;
import com.campus.dto.Review;
import com.campus.dto.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ProductDetails")
public class ProductDetails extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req,
            HttpServletResponse resp)
            throws ServletException, IOException {

        int productId = Integer.parseInt(req.getParameter("productId"));

        ProductsDao pdao = new ProductsDaoimpl();
        ReviewDao rdao = new ReviewDaoImpl();
        OrdersDao odao = new OrdersDaoImpl();

        // Product
        Products p = pdao.getProductById(productId);

        // Reviews
        List<Review> reviews = rdao.getReviewsByProductId(productId);

        // Logged-in user
        User user = (User) req.getSession().getAttribute("signin");

        boolean canReview = false;

        if (user != null) {
            canReview = odao.canReview(user.getUser_id(), productId);
        }

        req.setAttribute("product", p);
        req.setAttribute("reviews", reviews);
        req.setAttribute("canReview", canReview);

        req.getRequestDispatcher("productDetails.jsp").forward(req, resp);
    }
}