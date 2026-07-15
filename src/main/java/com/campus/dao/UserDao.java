package com.campus.dao;

import java.util.List;

import com.campus.dto.User;

public interface UserDao {

	void addUser(User u);
	void updateUser(User u);
	void deleteUser(Integer user_id);
	User getbyUserId(Integer user_id);
	List<User> getByAllUser();
	User getByMailAndPassword(String mail,String password);
	
}
