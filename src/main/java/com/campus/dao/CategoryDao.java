package com.campus.dao;

import java.util.List;

import com.campus.dto.Category;

public interface CategoryDao {
	void addCategory(Category c);
	void updateCategory(Category c);
	void deleteCategory(Integer category_id);
	Category getByCategoryId(Integer category_id);
	List<Category> getByAllCategory();

}
