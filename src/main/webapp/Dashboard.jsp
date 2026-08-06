<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<title>Campus Marketplace</title>

<!-- Tailwind CSS -->

<script src="https://cdn.tailwindcss.com"></script>

<!-- Font Awesome -->

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"/>

<!-- Google Font -->

<link rel="preconnect"
href="https://fonts.googleapis.com">

<link rel="preconnect"
href="https://fonts.gstatic.com"
crossorigin>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap"
rel="stylesheet">

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
overflow-x:hidden;
background:#ffffff;
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
background:rgba(0,0,0,.45);
z-index:-1;
}

/* Navigation Blur */

.glass{
backdrop-filter:blur(12px);
background:rgba(0,0,0,.25);
}

/* Buttons */

.btn{
transition:.3s;
}

.btn:hover{
transform:translateY(-3px);
}

</style>

</head>

<body>
<!-- ================= Background Video ================= -->

<img style="background-image: url("C:\Users\ammua\Downloads\WhatsApp Image 2026-08-07 at 12.53.29 AM.jpeg")>

<!-- Dark Overlay -->

<div class="overlay"></div>


<!-- ================= Navbar ================= -->

<nav class="glass fixed top-0 left-0 w-full z-50 shadow-lg">

    <div class="max-w-7xl mx-auto flex justify-between items-center px-10 py-5">

        <!-- Logo -->

        <a href="#" class="flex items-center gap-3">

            <i class="fas fa-graduation-cap text-4xl text-yellow-400"></i>

            <span class="text-3xl font-bold text-white">

                Campus Marketplace

            </span>

        </a>

        <!-- Menu -->

        <ul class="hidden md:flex items-center gap-8 text-white font-medium text-lg">

            <li>
                <a href="#home"
                class="hover:text-yellow-400 transition duration-300">
                Home
                </a>
            </li>

            <li>
                <a href="#about"
                class="hover:text-yellow-400 transition duration-300">
                About
                </a>
            </li>

            <li>
                <a href="#contact"
                class="hover:text-yellow-400 transition duration-300">
                Contact
                </a>
            </li>

            <li>

                <a href="userLogin.jsp"
                class="px-5 py-2 border-2 border-white rounded-lg hover:bg-white hover:text-blue-700 transition duration-300">

                    Login

                </a>

            </li>

            <li>

                <a href="userRegister.jsp"
                class="bg-yellow-400 text-black px-6 py-2 rounded-lg font-semibold hover:bg-yellow-500 transition duration-300 shadow-lg">

                    Register

                </a>

            </li>

        </ul>

    </div>

</nav>
<!-- ================= Hero Section ================= -->

<section id="home" class="min-h-screen flex items-center">

    <div class="max-w-7xl mx-auto px-8 w-full">

        <div class="grid md:grid-cols-2 gap-16 items-center">

            <!-- Left Content -->

            <div class="text-white">

                <p class="inline-block  text-yellow-300 px-5 py-2 rounded-full text-lg font-semibold uppercase tracking-widest shadow-lg mb-10">
    welcome to
</p>

                <h1 class="text-6xl md:text-7xl font-extrabold leading-tight">

                    Campus Marketplace

                </h1>

                <p class="mt-8 text-xl text-gray-200 leading-9 max-w-2xl">

                    Campus Marketplace is a secure platform where students can
                    buy, sell and exchange books, electronics, bicycles,
                    hostel essentials and much more with fellow students
                    inside the campus.

                </p>

                <!-- Buttons -->

                <div class="mt-10 flex flex-wrap gap-5">

                    <a href="userRegister.jsp"
                    class="bg-yellow-400 hover:bg-yellow-500 text-black font-semibold px-8 py-4 rounded-xl shadow-xl transition duration-300">

                        Get Started

                    </a>

                    <a href="userLogin.jsp"
                    class="border-2 border-white hover:bg-white hover:text-blue-700 text-white font-semibold px-8 py-4 rounded-xl transition duration-300">

                        Login

                    </a>

                </div>

            </div>

            <!-- Right Side -->

            <div class="hidden md:flex justify-center">

                <div class="bg-white/10 backdrop-blur-lg rounded-3xl p-8 border border-white/20 shadow-2xl w-[420px]">

                    <h3 class="text-3xl font-bold text-white text-center mb-8">

                        Why Choose Us?

                    </h3>

                    <div class="space-y-6">

                        <div class="flex items-center gap-5">

                            <div class="bg-blue-600 w-14 h-14 rounded-full flex items-center justify-center">

                                <i class="fas fa-book text-white text-2xl"></i>

                            </div>

                            <div>

                                <h4 class="text-white font-semibold text-lg">
                                    Buy Used Books
                                </h4>

                                <p class="text-gray-200 text-sm">
                                    Save money on academic books.
                                </p>

                            </div>

                        </div>

                        <div class="flex items-center gap-5">

                            <div class="bg-green-600 w-14 h-14 rounded-full flex items-center justify-center">

                                <i class="fas fa-laptop text-white text-2xl"></i>

                            </div>

                            <div>

                                <h4 class="text-white font-semibold text-lg">
                                    Sell Electronics
                                </h4>

                                <p class="text-gray-200 text-sm">
                                    Earn by selling unused gadgets.
                                </p>

                            </div>

                        </div>

                        <div class="flex items-center gap-5">

                            <div class="bg-yellow-500 w-14 h-14 rounded-full flex items-center justify-center">

                                <i class="fas fa-bicycle text-white text-2xl"></i>

                            </div>

                            <div>

                                <h4 class="text-white font-semibold text-lg">
                                    Exchange Essentials
                                </h4>

                                <p class="text-gray-200 text-sm">
                                    Trade useful hostel and study items.
                                </p>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</section>
<!-- ================= About Section ================= -->

<section id="about" class="bg-white py-24">

    <div class="max-w-7xl mx-auto px-8">

        <div class="grid md:grid-cols-2 gap-16 items-center">

            <!-- Left Image -->

            <div>

                <img src="https://yt3.googleusercontent.com/ytc/AIdro_m_W3GNlcr_c6giRKk57qNtOwjhU_aVcY1KdiGEVWoCpg=s900-c-k-c0x00ffffff-no-rj"
                     class="rounded-3xl shadow-2xl w-full h-[500px] object-cover">

            </div>

            <!-- Right Content -->

            <div>

                <p class="text-blue-600 font-bold uppercase tracking-[4px] mb-3">

                    About Us

                </p>

                <h2 class="text-5xl font-extrabold text-gray-800 leading-tight">

                    A Smart Marketplace

                    <br>

                    For Every Student

                </h2>

                <p class="text-gray-600 text-lg leading-9 mt-8">

                    Campus Marketplace is an exclusive platform where students
                    can buy, sell, and exchange products within their college.
                    From academic books to electronics and hostel essentials,
                    everything is available in one trusted marketplace.

                </p>

                <!-- Features -->

                <div class="grid grid-cols-2 gap-6 mt-10">

                    <div class="flex items-center gap-4">

                        <div class="bg-blue-100 p-4 rounded-full">

                            <i class="fas fa-shield-alt text-blue-600 text-2xl"></i>

                        </div>

                        <div>

                            <h4 class="font-bold text-gray-800">

                                Secure Platform

                            </h4>

                            <p class="text-gray-500 text-sm">

                                Trusted campus users only.

                            </p>

                        </div>

                    </div>

                    <div class="flex items-center gap-4">

                        <div class="bg-green-100 p-4 rounded-full">

                            <i class="fas fa-money-bill-wave text-green-600 text-2xl"></i>

                        </div>

                        <div>

                            <h4 class="font-bold text-gray-800">

                                Affordable

                            </h4>

                            <p class="text-gray-500 text-sm">

                                Student-friendly prices.

                            </p>

                        </div>

                    </div>

                    <div class="flex items-center gap-4">

                        <div class="bg-yellow-100 p-4 rounded-full">

                            <i class="fas fa-bolt text-yellow-500 text-2xl"></i>

                        </div>

                        <div>

                            <h4 class="font-bold text-gray-800">

                                Quick Deals

                            </h4>

                            <p class="text-gray-500 text-sm">

                                Fast buying & selling.

                            </p>

                        </div>

                    </div>

                    <div class="flex items-center gap-4">

                        <div class="bg-purple-100 p-4 rounded-full">

                            <i class="fas fa-recycle text-purple-600 text-2xl"></i>

                        </div>

                        <div>

                            <h4 class="font-bold text-gray-800">

                                Eco Friendly

                            </h4>

                            <p class="text-gray-500 text-sm">

                                Reuse and reduce waste.

                            </p>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</section>
<!-- ================= Why Choose Us ================= -->

<section class="py-24 bg-gradient-to-b from-slate-50 to-blue-50">

    <div class="max-w-7xl mx-auto px-8">

        <!-- Heading -->

        <div class="text-center mb-16">

            <span class="text-blue-600 font-semibold uppercase tracking-[4px]">

                Our Features

            </span>

            <h2 class="text-5xl font-extrabold text-gray-800 mt-4">

                Why Choose Campus Marketplace?

            </h2>

            <p class="text-gray-600 text-xl mt-5 max-w-3xl mx-auto">

                A secure and convenient platform designed exclusively for
                students to buy, sell and exchange products within the campus.

            </p>

        </div>

        <!-- Cards -->

        <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-8">

            <!-- Card 1 -->

            <div class="bg-white rounded-3xl p-8 shadow-lg hover:shadow-2xl hover:-translate-y-3 duration-300">

                <div class="w-20 h-20 rounded-full bg-blue-100 flex items-center justify-center mx-auto">

                    <i class="fas fa-user-shield text-4xl text-blue-600"></i>

                </div>

                <h3 class="text-2xl font-bold text-center mt-6">

                    Trusted Community

                </h3>

                <p class="text-gray-600 text-center mt-4 leading-7">

                    Only verified students can access the marketplace,
                    ensuring a safe buying and selling experience.

                </p>

            </div>

            <!-- Card 2 -->

            <div class="bg-white rounded-3xl p-8 shadow-lg hover:shadow-2xl hover:-translate-y-3 duration-300">

                <div class="w-20 h-20 rounded-full bg-green-100 flex items-center justify-center mx-auto">

                    <i class="fas fa-tags text-4xl text-green-600"></i>

                </div>

                <h3 class="text-2xl font-bold text-center mt-6">

                    Affordable Prices

                </h3>

                <p class="text-gray-600 text-center mt-4 leading-7">

                    Buy quality products at budget-friendly prices
                    from fellow students.

                </p>

            </div>

            <!-- Card 3 -->

            <div class="bg-white rounded-3xl p-8 shadow-lg hover:shadow-2xl hover:-translate-y-3 duration-300">

                <div class="w-20 h-20 rounded-full bg-yellow-100 flex items-center justify-center mx-auto">

                    <i class="fas fa-bolt text-4xl text-yellow-500"></i>

                </div>

                <h3 class="text-2xl font-bold text-center mt-6">

                    Instant Deals

                </h3>

                <p class="text-gray-600 text-center mt-4 leading-7">

                    Quickly connect with buyers and sellers
                    without any middleman.

                </p>

            </div>

            <!-- Card 4 -->

            <div class="bg-white rounded-3xl p-8 shadow-lg hover:shadow-2xl hover:-translate-y-3 duration-300">

                <div class="w-20 h-20 rounded-full bg-purple-100 flex items-center justify-center mx-auto">

                    <i class="fas fa-recycle text-4xl text-purple-600"></i>

                </div>

                <h3 class="text-2xl font-bold text-center mt-6">

                    Sustainable Campus

                </h3>

                <p class="text-gray-600 text-center mt-4 leading-7">

                    Give unused products a second life and
                    help reduce campus waste.

                </p>

            </div>

        </div>

    </div>

</section>
<!-- ================= Categories ================= -->

<section class="py-24 bg-white">

    <div class="max-w-7xl mx-auto px-8">

        <!-- Heading -->

        <div class="text-center mb-16">

            <span class="text-blue-600 font-semibold uppercase tracking-[4px]">

                Browse Categories

            </span>

            <h2 class="text-5xl font-extrabold text-gray-800 mt-4">

                Explore Popular Categories

            </h2>

            <p class="text-gray-600 text-xl mt-5">

                Everything students need, all in one marketplace.

            </p>

        </div>

        <!-- Category Cards -->

        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-10">

            <!-- Books -->

            <div class="group bg-white rounded-3xl shadow-lg overflow-hidden hover:shadow-2xl duration-300">

                <img src="https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?w=900"
                     class="w-full h-60 object-cover group-hover:scale-110 duration-500">

                <div class="p-6">

                    <h3 class="text-2xl font-bold text-gray-800">

                        📚 Books

                    </h3>

                    <p class="text-gray-600 mt-3">

                        Buy or sell textbooks, novels and study materials.

                    </p>

                </div>

            </div>

            <!-- Electronics -->

            <div class="group bg-white rounded-3xl shadow-lg overflow-hidden hover:shadow-2xl duration-300">

                <img src="https://images.unsplash.com/photo-1519389950473-47ba0277781c?w=900"
                     class="w-full h-60 object-cover group-hover:scale-110 duration-500">

                <div class="p-6">

                    <h3 class="text-2xl font-bold text-gray-800">

                        💻 Electronics

                    </h3>

                    <p class="text-gray-600 mt-3">

                        Laptops, calculators, headphones and gadgets.

                    </p>

                </div>

            </div>

           
            <!-- Sports -->

            <div class="group bg-white rounded-3xl shadow-lg overflow-hidden hover:shadow-2xl duration-300">

                <img src="https://images.unsplash.com/photo-1517649763962-0c623066013b?w=900"
                     class="w-full h-60 object-cover group-hover:scale-110 duration-500">

                <div class="p-6">

                    <h3 class="text-2xl font-bold text-gray-800">

                        🏸 Sports

                    </h3>

                    <p class="text-gray-600 mt-3">

                        Sports kits, bats, rackets, footballs and accessories.

                    </p>

                </div>

            </div>

            <!-- Stationery -->

            <div class="group bg-white rounded-3xl shadow-lg overflow-hidden hover:shadow-2xl duration-300">

                <img src="https://images.unsplash.com/photo-1455390582262-044cdead277a?w=900"
                     class="w-full h-60 object-cover group-hover:scale-110 duration-500">

                <div class="p-6">

                    <h3 class="text-2xl font-bold text-gray-800">

                        ✏ Stationery

                    </h3>

                    <p class="text-gray-600 mt-3">

                        Pens, notebooks, drawing tools and office supplies.

                    </p>

                </div>

            </div>

            <!-- Bicycle -->

            <div class="group bg-white rounded-3xl shadow-lg overflow-hidden hover:shadow-2xl duration-300">

                <img src="https://images.unsplash.com/photo-1507035895480-2b3156c31fc8?w=900"
                     class="w-full h-60 object-cover group-hover:scale-110 duration-500">

                <div class="p-6">

                    <h3 class="text-2xl font-bold text-gray-800">

                        🚲 Bicycles

                    </h3>

                    <p class="text-gray-600 mt-3">

                        Buy or sell bicycles and cycling accessories.

                    </p>

                </div>

            </div>

        </div>

    </div>

</section>
<!-- ================= How It Works ================= -->

<section class="py-24 bg-gradient-to-r from-blue-600 to-cyan-600">

    <div class="max-w-7xl mx-auto px-8">

        <!-- Heading -->

        <div class="text-center text-white mb-20">

            <span class="uppercase tracking-[4px] text-yellow-300 font-semibold">

                Simple Process

            </span>

            <h2 class="text-5xl font-extrabold mt-4">

                How Campus Marketplace Works

            </h2>

            <p class="mt-5 text-xl text-blue-100">

                Start buying and selling in just four easy steps.

            </p>

        </div>

        <!-- Steps -->

        <div class="grid md:grid-cols-4 gap-10">

            <!-- Step 1 -->

            <div class="bg-white rounded-3xl p-8 text-center shadow-xl hover:-translate-y-3 duration-300">

                <div class="w-20 h-20 rounded-full bg-blue-600 text-white flex items-center justify-center mx-auto text-3xl font-bold">

                    1

                </div>

                <i class="fas fa-user-plus text-5xl text-blue-600 mt-8"></i>

                <h3 class="text-2xl font-bold mt-6">

                    Register

                </h3>

                <p class="text-gray-600 mt-4 leading-7">

                    Create your student account in a few simple steps.

                </p>

            </div>

            <!-- Step 2 -->

            <div class="bg-white rounded-3xl p-8 text-center shadow-xl hover:-translate-y-3 duration-300">

                <div class="w-20 h-20 rounded-full bg-green-600 text-white flex items-center justify-center mx-auto text-3xl font-bold">

                    2

                </div>

                <i class="fas fa-box-open text-5xl text-green-600 mt-8"></i>

                <h3 class="text-2xl font-bold mt-6">

                    List Products

                </h3>

                <p class="text-gray-600 mt-4 leading-7">

                    Upload books and electronics or sports essentials.

                </p>

            </div>

            <!-- Step 3 -->

            <div class="bg-white rounded-3xl p-8 text-center shadow-xl hover:-translate-y-3 duration-300">

                <div class="w-20 h-20 rounded-full bg-yellow-500 text-white flex items-center justify-center mx-auto text-3xl font-bold">

                    3

                </div>

                <i class="fas fa-search text-5xl text-yellow-500 mt-8"></i>

                <h3 class="text-2xl font-bold mt-6">

                    Browse

                </h3>

                <p class="text-gray-600 mt-4 leading-7">

                    Explore products posted by other students.

                </p>

            </div>

            <!-- Step 4 -->

            <div class="bg-white rounded-3xl p-8 text-center shadow-xl hover:-translate-y-3 duration-300">

                <div class="w-20 h-20 rounded-full bg-purple-600 text-white flex items-center justify-center mx-auto text-3xl font-bold">

                    4

                </div>

                <i class="fas fa-handshake text-5xl text-purple-600 mt-8"></i>

                <h3 class="text-2xl font-bold mt-6">

                    Buy & Sell

                </h3>

                <p class="text-gray-600 mt-4 leading-7">

                    Connect securely and complete your transaction.

                </p>

            </div>

        </div>

    </div>

</section>

<!-- ================= Call To Action ================= -->

<section class="py-24 bg-gradient-to-r from-blue-700 to-cyan-600">

    <div class="max-w-5xl mx-auto text-center px-8">

        <h2 class="text-5xl font-extrabold text-white">

            Ready to Buy or Sell on Campus?

        </h2>

        <p class="text-blue-100 text-xl mt-6 leading-9">

            Join thousands of students using Campus Marketplace to buy,
            sell and exchange products quickly, securely and affordably.

        </p>

        <div class="mt-12 flex justify-center gap-6 flex-wrap">

            <a href="userRegister.jsp"
               class="bg-yellow-400 hover:bg-yellow-500 text-black font-bold px-8 py-4 rounded-xl shadow-xl duration-300">

                Create Account

            </a>

            <a href="userLogin.jsp"
               class="border-2 border-white hover:bg-white hover:text-blue-700 text-white font-bold px-8 py-4 rounded-xl duration-300">

                Login

            </a>

        </div>

    </div>

</section>
<!-- ================= Contact Section ================= -->

<section id="contact" class="py-24 bg-gray-100">

    <div class="max-w-7xl mx-auto px-8">

        <!-- Heading -->

        <div class="text-center mb-16">

            <span class="text-blue-600 uppercase tracking-[4px] font-semibold">

                Contact Us

            </span>

            <h2 class="text-5xl font-extrabold text-gray-800 mt-4">

                We'd Love to Hear From You

            </h2>

            <p class="text-gray-600 text-xl mt-5">

                Have questions or suggestions? Get in touch with us.

            </p>

        </div>

        <div class="grid md:grid-cols-2 gap-16 items-center">

            <!-- Left Side -->

            <div>

                <div class="flex items-start gap-5 mb-10">

                    <div class="w-16 h-16 rounded-full bg-blue-600 flex items-center justify-center">

                        <i class="fas fa-map-marker-alt text-white text-2xl"></i>

                    </div>

                    <div>

                        <h3 class="text-2xl font-bold text-gray-800">

                            Address

                        </h3>

                        <p class="text-gray-600 mt-2">

                            KNS Institute of Technology,<br>
                            Bengaluru, Karnataka

                        </p>

                    </div>

                </div>

                <div class="flex items-start gap-5 mb-10">

                    <div class="w-16 h-16 rounded-full bg-green-600 flex items-center justify-center">

                        <i class="fas fa-envelope text-white text-2xl"></i>

                    </div>

                    <div>

                        <h3 class="text-2xl font-bold text-gray-800">

                            Email

                        </h3>

                        <p class="text-gray-600 mt-2">

                            campusmarketplace@gmail.com

                        </p>

                    </div>

                </div>

                <div class="flex items-start gap-5 mb-10">

                    <div class="w-16 h-16 rounded-full bg-yellow-500 flex items-center justify-center">

                        <i class="fas fa-phone-alt text-white text-2xl"></i>

                    </div>

                    <div>

                        <h3 class="text-2xl font-bold text-gray-800">

                            Phone

                        </h3>

                        <p class="text-gray-600 mt-2">

                            +91 9876543210

                        </p>

                    </div>

                </div>

                <div class="flex items-start gap-5">

                    <div class="w-16 h-16 rounded-full bg-purple-600 flex items-center justify-center">

                        <i class="fas fa-clock text-white text-2xl"></i>

                    </div>

                    <div>

                        <h3 class="text-2xl font-bold text-gray-800">

                            Working Hours

                        </h3>

                        <p class="text-gray-600 mt-2">

                            Monday - Saturday<br>

                            9:00 AM - 6:00 PM

                        </p>

                    </div>

                </div>

            </div>

            <!-- Right Side -->

            <div class="bg-white rounded-3xl shadow-2xl p-10">

                <h3 class="text-3xl font-bold text-gray-800 mb-8">

                    Send Message

                </h3>

                <form>

                    <input type="text"
                    placeholder="Your Name"
                    class="w-full border border-gray-300 rounded-xl p-4 mb-5 focus:outline-none focus:ring-2 focus:ring-blue-500">

                    <input type="email"
                    placeholder="Your Email"
                    class="w-full border border-gray-300 rounded-xl p-4 mb-5 focus:outline-none focus:ring-2 focus:ring-blue-500">

                    <input type="text"
                    placeholder="Subject"
                    class="w-full border border-gray-300 rounded-xl p-4 mb-5 focus:outline-none focus:ring-2 focus:ring-blue-500">

                    <textarea rows="5"
                    placeholder="Write your message..."
                    class="w-full border border-gray-300 rounded-xl p-4 mb-6 focus:outline-none focus:ring-2 focus:ring-blue-500"></textarea>

                    <button
                    class="w-full bg-blue-600 hover:bg-blue-700 text-white py-4 rounded-xl text-lg font-semibold transition">

                        <i class="fas fa-paper-plane"></i>

                        Send Message

                    </button>

                </form>

            </div>

        </div>

    </div>

</section>
<!-- ================= Footer ================= -->

<footer class="bg-gray-900 text-white">

    <div class="max-w-7xl mx-auto px-8 py-16">

        <div class="grid md:grid-cols-4 gap-12">

            <!-- Logo & Description -->

            <div>

                <h2 class="text-3xl font-bold flex items-center gap-3">

                    <i class="fas fa-graduation-cap text-yellow-400"></i>

                    Campus Marketplace

                </h2>

                <p class="mt-6 text-gray-400 leading-8">

                    Campus Marketplace is a trusted platform that enables
                    students to buy, sell and exchange products safely
                    within the campus community.

                </p>

            </div>

            <!-- Quick Links -->

            <div>

                <h3 class="text-2xl font-semibold mb-6">

                    Quick Links

                </h3>

                <ul class="space-y-4 text-gray-400">

                    <li>

                        <a href="#home" class="hover:text-yellow-400">

                            Home

                        </a>

                    </li>

                    <li>

                        <a href="#about" class="hover:text-yellow-400">

                            About

                        </a>

                    </li>

                    <li>

                        <a href="#contact" class="hover:text-yellow-400">

                            Contact

                        </a>

                    </li>

                    <li>

                        <a href="userLogin.jsp" class="hover:text-yellow-400">

                            Login

                        </a>

                    </li>

                </ul>

            </div>

            <!-- Categories -->

            <div>

                <h3 class="text-2xl font-semibold mb-6">

                    Categories

                </h3>

                <ul class="space-y-4 text-gray-400">

                    <li>📚 Books</li>

                    <li>💻 Electronics</li>

                    <li>🛏 Hostel Essentials</li>

                    <li>🏸 Sports</li>

                    <li>✏️ Stationery</li>

                </ul>

            </div>

            <!-- Contact -->

            <div>

                <h3 class="text-2xl font-semibold mb-6">

                    Contact

                </h3>

                <div class="space-y-5 text-gray-400">

                    <p>

                        <i class="fas fa-map-marker-alt text-yellow-400 mr-3"></i>

                        Bengaluru, Karnataka

                    </p>

                    <p>

                        <i class="fas fa-envelope text-yellow-400 mr-3"></i>

                        campusmarketplace@gmail.com

                    </p>

                    <p>

                        <i class="fas fa-phone text-yellow-400 mr-3"></i>

                        +91 9876543210

                    </p>

                </div>

                <!-- Social Media -->

                <div class="flex gap-5 mt-8">

                    <a href="#"
                    class="w-12 h-12 rounded-full bg-blue-600 flex items-center justify-center hover:scale-110 duration-300">

                        <i class="fab fa-facebook-f"></i>

                    </a>

                    <a href="#"
                    class="w-12 h-12 rounded-full bg-pink-600 flex items-center justify-center hover:scale-110 duration-300">

                        <i class="fab fa-instagram"></i>

                    </a>

                    <a href="#"
                    class="w-12 h-12 rounded-full bg-sky-500 flex items-center justify-center hover:scale-110 duration-300">

                        <i class="fab fa-twitter"></i>

                    </a>

                    <a href="#"
                    class="w-12 h-12 rounded-full bg-blue-700 flex items-center justify-center hover:scale-110 duration-300">

                        <i class="fab fa-linkedin-in"></i>

                    </a>

                </div>

            </div>

        </div>

        <!-- Divider -->

        <hr class="border-gray-700 my-10">

        <!-- Bottom Footer -->

        <div class="flex flex-col md:flex-row justify-between items-center">

            <p class="text-gray-400">

                © 2026 Campus Marketplace. All Rights Reserved.

            </p>

            <a href="#home"
            class="mt-5 md:mt-0 bg-blue-600 hover:bg-blue-700 w-12 h-12 rounded-full flex items-center justify-center transition">

                <i class="fas fa-arrow-up text-white"></i>

            </a>

        </div>

    </div>

</footer>

</body>
</html>