package com.campus.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
	public void addProfile(Profile pr) {

		String query = "INSERT INTO profile (profile_id,user_id,firstname,lastname,phno,gender,profile_image) VALUES (0,?,?,?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setInt(1, pr.getUserId());
			ps.setString(2, pr.getFirstName());
			ps.setString(3, pr.getLastName());
			ps.setLong(4, pr.getPhNo());
			ps.setString(5, pr.getGender());
			ps.setString(6, pr.getProfileImage());
			int rows = ps.executeUpdate();
			System.out.println("Profile Inserted = " + rows);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Failed to add data");
		}

	}

	@Override
	public void updateProfile(Profile pr) {

		String query = "update profile set firstname=?, lastname=?, phno=?, gender=? where user_id=?";
		try {
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, pr.getFirstName());
			ps.setString(2, pr.getLastName());
			ps.setLong(3, pr.getPhNo());
			ps.setString(4, pr.getGender());
			ps.setInt(5, pr.getUserId());
		    ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Failed to update data");
		}
	}

	@Override
	public void deleteProfile(int profileId) {

		String query = "delete from profile where profile_id=?";
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

	@Override
	public Profile getProfileByUserId(int userId) {

	    String query = "SELECT * FROM profile WHERE user_id=?";
	    try {
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setInt(1, userId);
	        ResultSet rs = ps.executeQuery();
	        if (rs.next()) {
	            Profile p = new Profile();
	            p.setProfileId(rs.getInt("profile_id"));
	            p.setUserId(rs.getInt("user_id"));
	            p.setFirstName(rs.getString("firstname"));
	            p.setLastName(rs.getString("lastname"));
	            p.setPhNo(rs.getLong("phno"));
	            p.setGender(rs.getString("gender"));
	            p.setProfileImage(rs.getString("profile_image"));
	            return p;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return null;
	}

}
