<%@page import="java.util.List"%>
<%@page import="com.campus.dto.Products"%>
<%@page import="com.campus.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
User u=(User)session.getAttribute("signin");
if(u==null){
    response.sendRedirect("userLogin.jsp");
    return;
}

List<Products> products=(List<Products>)request.getAttribute("products");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Campus Marketplace | View Products</title>

<script src="https://cdn.tailwindcss.com"></script>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

body{
    background:#f3f4f6;
}

.product-card{
    transition:0.3s;
}

.product-card:hover{
    transform:translateY(-8px);
    box-shadow:0 12px 25px rgba(0,0,0,.2);
}

</style>

</head>

<body>

<!-- Navbar -->

<nav class="bg-blue-700 text-white">

<div class="max-w-7xl mx-auto flex justify-between items-center px-8 py-4">

<h1 class="text-3xl font-bold">
<i class="fas fa-store"></i>
Campus Marketplace
</h1>

<div class="space-x-6">

<a href="home.jsp" class="hover:text-yellow-300">Home</a>

<a href="addProduct.jsp" class="hover:text-yellow-300">Sell Product</a>

<a href="LogoutServlet" class="hover:text-red-300">Logout</a>

</div>

</div>

</nav>

<!-- Heading -->

<div class="text-center mt-10">

<h1 class="text-4xl font-bold text-blue-700">

Available Products

</h1>

<p class="text-gray-600 mt-3">

Browse products available in the marketplace.

</p>

</div>

<!-- Products -->

<div class="max-w-7xl mx-auto px-8 py-10">

<div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-8">

<%
if(products!=null && !products.isEmpty()){

for(Products p:products){
%>

<div class="product-card bg-white rounded-xl overflow-hidden">

<img src="images/<%=p.getImage()%>"
     class="w-full h-56 object-cover">

<div class="p-5">

<h2 class="text-2xl font-bold text-blue-700">

<%=p.getName()%>

</h2>

<p class="text-gray-600 mt-3">

<%=p.getDescription()%>

</p>

<p class="text-green-600 text-2xl font-bold mt-4">

₹ <%=p.getPrice()%>

</p>

<p class="mt-2">

Quantity :
<b><%=p.getProductQuantity()%></b>

</p>

<div class="mt-6 flex justify-between">

<a href="ViewSingleProduct?id=<%=p.getProductId()%>"
class="bg-blue-600 text-white px-4 py-2 rounded-lg hover:bg-blue-700">

View

</a>

<a href="BuyProduct?id=<%=p.getProductId()%>"
class="bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700">

Buy

</a>

</div>

</div>

</div>

<%
}

}else{
%>

<div class="col-span-4">

<div class="bg-white rounded-xl shadow-lg p-10 text-center">

<i class="fas fa-box-open text-6xl text-gray-400"></i>

<h2 class="text-3xl font-bold mt-4">

No Products Available

</h2>

<p class="text-gray-500 mt-3">

There are no products in the marketplace.

</p>

<a href="addProduct.jsp"
class="inline-block mt-6 bg-blue-700 text-white px-6 py-3 rounded-lg hover:bg-blue-800">

Add Product

</a>

</div>

</div>

<%
}
%>

</div>

</div>

<!-- Footer -->

<footer class="bg-gray-900 text-white py-8 mt-10">

<div class="text-center">

<h2 class="text-2xl font-bold">

Campus Marketplace

</h2>

<p class="mt-2">

Buy • Sell • Exchange within your Campus

</p>

<hr class="my-5 border-gray-700 w-3/4 mx-auto">

<p>

© 2026 Campus Marketplace | All Rights Reserved

</p>

</div>

</footer>

</body>
</html>