package com.campus.servlets;

import java.io.IOException;
import java.util.List;

import com.campus.dao.ProductsDao;
import com.campus.dao.impl.ProductsDaoimpl;
import com.campus.dto.Products;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/viewProduct")
public class ViewProduct extends HttpServlet{
	@Override
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProductsDao pdao=new ProductsDaoimpl();
	    List<Products> list=pdao.getAllProducts();
	    
	    req.setAttribute("products", list);
        req.getRequestDispatcher("viewProduct.jsp").forward(req, resp);
	}

}
