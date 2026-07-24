package com.campus.servlets;

import java.io.File;
import java.io.IOException;

import com.campus.dao.ProductsDao;
import com.campus.dao.impl.ProductsDaoimpl;
import com.campus.dto.Products;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/ProductServlet")
@MultipartConfig
public class AddProduct extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        ProductsDao pdao = new ProductsDaoimpl();
        Products p = new Products();

        p.setCategoryId(Integer.parseInt(req.getParameter("category_id")));
        p.setName(req.getParameter("pname"));
        p.setDescription(req.getParameter("description"));
        p.setPrice(Double.parseDouble(req.getParameter("price")));
      

        // Upload image
        Part part = req.getPart("image");
        String fileName = part.getSubmittedFileName();

        // Path to WebContent/images
        String uploadPath = getServletContext().getRealPath("/images");

        File folder = new File(uploadPath);
        if (!folder.exists()) {
            folder.mkdirs();
        }

        // Save image
        part.write(uploadPath + File.separator + fileName);

        // Save filename in database
        p.setImage(fileName);

        
        pdao.addProduct(p);

        req.setAttribute("success", "Product Added Successfully");
        req.getRequestDispatcher("addProduct.jsp").forward(req, resp);
    }
}