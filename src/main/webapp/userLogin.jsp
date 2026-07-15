<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Campus Marketplace | Login</title>

<script src="https://cdn.tailwindcss.com"></script>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

.glass{
    background:rgba(255,255,255,0.15);
    backdrop-filter:blur(15px);
    -webkit-backdrop-filter:blur(15px);
    border:1px solid rgba(255,255,255,.25);
}

.video-bg{
    position:fixed;
    top:0;
    left:0;
    width:100%;
    height:100%;
    object-fit:cover;
    z-index:-2;
}

.overlay{
    position:fixed;
    inset:0;
    background:rgba(0,0,0,.55);
    z-index:-1;
}

</style>

</head>

<body class="min-h-screen flex flex-col">

<!-- Background Video -->

<video autoplay muted loop playsinline class="video-bg">
    <source src="https://www.pexels.com/download/video/36825270/" type="video/mp4">
</video>

<div class="overlay"></div>

<!-- Main Content -->

<div class="flex-grow flex items-center justify-center px-6 py-10">

<div class="glass w-full max-w-md rounded-3xl shadow-2xl p-8">

<!-- Logo -->

<div class="text-center">

<div
class="w-24 h-24 rounded-full bg-white mx-auto flex items-center justify-center shadow-xl">

<i class="fas fa-graduation-cap text-5xl text-blue-700"></i>

</div>

<h1 class="text-4xl font-bold text-white mt-5">

Campus Marketplace

</h1>

<p class="text-gray-200 mt-2">

Welcome Back! Login to Continue

</p>

</div>

<!-- Login Form -->

<form action="LoginServlet" method="post" class="mt-8 space-y-5">

<!-- Email -->

<div class="relative">

<i class="fa-solid fa-envelope absolute left-4 top-4 text-gray-500"></i>

<input
type="email"
name="email"
placeholder="Email Address"
required
class="w-full pl-11 py-3 rounded-xl outline-none focus:ring-2 focus:ring-blue-500"/>

</div>

<!-- Password -->

<div class="relative">

<i class="fa-solid fa-lock absolute left-4 top-4 text-gray-500"></i>

<input
type="password"
name="password"
id="password"
placeholder="Password"
required
class="w-full pl-11 py-3 rounded-xl outline-none focus:ring-2 focus:ring-blue-500"/>

</div>


<!-- Remember & Forgot -->

<div class="flex justify-between items-center text-white text-sm">

<label class="flex items-center gap-2">

<input type="checkbox" onclick="togglePassword()">

Show Password

</label>

<a href="forgotPassword.jsp"
class="text-yellow-300 hover:underline">

Forgot Password?

</a>

</div>

<!-- Login Button -->

<button
type="submit"
class="w-full py-3 rounded-xl bg-gradient-to-r from-blue-600 to-purple-600 text-white text-lg font-bold hover:scale-105 duration-300">

<i class="fa-solid fa-right-to-bracket"></i>

Login

</button>

</form>

<div class="text-center mt-6 text-white">

Don't have an account?

<a href="userRegister.jsp"
class="text-yellow-300 font-semibold hover:underline">

Register

</a>

</div>

</div>

</div>

<!-- Footer -->

<footer class="bg-black/60 backdrop-blur-md text-white">

<div class="max-w-7xl mx-auto px-8 py-8">

<div class="grid md:grid-cols-3 gap-8">

<div>

<h2 class="text-2xl font-bold">

Campus Marketplace

</h2>

<p class="text-gray-300 mt-3">

A secure marketplace where students and teachers can buy,
sell and exchange books, electronics, notes and accessories
inside the college campus.

</p>

</div>

<div>

<h2 class="text-2xl font-bold">

Quick Links

</h2>

<ul class="space-y-2 mt-3">

<li><a href="#" class="hover:text-blue-400">Home</a></li>
<li><a href="#" class="hover:text-blue-400">Products</a></li>
<li><a href="#" class="hover:text-blue-400">Categories</a></li>
<li><a href="#" class="hover:text-blue-400">Contact</a></li>

</ul>

</div>

<div>

<h2 class="text-2xl font-bold">

Follow Us

</h2>

<div class="flex gap-5 mt-4 text-3xl">

<a href="#" class="hover:text-blue-500">
<i class="fab fa-facebook"></i>
</a>

<a href="#" class="hover:text-pink-500">
<i class="fab fa-instagram"></i>
</a>

<a href="#" class="hover:text-blue-300">
<i class="fab fa-linkedin"></i>
</a>

<a href="#" class="hover:text-white">
<i class="fab fa-github"></i>
</a>

</div>

<p class="mt-5 text-gray-300">

📧 campusmarketplace@gmail.com

</p>

</div>

</div>

<hr class="my-6 border-gray-600">

<p class="text-center text-gray-300">

© 2026 Campus Marketplace | Designed for Students & Teachers

</p>

</div>

</footer>

<script>

function togglePassword(){

var password=document.getElementById("password");

if(password.type==="password"){
    password.type="text";
}else{
    password.type="password";
}

}

</script>

</body>
</html>