package com.campus.dao;

import java.util.List;

import com.campus.dto.Products;

public interface ProductsDAO {
	
	boolean addProduct(Products p);

    boolean updateProduct(Products p);

    boolean deleteProduct(int productId);

    Products getProductById(int productId);

    List<Products> getAllProducts();

}
