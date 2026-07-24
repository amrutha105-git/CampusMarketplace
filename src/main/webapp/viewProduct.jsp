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

    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

    <style>

        html,
        body{
            height:100%;
            margin:0;
            padding:0;
        }

        body{
            background:#f3f4f6;
            font-family:Arial, Helvetica, sans-serif;
        }

        .product-card{
            transition:0.3s ease;
        }

        .product-card:hover{
            transform:translateY(-8px);
            box-shadow:0 12px 25px rgba(0,0,0,0.18);
        }

        .rating-star{
            color:#facc15;
        }

        .product-image{
            height:240px;
            object-fit:contain;
        }

    </style>

</head>
<body class="bg-gray-100 h-screen flex flex-col overflow-hidden">

<!-- ================= NAVBAR ================= -->

<nav class="bg-blue-700 text-white shadow-lg sticky top-0 z-50">

    <div class="max-w-7xl mx-auto flex justify-between items-center px-8 py-5">

        <h1 class="text-3xl font-bold flex items-center gap-3">
            <i class="fas fa-store"></i>
            Campus Marketplace
        </h1>

        <div class="flex items-center space-x-8 text-lg">

            <a href="home.jsp" class="hover:text-yellow-300 transition">
                Home
            </a>

            <a href="addProduct.jsp" class="hover:text-yellow-300 transition">
                Sell Product
            </a>

            <a href="LogoutServlet" class="hover:text-red-300 transition">
                Logout
            </a>

        </div>

    </div>

</nav>

<!-- ================= MAIN ================= -->

<div class="flex flex-1 overflow-hidden">

    <!-- Sidebar -->

    <aside class="w-72 bg-white border-r shadow-lg">

        <div class="p-6">

            <h2 class="text-2xl font-bold text-blue-700 mb-6">
                Categories
            </h2>

            <div class="space-y-4">

                <a href="viewProduct?categoryId=1"
                   class="block bg-blue-50 hover:bg-blue-100 rounded-lg p-4 font-semibold">
                    📚 Books
                </a>

                <a href="viewProduct?categoryId=2"
                   class="block bg-blue-50 hover:bg-blue-100 rounded-lg p-4 font-semibold">
                    💻 Electronics
                </a>

                <a href="viewProduct?categoryId=3"
                   class="block bg-blue-50 hover:bg-blue-100 rounded-lg p-4 font-semibold">
                    ⚽ Sports
                </a>

                <a href="viewProduct?categoryId=4"
                   class="block bg-blue-50 hover:bg-blue-100 rounded-lg p-4 font-semibold">
                    📝 Stationery
                </a>

                <a href="viewProduct?categoryId=5"
                   class="block bg-blue-50 hover:bg-blue-100 rounded-lg p-4 font-semibold">
                    🏠 Hostel Essentials
                </a>

            </div>

        </div>

    </aside>

    <!-- Right Section -->

    <main class="flex-1 overflow-y-auto">

        <div class="bg-white shadow-sm py-4">

            <h1 class="text-center text-2xl font-bold text-blue-700">
                Available Products
            </h1>

            <p class="text-center text-gray-600">
                Browse products available in the marketplace.
            </p>

        </div>

        <div class="p-6">

<%
if(products != null && !products.isEmpty()){
%>

<div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">

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

<div class="product-card bg-white rounded-xl shadow-md overflow-hidden">

    <!-- Product Image -->

    <div class="bg-gray-100 flex justify-center items-center h-64 p-5">

        <img src="images/<%=p.getImage()%>"
             class="product-image">

    </div>

    <!-- Product Details -->

    <div class="p-6">

        <!-- Product Name -->

        <h2 class="text-2xl font-bold text-blue-700 uppercase">

            <%=p.getName()%>

        </h2>

        <!-- Description -->

        <p class="text-gray-600 mt-3 text-sm leading-6 h-14 overflow-hidden">

            <%=p.getDescription()%>

        </p>

        <!-- Price -->

        <p class="text-3xl font-bold text-green-600 mt-5">

            ₹ <%=String.format("%.0f",p.getPrice())%>

        </p>

        <!-- Rating -->

        <div class="flex items-center mt-5">

            <div class="text-yellow-400 text-xl">

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

            <span class="ml-3 text-gray-600 font-medium">

                <%=avgRating%>.0 • <%=reviewCount%> Reviews

            </span>

        </div>

        <!-- View Button -->

        <div class="mt-8">

            <a href="ProductDetails?productId=<%=p.getProductId()%>"
               class="block w-full text-center bg-blue-700 hover:bg-blue-800 text-white font-semibold py-3 rounded-lg shadow-md transition">

                View

            </a>

        </div>

    </div>

</div>
<%
}   // End of for loop
%>

</div> <!-- End Grid -->

<%
}else{
%>

<!-- ================= NO PRODUCTS AVAILABLE ================= -->

<div class="flex justify-center items-center h-full">

    <div class="bg-white rounded-xl shadow-lg p-12 text-center">

        <i class="fas fa-box-open text-6xl text-gray-400"></i>

        <h2 class="text-3xl font-bold mt-5">

            No Products Available

        </h2>

        <p class="text-gray-500 mt-3">

            There are no products available in the marketplace.

        </p>

        <a href="addProduct.jsp"
           class="inline-block mt-6 bg-blue-700 hover:bg-blue-800 text-white px-8 py-3 rounded-lg">

            Add Product

        </a>

    </div>

</div>

<%
}
%>

        </div> <!-- End Products Section -->

    </main>

</div>

</body>

</html>