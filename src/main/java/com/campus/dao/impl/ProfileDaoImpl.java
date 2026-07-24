package com.campus.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.campus.dao.ProfileDao;
import com.campus.dto.Profile;
import com.campus.utility.Connector;

public class ProfileDaoImpl implements ProfileDao {
	
	private Connection con;
	
	public ProfileDaoImpl() {
		this.con = Connector.requestConnection();
	}

	@Override
	public void addProfile(Profile p) {
		
		String query = "Insert into profile values (0,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, p.getProfileId());
			ps.setInt(2, p.getUserId());
			ps.setString(3, p.getFirstName());
			ps.setString(4, p.getLastName());
			ps.setLong(5, p.getPhNo());
			ps.setString(6, p.getGender());
			ps.setString(7, p.getProfileImage());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Failed to add data");
		}

	}

	@Override
	public void updateProfile(Profile p) {
		
		String query = "update profile set profile_id=?, user_id=?, firstname=?, lastname=?, phno=?, gender=?, profile_image=?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, p.getProfileId());
			ps.setInt(2, p.getUserId());
			ps.setString(3, p.getFirstName());
			ps.setString(4, p.getLastName());
			ps.setLong(5, p.getPhNo());
			ps.setString(6, p.getGender());
			ps.setString(7, p.getProfileImage());
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Failed to update data");
		}
	}

	@Override
	public void deleteProfile(int profileId) {
		
		String query = "delete from profile where category_id=?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, profileId);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Failed to delete the data");
		}

	}

}
