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

<%
User u=(User)session.getAttribute("signin");
if(u==null){
    response.sendRedirect("userLogin.jsp");
    return;
}
%>

<!-- ================= Navbar ================= -->

<nav class="bg-blue-700 text-white shadow-lg sticky top-0 z-50">

<div class="max-w-7xl mx-auto flex justify-between items-center px-8 py-5">

<h1 class="text-3xl font-bold">
<i class="fas fa-graduation-cap"></i>
Campus Marketplace
</h1>

<ul class="flex gap-8 text-lg font-medium">

<li><a href="viewProduct" class="hover:text-yellow-300 duration-300">Products</a></li>

<li><a href="addProduct.jsp" class="hover:text-yellow-300 duration-300">Sell Product</a></li>

<li><a href="orders.jsp" class="hover:text-yellow-300 duration-300">Orders</a></li>

<li><a href="reviews.jsp" class="hover:text-yellow-300 duration-300">Reviews</a></li>

<li><a href="profile.jsp" class="hover:text-yellow-300 duration-300">Profile</a></li>

<li><a href="LogoutServlet" class="hover:text-red-300 duration-300">Logout</a></li>

</ul>

</div>

</nav>

<!-- ================= Hero Section ================= -->

<section class="bg-gradient-to-r from-sky-100 via-blue-100 to-cyan-100 min-h-[90vh] flex items-center">

<div class="max-w-7xl mx-auto px-8 w-full">

<div class="grid md:grid-cols-2 gap-16 items-center">

<!-- Left Side -->

<div>

<h2 class="text-6xl font-extrabold leading-tight mb-8 text-gray-800">

Welcome,
<br>

<span class="text-blue-700">
<%=u.getName()%>
</span>

👋

</h2>

<p class="text-2xl leading-10 text-gray-700 mb-10 max-w-xl">

Buy, Sell and Exchange Books, Electronics, Sports Items,
Stationery and Hostel Essentials within your Campus.

</p>

<div class="space-x-5">

<a href="viewProduct"
class="bg-blue-700 text-white px-8 py-4 rounded-lg font-bold text-lg hover:bg-blue-800 duration-300 shadow-lg">

<i class="fas fa-store"></i>

Browse Products

</a>

<a href="addProduct.jsp"
class="bg-yellow-400 text-black px-8 py-4 rounded-lg font-bold text-lg hover:bg-yellow-500 duration-300 shadow-lg">

<i class="fas fa-plus-circle"></i>

Sell Product

</a>

</div>

</div>

<!-- Right Side -->

<div>

<img
src="https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=900"
class="rounded-3xl shadow-2xl w-full h-[520px] object-cover">

</div>

</div>

</div>

</section>

<!-- ================= Features ================= -->

<section class="bg-white py-20">

<div class="max-w-7xl mx-auto px-8">

<h2 class="text-5xl font-bold text-center text-gray-800 mb-16">

Why Choose Campus Marketplace?

</h2>

<div class="grid md:grid-cols-4 gap-10">

<div class="bg-gray-50 rounded-xl shadow-lg p-8 text-center hover:shadow-2xl hover:-translate-y-2 duration-300">

<i class="fas fa-user-shield text-6xl text-blue-700"></i>

<h3 class="text-2xl font-bold mt-6 text-gray-800">

Trusted Community

</h3>

<p class="text-gray-600 mt-4">

Only students and teachers can access the marketplace.

</p>

</div>

<div class="bg-gray-50 rounded-xl shadow-lg p-8 text-center hover:shadow-2xl hover:-translate-y-2 duration-300">

<i class="fas fa-tags text-6xl text-green-600"></i>

<h3 class="text-2xl font-bold mt-6 text-gray-800">

Affordable Prices

</h3>

<p class="text-gray-600 mt-4">

Buy products at student-friendly prices.

</p>

</div>

<div class="bg-gray-50 rounded-xl shadow-lg p-8 text-center hover:shadow-2xl hover:-translate-y-2 duration-300">

<i class="fas fa-bolt text-6xl text-yellow-500"></i>

<h3 class="text-2xl font-bold mt-6 text-gray-800">

Fast Transactions

</h3>

<p class="text-gray-600 mt-4">

Quick buying and selling inside your campus.

</p>

</div>

<div class="bg-gray-50 rounded-xl shadow-lg p-8 text-center hover:shadow-2xl hover:-translate-y-2 duration-300">

<i class="fas fa-handshake text-6xl text-purple-600"></i>

<h3 class="text-2xl font-bold mt-6 text-gray-800">

Easy Exchange

</h3>

<p class="text-gray-600 mt-4">

Exchange books and accessories with ease.

</p>

</div>

</div>

</div>

</section>

<!-- ================= Footer ================= -->

<footer class="bg-gray-900 text-white py-12">

<div class="max-w-7xl mx-auto text-center">

<h2 class="text-4xl font-bold">

Campus Marketplace

</h2>

<p class="mt-4 text-gray-300 text-lg">

Helping Students & Teachers Buy, Sell and Exchange Products.

</p>

<p class="mt-5 text-lg">

📧 campusmarketplace@gmail.com

</p>

<hr class="my-8 border-gray-700">

<p class="text-gray-400">

© 2026 Campus Marketplace. All Rights Reserved.

</p>

</div>

</footer>

</body>
</html>