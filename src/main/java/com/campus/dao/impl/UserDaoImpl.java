package com.campus.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.campus.dao.UserDao;
import com.campus.dto.User;
import com.campus.utility.Connector;

public class UserDaoImpl implements UserDao {
	
	private Connection con;
	
	public UserDaoImpl() {
		this.con=Connector.requestConnection();
	}

	@Override
	public void addUser(User u) {
		String query = "Insert into Users values (0,?,?,?,?,sysdate())";
		
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, u.getName());
			ps.setString(2, u.getMail());
			ps.setString(3, u.getPassword());
			ps.setString(4, u.getRole());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void updateUser(User u) {
		String query = "update users set full_name=?,email=?,password=?,role=? where user_id=?";
		
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, u.getName());
			ps.setString(2, u.getMail());
			ps.setString(3, u.getPassword());
			ps.setString(4, u.getRole());
			ps.setInt(5, u.getUser_id());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public void deleteUser(Integer user_id) {
		String query = "delete from users where user_id=?";
		
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, user_id);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	@Override
	public User getbyUserId(Integer user_id) {
		String query = "select * from users where user_id=?";
		User u = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, user_id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				u = new User();
				u.setUser_id(rs.getInt("user_id"));
				u.setName(rs.getString("full_name"));
				u.setMail(rs.getString("email"));
				u.setPassword(rs.getString("password"));
				u.setRole(rs.getString("role"));
				u.setCreatedAt(rs.getString("created_at"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u;
	}

	@Override
	public List<User> getByAllUser() {
		String query = "Select * from Users";
		List<User> ulist = new ArrayList<User>();
		User u = null;
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				u = new User();
				u.setUser_id(rs.getInt("user_id"));
				u.setName(rs.getString("full_name"));
				u.setMail(rs.getString("email"));
				u.setPassword(rs.getString("password"));
				u.setRole(rs.getString("role"));
				u.setCreatedAt(rs.getString("created_at"));
				ulist.add(u);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ulist;
	}

	@Override
	public User getByMailAndPassword(String mail, String password) {
		 User u=null;
		 String query = "select * from users where email = ? and password = ?";
		    try {
		        PreparedStatement ps = con.prepareStatement(query);
		        ps.setString(1, mail);
		        ps.setString(2, password);
		        ResultSet rs = ps.executeQuery();
		        if (rs.next()) {
		            u = new User();
		            u.setUser_id(rs.getInt("user_id"));
		            u.setName(rs.getString("full_name"));
		            u.setMail(rs.getString("email"));
		            u.setPassword(rs.getString("password"));
		            u.setRole(rs.getString("role"));
		            u.setCreatedAt(rs.getString("created_at"));
		        }

		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return u;
	}

	@Override
	public User findByMail(String mail) {
		 User u = null;
		    String query = "select * from users where email = ?";
		    try {
		        PreparedStatement ps = con.prepareStatement(query);
		        ps.setString(1, mail);
		        ResultSet rs = ps.executeQuery();
		        if (rs.next()) {
		            u = new User();
		            u.setUser_id(rs.getInt("user_id"));
		            u.setName(rs.getString("full_name"));
		            u.setMail(rs.getString("email"));
		            u.setPassword(rs.getString("password"));
		            u.setRole(rs.getString("role"));
		            u.setCreatedAt(rs.getString("created_at"));
		        }

		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return u;
	}

}
