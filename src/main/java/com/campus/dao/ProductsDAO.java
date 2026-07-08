package com.campus.dao;

import java.util.List;

import com.campus.dto.Products;

public interface ProductsDAO {
	
	void addProduct(Products p);

    void updateProduct(Products p);

    void deleteProduct(int productId);

    Products getProductById(int productId);

    List<Products> getAllProducts();

}
