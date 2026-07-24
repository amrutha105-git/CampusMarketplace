package com.campus.servlets;

import java.io.IOException;
import java.util.List;

import com.campus.dao.ProductsDao;
import com.campus.dao.ReviewDao;
import com.campus.dao.impl.ProductsDaoimpl;
import com.campus.dao.impl.ReviewDaoImpl;
import com.campus.dto.Products;
import com.campus.dto.Review;

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

        ProductsDao pdao= new ProductsDaoimpl();
        ReviewDao rdao = new ReviewDaoImpl();

        // Get selected product
        Products p = pdao.getProductById(productId);

        // Get reviews of that product
        List<Review> reviews = rdao.getReviewsByProductId(productId);

        req.setAttribute("product", p);
        req.setAttribute("reviews", reviews);

        req.getRequestDispatcher("productDetails.jsp")
               .forward(req, resp);
    }
}