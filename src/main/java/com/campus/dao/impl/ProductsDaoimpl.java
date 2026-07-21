package com.campus.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.campus.dao.ProductsDao;
import com.campus.dto.Products;
import com.campus.utility.Connector;

public class ProductsDaoimpl implements ProductsDao{
	private Connection con;
	
	public ProductsDaoimpl() {
		this.con=Connector.requestConnection();
	}

	@Override
	public void addProduct(Products p) {

		String query="insert into product values(0,?,?,?,?,?,?)";
		try {
			PreparedStatement ps =con.prepareStatement(query);
			ps.setInt(1, p.getCategoryId());
			ps.setString(2, p.getName());
			ps.setString(3, p.getDescription());
			ps.setDouble(4, p.getPrice());
			ps.setString(5, p.getImage());
			ps.setInt(6, p.getProductQuantity());
			ps.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
			System.out.println("failed to add data");
		}
		
		
	}

	@Override
	public void updateProduct(Products p) {

		
		String query="update product set category_id=?, name=?, description=?, price=?, image=?, product_quantity=? where product_id=?";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, p.getCategoryId());
			ps.setString(2, p.getName());
			ps.setString(3, p.getDescription());
			ps.setDouble(4, p.getPrice());
			ps.setString(4, p.getImage());
			ps.setInt(6, p.getProductQuantity());
			ps.setInt(7, p.getProductId());
			ps.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
			System.out.println("failed to update the data");
		}
		
		
	}

	@Override
	public void deleteProduct(int productId) {
		
		String query="delete from product where id=?";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, productId);
			ps.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
			System.out.println("failed to delete the data");
		}
		
	}

	@Override
	public Products getProductById(int productId) {

		String query="select * from product where id=?";
		Products p=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, productId);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				p=new Products();
				p.setProductId(rs.getInt("product_id"));
				p.setCategoryId(rs.getInt("category_id"));
				p.setName(rs.getString("name"));
				p.setDescription(rs.getString("description"));
				p.setPrice(rs.getDouble("price"));
				p.setImage(rs.getString("image"));
				p.setProductQuantity(rs.getInt("product_quantity"));
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
			System.out.println("failed to get the data");
		}
		
		return p;
	}

	@Override
	public List<Products> getAllProducts() {

		String query="select * from product";
		List<Products>list=new ArrayList<Products>();
		Products p=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				p=new Products();
				p.setProductId(rs.getInt("product_id"));
				p.setCategoryId(rs.getInt("category_id"));
				p.setName(rs.getString("name"));
				p.setDescription(rs.getString("description"));
				p.setPrice(rs.getDouble("price"));
				p.setImage(rs.getString("image"));
				p.setProductQuantity(rs.getInt("product_quantity"));
				list.add(p);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
			System.out.println("failed to get the data");
		}
		
		
		
		return list;
	}

	
	

}
