package com.fof.spring.service;

import java.util.List;

import com.fof.spring.model.Review;

public interface ReviewService {
	public boolean addReview(Review review);
	public boolean updateReview(Review review);
	public List<Review> getAllReviews();
	public Review getReviewById(int id);
	public List<Review> getReviewByTitle(String title);
	public List<Review> getReviewByOverAllRating(int rating);
}
