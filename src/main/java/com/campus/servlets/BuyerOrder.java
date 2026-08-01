package com.campus.servlets;

import java.io.IOException;
import java.util.List;

import com.campus.dao.OrdersDao;
import com.campus.dao.impl.OrdersDaoImpl;
import com.campus.dto.BuyerOrders;
import com.campus.dto.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/BuyerOrders")
public class BuyerOrder extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        User user = (User) req.getSession().getAttribute("signin");

        if (user == null) {
            resp.sendRedirect("userLogin.jsp");
            return;
        }

        OrdersDao dao = new OrdersDaoImpl();

        List<BuyerOrders> list = dao.getBuyerOrders(user.getUser_id());

        req.setAttribute("orders",list);

        req.getRequestDispatcher("orders.jsp").forward(req, resp);
    }
}