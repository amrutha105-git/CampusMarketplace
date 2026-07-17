```jsp
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Campus Marketplace | Product Registration</title>

<!-- Tailwind CSS -->
<script src="https://cdn.tailwindcss.com"></script>

<!-- Font Awesome -->
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Poppins',sans-serif;
}

html{
    scroll-behavior:smooth;
}

body{
    min-height:100vh;
    overflow-y:auto;
}

/* Background Video */
.video-bg{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    object-fit:cover;
    z-index:-2;
}

/* Dark Overlay */
.overlay{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background:rgba(0,0,0,.55);
    z-index:-1;
}

/* Glass Effect */
.glass{
    background:rgba(255,255,255,.12);
    backdrop-filter:blur(15px);
    border:1px solid rgba(255,255,255,.2);
    box-shadow:0 10px 35px rgba(0,0,0,.4);
}

/* Inputs */
input,
textarea,
select{
    background:rgba(255,255,255,.12)!important;
    color:white!important;
}

input::placeholder,
textarea::placeholder{
    color:#ddd;
}

textarea{
    resize:none;
}

label{
    color:white;
    font-weight:600;
}

.footer-link:hover{
    transform:scale(1.2);
    transition:.3s;
}

</style>

</head>

<body>

<!-- Background Video -->
<video autoplay muted loop class="video-bg">
    <source src="https://www.pexels.com/download/video/6186658/" type="video/mp4">
</video>

<div class="overlay"></div>

<!-- Main Container -->
<div class="min-h-screen flex justify-center items-center py-12 px-5">

<div class="glass w-full max-w-4xl rounded-3xl p-10">

<!-- Heading -->

<div class="text-center mb-8">

<h1 class="text-4xl font-bold text-white">

<i class="fa-solid fa-store text-yellow-400"></i>

Campus Marketplace

</h1>

<p class="text-gray-200 mt-2 text-lg">

Buy • Sell • Exchange within Your Campus

</p>

</div>

<!-- Product Form -->

<form action="ProductServlet" method="post" enctype="multipart/form-data">

<div class="grid grid-cols-1 md:grid-cols-2 gap-6">

<!-- Category -->

<div>

<label>Category</label>

<select
name="category_id"
required
class="w-full mt-2 p-3 rounded-lg outline-none">

<option value="">Select Category</option>
<option value="1">Books</option>
<option value="2">Electronics</option>
<option value="3">Stationery</option>
<option value="4">Furniture</option>
<option value="5">Sports</option>

</select>

</div>

<!-- Product Name -->

<div>

<label>Product Name</label>

<input
type="text"
name="pname"
placeholder="Enter Product Name"
required
class="w-full mt-2 p-3 rounded-lg outline-none">

</div>

<!-- Description -->

<div class="md:col-span-2">

<label>Description</label>

<textarea
rows="4"
name="description"
placeholder="Describe your product..."
required
class="w-full mt-2 p-3 rounded-lg outline-none"></textarea>

</div>

<!-- Price -->

<div>

<label>Price (₹)</label>

<input
type="number"
step="0.01"
name="price"
placeholder="Enter Price"
required
class="w-full mt-2 p-3 rounded-lg outline-none">

</div>

<!-- Quantity -->

<div>

<label>Product Quantity</label>

<input
type="number"
name="product_quantity"
placeholder="Available Quantity"
required
class="w-full mt-2 p-3 rounded-lg outline-none">

</div>

<!-- Image -->

<div class="md:col-span-2">

<label>Upload Product Image</label>

<input
type="file"
name="image"
accept="image/*"
required
class="w-full mt-2 p-3 rounded-lg">

</div>

</div>

<!-- Button -->

<div class="text-center mt-8">

<button
type="submit"
class="bg-yellow-400 hover:bg-yellow-500 text-black font-bold px-10 py-3 rounded-full text-lg transition duration-300">

<i class="fa-solid fa-cloud-arrow-up"></i>

Register Product

</button>

</div>

</form>

</div>

</div>

<!-- Footer -->

<footer class="bg-black/70 backdrop-blur-md border-t border-gray-700 text-white py-6">

<div class="max-w-7xl mx-auto px-6">

<div class="grid md:grid-cols-3 gap-8 items-center">

<!-- Project Info -->

<div>

<h2 class="text-2xl font-bold text-yellow-400">

<i class="fa-solid fa-store"></i>

Campus Marketplace

</h2>

<p class="text-gray-300 mt-2">

A platform for students to buy, sell and exchange products securely within the campus.

</p>

</div>

<!-- Quick Links -->

<div>

<h3 class="text-xl font-semibold mb-3 text-yellow-300">

Quick Links

</h3>

<ul class="space-y-2 text-gray-300">

<li><a href="#" class="hover:text-yellow-400">Home</a></li>

<li><a href="#" class="hover:text-yellow-400">Products</a></li>

<li><a href="#" class="hover:text-yellow-400">Categories</a></li>

<li><a href="#" class="hover:text-yellow-400">Contact</a></li>

</ul>

</div>

<!-- Social -->

<div>

<h3 class="text-xl font-semibold mb-3 text-yellow-300">

Connect With Us

</h3>

<div class="flex gap-5 text-2xl">

<a href="#" class="footer-link hover:text-blue-500">
<i class="fab fa-facebook"></i>
</a>

<a href="#" class="footer-link hover:text-pink-500">
<i class="fab fa-instagram"></i>
</a>

<a href="#" class="footer-link hover:text-blue-400">
<i class="fab fa-linkedin"></i>
</a>

<a href="#" class="footer-link hover:text-sky-400">
<i class="fab fa-x-twitter"></i>
</a>

<a href="#" class="footer-link hover:text-red-500">
<i class="fas fa-envelope"></i>
</a>

</div>

</div>

</div>

<hr class="border-gray-700 my-6">

<p class="text-center text-gray-400">

© 2026 Campus Marketplace | Built with ❤️ using Java, JSP, Servlets, MySQL & Tailwind CSS

</p>

</div>

</footer>

</body>
</html>
```
