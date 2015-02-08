package com.fof.spring.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fof.spring.dao.ReviewDao;
import com.fof.spring.model.Review;
import com.fof.spring.service.ReviewService;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {

	@Resource(name = "reviewDao")
	ReviewDao reviewDao;
	
	@Override
	public boolean addReview(Review review) {
		
		return reviewDao.addReview(review);
	}

	@Override
	public boolean updateReview(Review review) {
		
		return reviewDao.updateReview(review);
	}

	@Override
	public List<Review> getAllReviews() {
		
		return reviewDao.getAllReviews();
	}

	@Override
	public Review getReviewById(int id) {
		
		return reviewDao.getReviewById(id);
	}

	@Override
	public List<Review> getReviewByTitle(String type) {
		
		return reviewDao.getReviewByTitle(type);
	}

	@Override
	public List<Review> getReviewByOverAllRating(int rating) {
		
		return reviewDao.getReviewByOverAllRating(rating);
	}

}
