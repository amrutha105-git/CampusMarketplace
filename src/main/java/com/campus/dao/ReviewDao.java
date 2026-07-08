package com.campus.dao;

import java.util.List;

import com.campus.dto.Review;

public interface ReviewDao {
	
	void addReview(Review r);
	void updateReview(Review r);
	void deleteReview(Review r);
	Review getByReviewId(Integer id);
	List<Review> getByAllReview();

}
