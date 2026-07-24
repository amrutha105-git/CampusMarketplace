<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Campus Marketplace | Add Product</title>

<script src="https://cdn.tailwindcss.com"></script>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

body{
    background:#f3f4f6;
}

.card{
    background:white;
    border-radius:20px;
    box-shadow:0 10px 30px rgba(0,0,0,.15);
}

input,
select,
textarea{
    width:100%;
    padding:12px;
    border:1px solid #d1d5db;
    border-radius:10px;
    outline:none;
    transition:.3s;
}

input:focus,
select:focus,
textarea:focus{
    border-color:#2563eb;
    box-shadow:0 0 8px rgba(37,99,235,.3);
}

textarea{
    resize:none;
}

</style>

</head>

<body>

<!-- Navbar -->

<nav class="bg-blue-700 text-white shadow-lg">

<div class="max-w-7xl mx-auto flex justify-between items-center px-8 py-4">

<h1 class="text-3xl font-bold">
<i class="fas fa-store"></i>
Campus Marketplace
</h1>

<div class="space-x-6">

<a href="home.jsp" class="hover:text-yellow-300">Home</a>

<a href="viewProduct" class="hover:text-yellow-300">Products</a>

<a href="LogoutServlet" class="hover:text-red-300">Logout</a>

</div>

</div>

</nav>

<!-- Main -->

<div class="max-w-5xl mx-auto py-12 px-5">

<div class="card p-10">

<div class="text-center mb-8">

<i class="fas fa-box-open text-6xl text-blue-700"></i>

<h1 class="text-4xl font-bold text-blue-700 mt-4">

Add New Product

</h1>

<p class="text-gray-600 mt-2">

Sell your product to students inside your campus.

</p>

</div>

<%
String success=(String)request.getAttribute("success");
if(success!=null){
%>

<div class="bg-green-100 text-green-700 border border-green-400 rounded-lg p-3 mb-5 text-center">
<%=success%>
</div>

<%
}
%>

<form action="ProductServlet" method="post" enctype="multipart/form-data">

<div class="grid md:grid-cols-2 gap-6">

<div>

<label class="font-semibold">Category</label>

<select name="category_id" required>

<option value="">Select Category</option>
<option value="1">Books</option>
<option value="2">Electronics</option>
<option value="3">Stationery</option>
<option value="4">Furniture</option>
<option value="5">Sports</option>

</select>

</div>

<div>

<label class="font-semibold">Product Name</label>

<input
type="text"
name="pname"
placeholder="Enter Product Name"
required>

</div>

<div class="md:col-span-2">

<label class="font-semibold">Description</label>

<textarea
rows="4"
name="description"
placeholder="Describe your product..."
required></textarea>

</div>

<div>

<label class="font-semibold">Price (₹)</label>

<input
type="number"
step="0.01"
name="price"
placeholder="Enter Price"
required>

</div>


<div class="md:col-span-2">

<label class="font-semibold">Product Image</label>

<input
type="file"
name="image"
accept="image/*"
required>

</div>

</div>

<div class="text-center mt-8">

<button
type="submit"
class="bg-blue-700 hover:bg-blue-800 text-white px-10 py-3 rounded-lg text-lg font-bold transition">

<i class="fas fa-upload"></i>

Add Product

</button>

</div>

</form>

</div>

</div>

<!-- Footer -->

<footer class="bg-gray-900 text-white mt-10 py-8">

<div class="max-w-7xl mx-auto px-8">

<div class="grid md:grid-cols-3 gap-8">

<div>

<h2 class="text-2xl font-bold">

Campus Marketplace

</h2>

<p class="text-gray-300 mt-3">

Buy, Sell and Exchange products securely inside your campus.

</p>

</div>

<div>

<h2 class="text-2xl font-bold">

Quick Links

</h2>

<ul class="space-y-2 mt-3">

<li><a href="home.jsp" class="hover:text-blue-400">Home</a></li>

<li><a href="viewProduct" class="hover:text-blue-400">Products</a></li>

<li><a href="addProduct.jsp" class="hover:text-blue-400">Sell Product</a></li>

</ul>

</div>

<div>

<h2 class="text-2xl font-bold">

Contact

</h2>

<p class="mt-3">

📧 campusmarketplace@gmail.com

</p>

</div>

</div>

<hr class="my-6 border-gray-700">

<p class="text-center text-gray-300">

© 2026 Campus Marketplace | All Rights Reserved

</p>

</div>

</footer>

</body>
</html>