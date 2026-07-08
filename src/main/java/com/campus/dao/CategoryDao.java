package com.campus.dao;

import java.util.List;

import com.campus.dto.Category;

public interface CategoryDao {
	void addCategory(Category c);
	void updateCategory(Category c);
	void deleteCategory(Category c);
	Category getByCategoryId(Integer id);
	List<Category> getByAllCategory();

}
