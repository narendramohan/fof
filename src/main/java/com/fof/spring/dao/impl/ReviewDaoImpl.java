package com.fof.spring.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;

import com.fof.spring.dao.ReviewDao;
import com.fof.spring.model.Review;

@Service("reviewDao")
public class ReviewDaoImpl implements ReviewDao {
	@PersistenceContext(unitName = "fofunit")
	private EntityManager entityManager;

	@Override
	public boolean addReview(Review review) {
		review= entityManager.merge(review);
		return review.getReviewId()>0;
	}

	@Override
	public boolean updateReview(Review review) {
		review= entityManager.merge(review);
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Review> getAllReviews() {
		// TODO Auto-generated method stub
		return  (List<Review>)entityManager.createQuery("FROM Review").getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Review getReviewById(int id) {

		Session session = entityManager.unwrap(Session.class);
		Criteria query = session.createCriteria(Review.class);
		query.add(Restrictions.eq("reviewid", id));
		List<Review> list = (List<Review>) query.list();
		if(list==null || list.size()==0)
		return null;
		else return list.get(0);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Review> getReviewByTitle(String title) {
		Session session = entityManager.unwrap(Session.class);
		Criteria query = session.createCriteria(Review.class);
		query.add(Restrictions.like("title", title, MatchMode.ANYWHERE));
		List<Review> list = (List<Review>) query.list();
		return list;
	}
	/*@Override
	public List<Review> getReviewByProdcuct(String title) {
		Session session = entityManager.unwrap(Session.class);
		Criteria query = session.createCriteria(Review.class);
		query.add(Restrictions.like("title", title, MatchMode.ANYWHERE));
		List<Review> list = (List<Review>) query.list();
		return list;
	}*/

	@SuppressWarnings("unchecked")
	@Override
	public List<Review> getReviewByOverAllRating(int rating) {
		Session session = entityManager.unwrap(Session.class);
		Criteria query = session.createCriteria(Review.class);
		query.add(Restrictions.ge("overallrating", rating));//("title", rating, MatchMode.ANYWHERE));
		List<Review> list = (List<Review>) query.list();
		return list;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Review> getReviewByFriend(String friendName) {
		Session session = entityManager.unwrap(Session.class);
		Criteria query = session.createCriteria(Review.class);
		query.add(Restrictions.ge("reviewsByperson", friendName));//("title", rating, MatchMode.ANYWHERE));
		List<Review> list = (List<Review>) query.list();
		return list;
	}

}
