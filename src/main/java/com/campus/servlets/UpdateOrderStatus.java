package com.campus.servlets;

import java.io.IOException;

import com.campus.dao.OrdersDao;
import com.campus.dao.impl.OrdersDaoImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateOrderStatus")
public class UpdateOrderStatus extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 int orderId = Integer.parseInt(req.getParameter("orderId"));
	        String status = req.getParameter("status");

	        OrdersDao odao = new OrdersDaoImpl();
	        odao.updateOrderStatus(orderId, status);

	        resp.sendRedirect("SellerOrders");
	}

}
