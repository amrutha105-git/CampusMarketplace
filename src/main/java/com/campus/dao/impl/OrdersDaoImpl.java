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
import com.campus.dto.SellersOrders;
import com.campus.utility.Connector;

public class OrdersDaoImpl implements OrdersDao {
	private Connection con;
	public OrdersDaoImpl() {
		this.con=Connector.requestConnection();
    }
	
	@Override
	public int addOrders(Orders o){
	    int orderId = 0;
	    String query = "insert into orders(user_id,total_amount,gst,order_status) VALUES(?,?,?,?)";
	    try {
	        PreparedStatement ps = con.prepareStatement(query);

	        ps.setInt(1, o.getUser_id());
	        ps.setDouble(2, o.getTotal_amount());
	        ps.setDouble(3, o.getGst());
	        ps.setString(4, o.getOrder_status());
	        ps.executeUpdate();
	        
	        String query2 = "SELECT MAX(order_id) FROM orders WHERE user_id=?";
	        PreparedStatement ps2 = con.prepareStatement(query2);

	        ps2.setInt(1, o.getUser_id());

	        ResultSet rs = ps2.executeQuery();

	        if(rs.next()) {
	            orderId = rs.getInt(1);
	        }
	    } 
	    catch(SQLException e) {

	        e.printStackTrace();
	    }
	    return orderId;
	}

    @Override
    public void updateOrders(Orders o) {
    String query = "UPDATE orders SET total_amount=?, gst=?, order_status=? WHERE order_id=?";
    try {
    	PreparedStatement ps = con.prepareStatement(query);

        ps.setDouble(1, o.getTotal_amount());
        ps.setDouble(2, o.getGst());
        ps.setString(3, o.getOrder_status());
        ps.setInt(4, o.getOrder_id());
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

        } 
        catch (SQLException e) {
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
                 o.setUser_id(rs.getInt("user_id"));
                 o.setTotal_amount(rs.getDouble("total_amount"));
                 o.setGst(rs.getDouble("gst"));
                 o.setOrder_status(rs.getString("order_status"));
                 o.setOrdered_at(rs.getString("ordered_at"));

         return o;
         }
         }
    	 catch (SQLException e) {
         e.printStackTrace();
    }

    return null;
}

@Override
public List<Orders> getAllOrders() {

    List<Orders> list = new ArrayList<>();

    String query = "SELECT * FROM orders";

    try {

        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery(query);

        while (rs.next()) {

            Orders o = new Orders();

            o.setOrder_id(rs.getInt("order_id"));
            o.setUser_id(rs.getInt("user_id"));
            o.setTotal_amount(rs.getDouble("total_amount"));
            o.setGst(rs.getDouble("gst"));
            o.setOrder_status(rs.getString("order_status"));
            o.setOrdered_at(rs.getString("ordered_at"));

            list.add(o);
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return list;
}

@Override
public List<SellersOrders> getSellerOrders(int sellerId) {

    List<SellersOrders> list = new ArrayList<>();

    String query =
            "SELECT " +
            "o.order_id AS order_id, " +
            "p.product_id AS product_id, " +
            "p.name AS product_name, " +
            "oi.order_quantity AS order_quantity, " +
            "oi.unit_price AS unit_price, " +
            "u.full_name AS buyer_name, " +
            "o.order_status AS order_status, " +
            "o.ordered_at AS ordered_at " +
            "FROM orders o " +
            "INNER JOIN order_item oi ON o.order_id = oi.order_id " +
            "INNER JOIN product p ON oi.product_id = p.product_id " +
            "INNER JOIN users u ON o.user_id = u.user_id " +
            "WHERE p.seller_id = ? " +
            "ORDER BY o.ordered_at DESC";

    try {

        PreparedStatement ps = con.prepareStatement(query);
        ps.setInt(1, sellerId);

        ResultSet rs = ps.executeQuery();

        while (rs.next()) {

            SellersOrders s = new SellersOrders();

            s.setOrderId(rs.getInt("order_id"));
            s.setProductId(rs.getInt("product_id"));
            s.setProductName(rs.getString("product_name"));
            s.setQuantity(rs.getInt("order_quantity"));
            s.setUnitPrice(rs.getDouble("unit_price"));
            s.setBuyerName(rs.getString("buyer_name"));
            s.setOrderStatus(rs.getString("order_status"));
            s.setOrderedAt(rs.getString("ordered_at"));

            list.add(s);
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }

    return list;
}


@Override
public void updateOrderStatus(int orderId, String status) {

    String query = "UPDATE orders SET order_status=? WHERE order_id=?";

    try {

        PreparedStatement ps = con.prepareStatement(query);

        ps.setString(1, status);
        ps.setInt(2, orderId);

        int result = ps.executeUpdate();

        if(result > 0) {
            System.out.println("Order Status Updated Successfully");
        } else {
            System.out.println("Order Not Found");
        }

    } catch (SQLException e) {
        e.printStackTrace();
    }
}



}