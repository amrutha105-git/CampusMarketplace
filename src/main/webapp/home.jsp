<%@page import="com.campus.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Campus Marketplace | Home</title>

<script src="https://cdn.tailwindcss.com"></script>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

</head>

<body class="bg-gray-100">
<%User u=(User)session.getAttribute("signin"); %>
<%if(u==null){
	response.sendRedirect("userLogin.jsp");
	return;
	}%>


<!-- Navbar -->

<nav class="bg-blue-700 text-white shadow-lg">

<div class="max-w-7xl mx-auto flex justify-between items-center px-8 py-4">

<h1 class="text-3xl font-bold">
<i class="fas fa-graduation-cap"></i>
Campus Marketplace
</h1>

<ul class="flex gap-8 text-lg">



<li><a href="allProduct.jsp" class="hover:text-yellow-300">Products</a></li>

<li><a href="Product.jsp" class="hover:text-yellow-300">Sell Product</a></li>

<li><a href="orders.jsp" class="hover:text-yellow-300">Orders</a></li>

<li><a href="reviews.jsp" class="hover:text-yellow-300">Reviews</a></li>

<li><a href="profile.jsp" class="hover:text-yellow-300">Profile</a></li>

<li><a href="LogoutServlet" class="hover:text-red-300">Logout</a></li>

</ul>

</div>

</nav>

<!-- Hero Section -->

<section class="bg-gradient-to-r from-blue-600 to-purple-600 text-white py-20">

<div class="max-w-6xl mx-auto px-8">

<div class="grid md:grid-cols-2 gap-10 items-center">

<div>

<h2 class="text-5xl font-bold mb-6">
Welcome, <%=u.getName()  %> 👋
</h2>

<p class="text-xl mb-8">
Buy, Sell and Exchange books, electronics, sports items,
stationery and hostel essentials within your campus.
</p>

<a href="ViewProductsServlet"
class="bg-white text-blue-700 px-6 py-3 rounded-lg font-bold hover:bg-gray-200">

Browse Products

</a>

<a href="addProduct.jsp"
class="ml-4 bg-yellow-400 text-black px-6 py-3 rounded-lg font-bold hover:bg-yellow-300">

Sell Product

</a>

</div>

<div>

<img src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=800"
class="rounded-2xl shadow-2xl">

</div>

</div>

</div>

</section>

<!-- Categories -->

<section class="max-w-7xl mx-auto py-14 px-8">

<h2 class="text-4xl font-bold text-center mb-10">

Categories

</h2>

<div class="grid md:grid-cols-5 gap-6">

<div class="bg-white shadow-lg rounded-xl p-8 text-center hover:scale-105 duration-300">
📚
<h3 class="font-bold mt-3">Books</h3>
</div>

<div class="bg-white shadow-lg rounded-xl p-8 text-center hover:scale-105 duration-300">
💻
<h3 class="font-bold mt-3">Electronics</h3>
</div>

<div class="bg-white shadow-lg rounded-xl p-8 text-center hover:scale-105 duration-300">
⚽
<h3 class="font-bold mt-3">Sports</h3>
</div>

<div class="bg-white shadow-lg rounded-xl p-8 text-center hover:scale-105 duration-300">
📝
<h3 class="font-bold mt-3">Stationery</h3>
</div>

<div class="bg-white shadow-lg rounded-xl p-8 text-center hover:scale-105 duration-300">
🏠
<h3 class="font-bold mt-3">Hostel Essentials</h3>
</div>

</div>

</section>

<!-- Features -->

<section class="bg-white py-16">

<div class="max-w-7xl mx-auto px-8">

<h2 class="text-4xl font-bold text-center mb-12">

Why Choose Campus Marketplace?

</h2>

<div class="grid md:grid-cols-4 gap-8">

<div class="text-center">

<i class="fas fa-user-shield text-5xl text-blue-700"></i>

<h3 class="text-xl font-bold mt-4">

Trusted Community

</h3>

<p class="text-gray-600 mt-2">

Only students and teachers can access the marketplace.

</p>

</div>

<div class="text-center">

<i class="fas fa-tags text-5xl text-green-600"></i>

<h3 class="text-xl font-bold mt-4">

Affordable Prices

</h3>

<p class="text-gray-600 mt-2">

Buy products at student-friendly prices.

</p>

</div>

<div class="text-center">

<i class="fas fa-bolt text-5xl text-yellow-500"></i>

<h3 class="text-xl font-bold mt-4">

Fast Transactions

</h3>

<p class="text-gray-600 mt-2">

Quick buying and selling inside your campus.

</p>

</div>

<div class="text-center">

<i class="fas fa-handshake text-5xl text-purple-600"></i>

<h3 class="text-xl font-bold mt-4">

Easy Exchange

</h3>

<p class="text-gray-600 mt-2">

Exchange books and accessories with ease.

</p>

</div>

</div>

</div>

</section>

<!-- Footer -->

<footer class="bg-gray-900 text-white py-10 mt-10">

<div class="max-w-7xl mx-auto text-center">

<h2 class="text-3xl font-bold">

Campus Marketplace

</h2>

<p class="mt-3 text-gray-300">

Helping Students & Teachers Buy, Sell and Exchange Products.

</p>

<p class="mt-5">

📧 campusmarketplace@gmail.com

</p>

<hr class="my-6 border-gray-700">

<p>

© 2026 Campus Marketplace. All Rights Reserved.

</p>

</div>

</footer>

</body>
</html>