package com.campus.servlets;

import java.io.IOException;
import java.util.List;

import com.campus.dao.OrdersDao;
import com.campus.dao.impl.OrdersDaoImpl;
import com.campus.dto.SellersOrders;
import com.campus.dto.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/SellerOrders")
public class SellerOrdersServlet extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();

        User seller = (User) session.getAttribute("signin");

        if (seller == null) {
            resp.sendRedirect("userLogin.jsp");
            return;
        }

        OrdersDao dao = new OrdersDaoImpl();

        List<SellersOrders> orders = dao.getSellerOrders(seller.getUser_id());

        req.setAttribute("orders", orders);

        req.getRequestDispatcher("sellerOrders.jsp").forward(req, resp);
	}




}
