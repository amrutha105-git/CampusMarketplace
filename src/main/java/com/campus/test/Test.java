package com.campus.test;

import java.util.List;
import java.util.Scanner;

import com.campus.dao.UserDao;
import com.campus.dao.impl.UserDaoImpl;
import com.campus.dto.User;

public class Test {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		User u = new User();
		UserDao udao = new UserDaoImpl();
		
		//find by object
//		System.out.println("Enter the User name");
//		u.setName(sc.next());
//		System.out.println("Enter the Mail");
//		u.setMail(sc.next());
//		System.out.println("Enter the Password");
//		u.setPassword(sc.next());
//		System.out.println("Enter the Role");
//		u.setRole(sc.next());
//		udao.addUser(u);
//		System.out.println("Data added successfully");
		
		//delete by id
//		System.out.println("Enter the user_id");
//		udao.deleteUser(sc.nextInt());
//		System.out.println("Data deleted successfully");
		
		//find by id
//		System.out.println("Enter the user_id");
//		User u1 = udao.getbyUserId(sc.nextInt());
//		System.out.println(u1);
		
		//find all
//		List<User> lu = udao.getByAllUser();
//		for(User ele : lu) {
//			System.out.println(ele);
//		}
	}

}
