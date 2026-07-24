package com.campus.servlets;

import java.io.IOException;

import com.campus.dao.OrdersDao;
import com.campus.dao.OrderitemsDao;

import com.campus.dao.impl.OrdersDaoImpl;
import com.campus.dao.impl.OrderitemsDaoImpl;

import com.campus.dto.Orders;
import com.campus.dto.Orderitems;
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
        if(u == null) {
            resp.sendRedirect("userLogin.jsp");
            return;

        }
        // Creating Order object

        Orders order = new Orders();
        order.setUser_id(u.getUser_id());
        order.setTotal_amount(Double.parseDouble(req.getParameter("total")));
        order.setGst(Double.parseDouble(req.getParameter("gst")));
        order.setOrder_status("Pending");

        OrdersDao odao = new OrdersDaoImpl();
        // Insert into orders table
        int orderId = odao.addOrders(order);
        if(orderId == 0){
            resp.sendRedirect("orderFailed.jsp");
            return;
        }
        // Creating Order Item
        Orderitems item = new Orderitems();
        item.setOrderId(orderId);
        item.setProductId(Integer.parseInt(req.getParameter("productId")));
        item.setOrderQuantity(Integer.parseInt(req.getParameter("quantity")));
        item.setUnitPrice(Double.parseDouble(req.getParameter("price")));

        OrderitemsDao itemDao = new OrderitemsDaoImpl();
        // Insert into order_item table
        itemDao.addOrderItem(item);
        
        resp.sendRedirect("orderSuccess.jsp");


    }

}