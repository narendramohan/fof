package com.fof.spring.dao.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fof.spring.dao.ProductDao;
import com.fof.spring.model.Product;

@Service("productDao")
public class ProductDaoImpl implements ProductDao {
	@PersistenceContext(unitName="fofunit")
	private EntityManager entityManager;
	@Transactional
	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getAllProduct() {
		
		return entityManager.createQuery("FROM Product").getResultList();
	}
	@Transactional
	@Override
	public Product getProductById(int id) {
		Query query = entityManager
				.createQuery("FROM Product u WHERE u.productid = :id");
		query.setParameter("productid", id);
		Product product = (Product) query.getSingleResult();
		return product;
	}
	
	@Transactional
	@Override
	public List<Product> getProductsByName(String productName) {
		Session session = entityManager.unwrap(Session.class);
		
		Criteria query = session.createCriteria(Product.class);
		query.add(Restrictions.like("productName", productName, MatchMode.ANYWHERE));
		List<Product> product = (List<Product>) query.list();
		return product;
	}
	@Transactional
	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getProductsByType(String type) {
		Session session = entityManager.unwrap(Session.class);
		Criteria query = session.createCriteria(Product.class);
		query.add(Restrictions.like("type", type, MatchMode.ANYWHERE));
		List<Product> product = (List<Product>) query.list();
		return entityManager.createQuery("FROM Product").getResultList();
	}
	@Transactional
	@Override
	public boolean addProduct(Product product) {
		Product prod = entityManager.merge(product);
		return prod.getProductid()>0;
	}
	@Transactional
	@Override
	public boolean updateProduct(Product product) {
		entityManager.merge(product);
		return true;
	}

}
