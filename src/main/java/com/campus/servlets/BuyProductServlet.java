package com.campus.servlets;

import java.io.IOException;

import com.campus.dao.ProductsDao;
import com.campus.dao.impl.ProductsDaoimpl;
import com.campus.dto.Products;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/BuyProduct")
public class BuyProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        int productId = Integer.parseInt(req.getParameter("id"));
        ProductsDao dao = new ProductsDaoimpl();
        Products p = dao.getProductById(productId);
        req.setAttribute("product", p);
        req.getRequestDispatcher("checkout.jsp")
               .forward(req, resp);

    }

}
