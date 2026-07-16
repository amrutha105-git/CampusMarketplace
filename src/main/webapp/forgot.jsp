<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Campus Marketplace | Forgot Password</title>

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

<div class="w-24 h-24 rounded-full bg-white mx-auto flex items-center justify-center shadow-xl">

<i class="fas fa-key text-5xl text-blue-700"></i>

</div>

<h1 class="text-4xl font-bold text-white mt-5">

Forgot Password

</h1>

<p class="text-gray-200 mt-2">

Reset your Campus Marketplace account password

</p>

</div>

<%
String error = (String)request.getAttribute("error");
if(error != null){
%>

<div class="mt-5 bg-red-100 border border-red-500 text-red-700 px-4 py-2 rounded-lg text-center">
    <%= error %>
</div>

<%
}
%>

<form action="ForgotServlet" method="post" class="mt-8 space-y-5">

<!-- Email -->

<div class="relative">

<i class="fa-solid fa-envelope absolute left-4 top-4 text-gray-500"></i>

<input
type="email"
name="mail"
placeholder="Enter Registered Email"
required
class="w-full pl-11 py-3 rounded-xl outline-none focus:ring-2 focus:ring-blue-500"/>

</div>

<!-- New Password -->

<div class="relative">

<i class="fa-solid fa-lock absolute left-4 top-4 text-gray-500"></i>

<input
type="password"
name="password"
placeholder="New Password"
required
class="w-full pl-11 py-3 rounded-xl outline-none focus:ring-2 focus:ring-blue-500"/>

</div>

<!-- Confirm Password -->

<div class="relative">

<i class="fa-solid fa-lock absolute left-4 top-4 text-gray-500"></i>

<input
type="password"
name="confirm"
placeholder="Confirm Password"
required
class="w-full pl-11 py-3 rounded-xl outline-none focus:ring-2 focus:ring-blue-500"/>

</div>

<!-- Button -->

<button
type="submit"
class="w-full py-3 rounded-xl bg-gradient-to-r from-blue-600 to-purple-600 text-white text-lg font-bold hover:scale-105 duration-300">

<i class="fa-solid fa-key"></i>

Update Password

</button>

</form>

<div class="text-center mt-6 text-white">

Remember your password?

<a href="userLogin.jsp"
class="text-yellow-300 font-semibold hover:underline">

Login

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

Buy, Sell and Exchange books, electronics, stationery, sports items and hostel essentials within your campus.

</p>

</div>

<div>

<h2 class="text-2xl font-bold">

Quick Links

</h2>

<ul class="space-y-2 mt-3">

<li><a href="home.jsp" class="hover:text-blue-400">Home</a></li>
<li><a href="userLogin.jsp" class="hover:text-blue-400">Login</a></li>
<li><a href="userRegister.jsp" class="hover:text-blue-400">Register</a></li>
<li><a href="#" class="hover:text-blue-400">Contact</a></li>

</ul>

</div>

<div>

<h2 class="text-2xl font-bold">

Contact

</h2>

<p class="mt-4 text-gray-300">

📧 campusmarketplace@gmail.com

</p>

<p class="mt-2 text-gray-300">

📍 Campus Marketplace

</p>

</div>

</div>

<hr class="my-6 border-gray-600">

<p class="text-center text-gray-300">

© 2026 Campus Marketplace | Designed for Students & Teachers

</p>

</div>

</footer>

</body>
</html>