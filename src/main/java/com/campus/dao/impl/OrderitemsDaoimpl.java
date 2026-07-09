package com.campus.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import com.campus.dao.OrderitemsDao;
import com.campus.dto.Orderitems;
import com.campus.utility.Connector;

public class OrderitemsDaoimpl implements OrderitemsDao {
	private Connection con;
	
	public OrderitemsDaoimpl() {
		this.con=Connector.requestConnection();
	}

	@Override
	public void addOrderItem(Orderitems o) {

		String query="insert into order_item values(?,?,?,?)";
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
//		order_item_id int AI PK 
//		order_id int 
//		product_id int 
//		order_quantity int 
//		unit_price decimal(10,2)
		String query="update order_item set order_id=?,set product_id=?,set order_quantity=?,set unit_price=? where order_item_id=? ";
		

	}

	@Override
	public void deleteOrderItem(int orderItemId) {
		// TODO Auto-generated method stub

	}

	@Override
	public Orderitems getOrderItemById(int orderItemId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Orderitems> getAllOrderItems() {
		// TODO Auto-generated method stub
		return null;
	}

}
