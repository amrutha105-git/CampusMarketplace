package com.campus.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.campus.dao.ReviewDao;
import com.campus.dto.Review;
import com.campus.utility.Connector;

public class ReviewDaoImpl implements ReviewDao {
	private Connection con;
	
	public ReviewDaoImpl() {
		this.con=Connector.requestConnection();
	}

	@Override
	public void addReview(Review r) {
		String query="insert into reviews values(0,?,?,?,?)";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1,r.getUser_id());
			ps.setInt(2,r.getProduct_id());
			ps.setInt(3, r.getRating());
			ps.setString(4, r.getComment());
			ps.executeUpdate();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		}

	@Override
	public void updateReview(Review r) {
		String query="update reviews set user_id=?, product_id=?,rating=?,comment=? where review_id=?";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1,r.getUser_id());
			ps.setInt(2,r.getProduct_id());
			ps.setInt(3, r.getRating());
			ps.setString(4, r.getComment());
			ps.setInt(5, r.getReview_id());
			ps.executeUpdate();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		}

	@Override
	public void deleteReview(Integer review_id) {
		String query="delete from reviews where review_id=?";
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, review_id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public Review getByReviewId(Integer review_id) {
		String query="select * from reviews where review_id=?";
		Review r=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ps.setInt(1, review_id);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {

				r=new Review();
				r.setReview_id(rs.getInt("review_id"));
				r.setUser_id(rs.getInt("user_id"));
				r.setProduct_id(rs.getInt("product_id"));
				r.setRating(rs.getInt("rating"));
				r.setComment(rs.getString("comment"));
				r.setCreated_at(rs.getString("created_at"));
			}
			} catch (SQLException r1) {
			r1.printStackTrace();
		}
		return r;
	}

	@Override
	public List<Review> getByAllReview() {
		String query="select * from reviews";
		List<Review> rlist=new ArrayList<Review>();
		Review r=null;
		try {
			PreparedStatement ps=con.prepareStatement(query);
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				r=new Review();
				
				r.setReview_id(rs.getInt("review_id"));
				r.setUser_id(rs.getInt("user_id"));
				r.setProduct_id(rs.getInt("product_id"));
				r.setRating(rs.getInt("rating"));
				r.setComment(rs.getString("comment"));
				r.setCreated_at(rs.getString("created_at"));
				rlist.add(r);
			}
		}catch(SQLException r1) {
			r1.printStackTrace();
		}
		return rlist;
	}
	
	@Override
	public List<Review> getReviewsByProductId(Integer productId) {
	    String query="select * from reviews where product_id=?";
	    List<Review> reviewList = new ArrayList<>();
	    try {
	        PreparedStatement ps = con.prepareStatement(query);
	        ps.setInt(1, productId);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            Review r = new Review();
	            r.setReview_id(rs.getInt("review_id"));
	            r.setUser_id(rs.getInt("user_id"));
	            r.setProduct_id(rs.getInt("product_id"));
	            r.setRating(rs.getInt("rating"));
	            r.setComment(rs.getString("comment"));
	            r.setCreated_at(rs.getString("created_at"));

	            reviewList.add(r);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return reviewList;
	}

}
