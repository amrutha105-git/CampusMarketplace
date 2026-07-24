package com.campus.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.campus.dao.OrderitemsDao;
import com.campus.dto.Orderitems;
import com.campus.utility.Connector;

public class OrderitemsDaoImpl implements OrderitemsDao {
	private Connection con;
	
	public OrderitemsDaoImpl() {
		this.con=Connector.requestConnection();
	}

	@Override
	public void addOrderItem(Orderitems o) {

		String query="insert into order_item(order_id,product_id,order_quantity,unit_price) VALUES(?,?,?,?)";;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1,o.getOrderId() );
			ps.setInt(2, o.getProductId());
			ps.setInt(3, o.getOrderQuantity());
			ps.setDouble(4, o.getUnitPrice());
			ps.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
			System.out.println("failed to add data to order items");
		}
		

	}

	@Override
	public void updateOrderItem(Orderitems o) {

		String query="update order_item set order_id=?, product_id=?, order_quantity=?, unit_price=? where order_item_id=?";
		 try {
	          PreparedStatement ps = con.prepareStatement(query);
	            ps.setInt(1, o.getOrderId());
	            ps.setInt(2, o.getProductId());
	            ps.setInt(3, o.getOrderQuantity());
	            ps.setDouble(4, o.getUnitPrice());
	            ps.setInt(5, o.getOrderItemId());
	            ps.executeUpdate();
	          } catch (SQLException e) {
	        	  
	            e.printStackTrace();
	            System.out.println("failed to update orderitems");
	        }

	}

	@Override
	public void deleteOrderItem(int orderItemId) {
		
		 String query = "delete from order_item where order_item_id=?";
	        try {
	        	PreparedStatement ps = con.prepareStatement(query);
	            ps.setInt(1, orderItemId);
	            ps.executeUpdate();
	        } catch (SQLException e) {
	            e.printStackTrace();
	            System.out.println("failed to delete ordreitem data");
	        }

	}

	@Override
	public Orderitems getOrderItemById(int orderItemId) {
		Orderitems o=null;
		String query="select * from order_item where order_item_id=?";
        try {
        	PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, orderItemId);
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                o = new Orderitems();
                o.setOrderItemId(rs.getInt("order_item_id"));
                o.setOrderId(rs.getInt("order_id"));
                o.setProductId(rs.getInt("product_id"));
                o.setOrderQuantity(rs.getInt("order_quantity"));
                o.setUnitPrice(rs.getDouble("unit_price"));
                }
            } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("failed to get data");
            
        }
        return o;
	}

	@Override
	public List<Orderitems> getAllOrderItems() {
		List<Orderitems> list = new ArrayList<>();
		Orderitems o=null;
        String query = "select * from order_item";
        try {
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
            	o = new Orderitems();
                o.setOrderItemId(rs.getInt("order_item_id"));
                o.setOrderId(rs.getInt("order_id"));
                o.setProductId(rs.getInt("product_id"));
                o.setOrderQuantity(rs.getInt("order_quantity"));
                o.setUnitPrice(rs.getDouble("unit_price"));
                list.add(o);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("failed to get list");
        }

        return list;
	}

}
