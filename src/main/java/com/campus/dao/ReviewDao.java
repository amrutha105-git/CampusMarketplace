package com.campus.dao;

import java.util.List;

import com.campus.dto.Review;

public interface ReviewDao {
	
	void addReview(Review r);
	void updateReview(Review r);
	void deleteReview(Integer review_id);
	Review getByReviewId(Integer review_id);
	List<Review> getByAllReview();

}
