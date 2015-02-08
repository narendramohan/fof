package com.fof.spring.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.fof.spring.dao.ProductDao;
import com.fof.spring.dao.UserDAO;
import com.fof.spring.model.Product;
import com.fof.spring.service.ProductService;
@Service("productService")
public class ProductServiceImpl implements ProductService {
	
	@Resource(name = "productDao")
	ProductDao productDao;
	@Override
	public List<Product> getAllProduct() {
		
		return productDao.getAllProduct();
	}
	
	@Override
	public boolean addProduct(Product product) {
		return productDao. addProduct(product);
	}

	@Override
	public boolean updateProduct(Product product) {
		return productDao. updateProduct(product);
	}

	@Override
	public Product getProductById(int id) {
		return productDao.getProductById(id);

	}

	@Override
	public List<Product> getProductsByName(String name) {
		return productDao.getProductsByName(name);
	}

	@Override
	public List<Product> getProductsByType(String type) {
		return productDao.getProductsByType(type);
	}

}
