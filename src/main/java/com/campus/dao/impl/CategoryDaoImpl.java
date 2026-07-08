package com.campus.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.campus.dao.CategoryDao;
import com.campus.dto.Category;
import com.campus.utility.Connector;

public class CategoryDaoImpl implements CategoryDao {
	

private Connection con;
	
	public CategoryDaoImpl() {
		this.con=Connector.requestConnection();
	}

	@Override
	public void addCategory(Category c) {
		String query="insert into category values(0,?)";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, c.getCname());
			ps.executeUpdate();
		}catch(SQLException c1) {
			c1.printStackTrace();
		}

	}

	@Override
	public void updateCategory(Category c) {
		String query="update category set  name=?";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setString(1, c.getCname());
			ps.executeUpdate();
		}catch(SQLException c1) {
			c1.printStackTrace();
		}

	}
@Override
	public void deleteCategory(Integer category_id) {
		String query="delete from category where category_id=?";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1,category_id);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public Category getByCategoryId(Integer category_id) {
		String query="select * from category where category_id=?";
		Category c=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, category_id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				c=new Category();
				c.setCategory_id(rs.getInt("cid"));
				c.setCname(rs.getString("cname"));
			}
		}catch(SQLException c1) {
			c1.printStackTrace();
		}
		return c;
	}

	@Override
	public List<Category> getByAllCategory() {
		String query="select * from category";
		List<Category> clist=new ArrayList<Category>();
		Category c=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				c=new Category();
				c.setCategory_id(rs.getInt("cid"));
				c.setCname(rs.getString("cname"));
				clist.add(c);
			}
		}catch(SQLException c1) {
			c1.printStackTrace();
		}
		return clist;
	}

}
