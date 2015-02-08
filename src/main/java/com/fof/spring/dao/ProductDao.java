package com.fof.spring.dao;

import java.util.List;

import com.fof.spring.model.Product;

public interface ProductDao {
	public boolean addProduct(Product product);
	public boolean updateProduct(Product product);
	public List<Product> getAllProduct();
	public Product getProductById(int id);
	public List<Product> getProductsByName(String name);
	public List<Product> getProductsByType(String type);
}
