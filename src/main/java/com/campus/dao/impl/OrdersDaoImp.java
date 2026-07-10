package com.campus.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.campus.dao.OrdersDao;
import com.campus.dto.Orders;

public class OrdersDaoImp implements OrdersDao {
private Connection con;
	
@Override
public void addOrders(Orders o) {

    String query = "INSERT INTO orders(total_amount, order_status) VALUES(?, ?)";

    try {
        PreparedStatement ps = con.prepareStatement(query);

        ps.setDouble(1, o.getTotal_amount());
        ps.setString(2, o.getOrder_status());

        int result = ps.executeUpdate();

        if (result > 0) {
            System.out.println("Order Added Successfully");
        } else {
            System.out.println("Failed to Add Order");
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }
}

@Override
public void updateOrders(Orders o) {

    String query = "UPDATE orders SET total_amount=?, order_status=? WHERE order_id=?";

    try {
        PreparedStatement ps = con.prepareStatement(query);

        ps.setDouble(1, o.getTotal_amount());
        ps.setString(2, o.getOrder_status());
        ps.setInt(3, o.getOrder_id());

        int result = ps.executeUpdate();

        if (result > 0) {
            System.out.println("Order Updated Successfully");
        } else {
            System.out.println("Order Not Found");
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }
}

@Override
public void deleteOrders(int orderId) {

    String query = "DELETE FROM orders WHERE order_id=?";

    try {
        PreparedStatement ps = con.prepareStatement(query);

        ps.setInt(1, orderId);

        int result = ps.executeUpdate();

        if (result > 0) {
            System.out.println("Order Deleted Successfully");
        } else {
            System.out.println("Order Not Found");
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }
}

@Override
public Orders getOrdersById(int orderId) {

    String query = "SELECT * FROM orders WHERE order_id=?";

    try {
        PreparedStatement ps = con.prepareStatement(query);

        ps.setInt(1, orderId);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {

            Orders o = new Orders();

            o.setOrder_id(rs.getInt("order_id"));
            o.setTotal_amount(rs.getDouble("total_amount"));
            o.setOrder_status(rs.getString("order_status"));
            o.setOrdered_at(rs.getString("ordered_at"));

            return o;
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return null;
}

@Override
public List<Orders> getAllOrderItems() {

    List<Orders> list = new ArrayList<>();

    String query = "SELECT * FROM orders";

    try {

        Statement st = con.createStatement();

        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {

            Orders o = new Orders();

            o.setOrder_id(rs.getInt("order_id"));
            o.setTotal_amount(rs.getDouble("total_amount"));
            o.setOrder_status(rs.getString("order_status"));
            o.setOrdered_at(rs.getString("ordered_at"));

            list.add(o);
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return list;
}
}