package com.campus.servlets;

import java.io.IOException;

import com.campus.dao.OrdersDao;
import com.campus.dao.OrderitemsDao;
import com.campus.dao.impl.OrdersDaoImpl;
import com.campus.dao.impl.OrderitemsDaoimpl;
import com.campus.dto.Orderitems;
import com.campus.dto.Orders;
import com.campus.dto.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/PlaceOrder")
public class PlaceOrderServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();

        User u = (User) session.getAttribute("signin");

        if (u == null) {
            resp.sendRedirect("userLogin.jsp");
            return;
        }

        // Read form data
        int productId = Integer.parseInt(req.getParameter("productId"));
        int quantity = Integer.parseInt(req.getParameter("quantity"));
        double price = Double.parseDouble(req.getParameter("price"));

        // Calculate Amount
        double productAmount = price * quantity;
        double gst = productAmount * 0.18;   // Change to 0.10 if using 10% GST
        double totalAmount = productAmount + gst;

        // Create Order
        Orders order = new Orders();
        order.setUser_id(u.getUser_id());
        order.setTotal_amount(totalAmount);
        order.setGst(gst);
        order.setOrder_status("Pending");

        OrdersDao odao = new OrdersDaoImpl();

        // Insert Order
        int orderId = odao.addOrders(order);

        if (orderId == 0) {

            session.setAttribute("error", "Order placement failed!");

            resp.sendRedirect("viewProduct");
            return;
        }

        // Create Order Item
        Orderitems item = new Orderitems();
        item.setOrderId(orderId);
        item.setProductId(productId);
        item.setOrderProductQuantity(quantity);
        item.setUnitPrice(price);

        OrderitemsDao itemDao = new OrderitemsDaoimpl();
        itemDao.addOrderItem(item);

        // Success Message
        session.setAttribute("success", "Order placed successfully!");

        resp.sendRedirect("viewProduct");
    }
}