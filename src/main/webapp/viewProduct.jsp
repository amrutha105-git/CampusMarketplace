<%@ page language="java"
         contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.campus.dto.User"%>
<%@ page import="com.campus.dto.Products"%>
<%@ page import="com.campus.dto.Review"%>

<%
User u = (User) session.getAttribute("signin");

if (u == null) {
    response.sendRedirect("userLogin.jsp");
    return;
}

List<Products> products = (List<Products>) request.getAttribute("products");
List<Review> reviews = (List<Review>) request.getAttribute("reviews");
%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Campus Marketplace | View Products</title>

<script src="https://cdn.tailwindcss.com"></script>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
rel="stylesheet">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Poppins',sans-serif;
}

body{
background:#f5f7fb;
overflow:hidden;
}

::-webkit-scrollbar{
width:8px;
}

::-webkit-scrollbar-thumb{
background:#2563eb;
border-radius:20px;
}

.product-card{

transition:.35s;
border-radius:20px;
overflow:hidden;
background:white;

box-shadow:
0 8px 22px rgba(0,0,0,.08);

}

.product-card:hover{

transform:translateY(-8px);

box-shadow:
0 18px 40px rgba(0,0,0,.15);

}

.product-image{

height:260px;
width:100%;
object-fit:contain;
padding:18px;

transition:.35s;

}

.product-card:hover .product-image{

transform:scale(1.04);

}

.category-card{

transition:.25s;

}

.category-card:hover{

background:#2563eb;
color:white;

transform:translateX(5px);

}

.view-btn{

transition:.3s;

}

.view-btn:hover{

transform:scale(1.02);

}

</style>

</head>

<body class="h-screen flex flex-col">

<!-- ================= NAVBAR ================= -->

<nav class="bg-blue-700 shadow-xl">

<div class="max-w-7xl mx-auto">

<div class="flex justify-between items-center py-5 px-8">

<div class="flex items-center gap-4">

<div class="bg-white rounded-xl w-14 h-14 flex items-center justify-center">

<i class="fas fa-store text-blue-700 text-2xl"></i>

</div>

<h1 class="text-4xl font-bold text-white">

Campus Marketplace

</h1>

</div>

<div class="flex items-center gap-10 text-lg">

<a href="home.jsp"
class="text-white hover:text-yellow-300 transition">

Home

</a>

<a href="addProduct.jsp"
class="text-white hover:text-yellow-300 transition">

Sell Product

</a>

<a href="LogoutServlet"
class="bg-red-500 hover:bg-red-600 px-6 py-2 rounded-xl text-white font-semibold transition">

Logout

</a>

</div>

</div>

</div>

</nav>

<%
String success = (String) session.getAttribute("success");

if(success != null){
%>

<div class="mx-8 mt-5 bg-green-100 border border-green-300 text-green-800 px-6 py-4 rounded-xl font-semibold text-center">

    ✅ <%=success%>

</div>

<%
session.removeAttribute("success");
}
%>

<%
String error = (String) session.getAttribute("error");

if(error != null){
%>

<div class="mx-8 mt-5 bg-red-100 border border-red-300 text-red-800 px-6 py-4 rounded-xl font-semibold text-center">

    ❌ <%=error%>

</div>

<%
session.removeAttribute("error");
}
%>

<div class="flex flex-1 overflow-hidden">

<!-- ================= SIDEBAR ================= -->

<aside class="w-72 bg-white shadow-lg border-r overflow-y-auto">

<div class="p-6">

<h2 class="text-3xl font-bold text-gray-800 mb-8">

Categories

</h2>

<div class="space-y-5">

<a href="viewProduct?categoryId=1"
class="category-card flex items-center gap-4 bg-gray-50 rounded-2xl p-5 font-semibold text-lg shadow-sm">

📚 Books

</a>

<a href="viewProduct?categoryId=2"
class="category-card flex items-center gap-4 bg-gray-50 rounded-2xl p-5 font-semibold text-lg shadow-sm">

💻 Electronics

</a>

<a href="viewProduct?categoryId=3"
class="category-card flex items-center gap-4 bg-gray-50 rounded-2xl p-5 font-semibold text-lg shadow-sm">

⚽ Sports

</a>

<a href="viewProduct?categoryId=4"
class="category-card flex items-center gap-4 bg-gray-50 rounded-2xl p-5 font-semibold text-lg shadow-sm">

📝 Stationery

</a>

<a href="viewProduct?categoryId=5"
class="category-card flex items-center gap-4 bg-gray-50 rounded-2xl p-5 font-semibold text-lg shadow-sm">

🏠 Hostel Essentials

</a>

</div>

</div>

</aside>

<!-- ================= PRODUCTS ================= -->

<main class="flex-1 overflow-y-auto">

<div class="bg-white border-b shadow-sm py-8">

<h1 class="text-center text-4xl font-bold text-gray-800">

Available Products

</h1>

<p class="text-center text-gray-500 mt-2 text-lg">

Browse products available in the marketplace.

</p>

</div>

<div class="p-8">
<%
if(products != null && !products.isEmpty()){
%>

<div class="grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-8">

<%
for(Products p : products){

    int reviewCount = 0;
    int totalRating = 0;

    if(reviews != null){

        for(Review r : reviews){

            if(r.getProduct_id().equals(p.getProductId())){

                reviewCount++;
                totalRating += r.getRating();

            }

        }

    }

    int avgRating = reviewCount==0 ? 0 : totalRating/reviewCount;
%>

<!-- ================= PRODUCT CARD ================= -->

<div class="product-card">

    <!-- Product Image -->

    <div class="bg-gray-100 h-72 flex items-center justify-center">

        <img src="images/<%=p.getImage()%>"
             alt="<%=p.getName()%>"
             class="product-image">

    </div>

    <!-- Product Details -->

    <div class="p-6 flex flex-col">

        <!-- Product Name -->

        <h2 class="text-2xl font-bold text-gray-800 uppercase truncate">

            <%=p.getName()%>

        </h2>

        <!-- Description -->

        <p class="text-gray-500 text-sm leading-6 mt-3 h-14 overflow-hidden">

            <%=p.getDescription()%>

        </p>

        <!-- Price -->

        <div class="mt-5">

            <span class="text-3xl font-bold text-green-600">

                ₹ <%=String.format("%.0f",p.getPrice())%>

            </span>

        </div>

        <!-- Rating -->

        <div class="flex items-center justify-between mt-6">

            <div class="flex text-yellow-400 text-lg">

<%
for(int i=1;i<=5;i++){

    if(i<=avgRating){
%>

                <i class="fas fa-star"></i>

<%
    }else{
%>

                <i class="far fa-star"></i>

<%
    }
}
%>

            </div>

            <span class="text-sm text-gray-500">

                <%=reviewCount%> Reviews

            </span>

        </div>

        <!-- Average Rating -->

        <div class="mt-2 text-gray-600 font-medium">

            Rating :
            <span class="text-blue-700">

                <%=avgRating%>.0 / 5

            </span>

        </div>

        <!-- Button -->

        <div class="mt-7">

            <a href="ProductDetails?productId=<%=p.getProductId()%>"
               class="view-btn flex justify-center items-center gap-2 w-full bg-blue-700 hover:bg-blue-800 text-white py-3 rounded-xl font-semibold shadow-md">

                <i class="fas fa-eye"></i>

                View Details

            </a>

        </div>

    </div>

</div>

<%
}
%>

</div>

<%
}else{
%>


<!-- ================= NO PRODUCTS ================= -->

<div class="flex items-center justify-center min-h-[70vh]">

    <div class="bg-white rounded-3xl shadow-xl p-12 text-center max-w-lg">

        <!-- Icon -->

        <div class="w-28 h-28 mx-auto bg-blue-100 rounded-full flex items-center justify-center">

            <i class="fas fa-box-open text-5xl text-blue-600"></i>

        </div>

        <!-- Heading -->

        <h2 class="text-4xl font-bold text-gray-800 mt-8">

            No Products Available

        </h2>

        <!-- Message -->

        <p class="text-gray-500 text-lg mt-4 leading-8">

            There are currently no products in this category.
            Be the first to sell something on Campus Marketplace!

        </p>

        <!-- Button -->

        <a href="addProduct.jsp"
           class="inline-flex items-center gap-3 mt-8 bg-blue-700 hover:bg-blue-800 text-white px-8 py-4 rounded-xl font-semibold shadow-lg transition duration-300">

            <i class="fas fa-plus-circle"></i>

            Add Product

        </a>

    </div>

</div>

<%
}
%>

        </div>

    </main>

</div>

</body>

</html>