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

html,
body{
    height:100%;
}

.product-card{
    transition:.3s;
}

.product-card:hover{
    transform:translateY(-8px);
    box-shadow:0 12px 25px rgba(0,0,0,.2);
}

</style>

</head>

<body class="bg-gray-100 h-screen flex flex-col overflow-hidden">

<!-- ================= NAVBAR ================= -->

<nav class="bg-blue-700 text-white shadow-lg sticky top-0 z-50">

    <div class="max-w-7xl mx-auto flex justify-between items-center px-8 py-5">

        <h1 class="text-3xl font-bold">

            <i class="fas fa-store"></i>

            Campus Marketplace

        </h1>

        <div class="space-x-8 text-lg">

            <a href="home.jsp"
            class="hover:text-yellow-300 transition">

                Home

            </a>

            <a href="addProduct.jsp"
            class="hover:text-yellow-300 transition">

                Sell Product

            </a>

            <a href="LogoutServlet"
            class="hover:text-red-300 transition">

                Logout

            </a>

        </div>

    </div>

</nav>

<!-- ================= MAIN SECTION ================= -->

<div class="flex flex-1 overflow-hidden">

    <!-- ================= LEFT SIDEBAR ================= -->

    <aside class="w-72 bg-white border-r shadow-lg flex-shrink-0">

        <div class="sticky top-0 p-6">

            <h2 class="text-2xl font-bold text-blue-700 mb-6">

                Categories

            </h2>

            <div class="space-y-4">

                <a href="#"
                class="block bg-blue-50 hover:bg-blue-100 rounded-lg p-4 font-semibold transition">

                    📚 Books

                </a>

                <a href="#"
                class="block bg-blue-50 hover:bg-blue-100 rounded-lg p-4 font-semibold transition">

                    💻 Electronics

                </a>

                <a href="#"
                class="block bg-blue-50 hover:bg-blue-100 rounded-lg p-4 font-semibold transition">

                    ⚽ Sports

                </a>

                <a href="#"
                class="block bg-blue-50 hover:bg-blue-100 rounded-lg p-4 font-semibold transition">

                    📝 Stationery

                </a>

                <a href="#"
                class="block bg-blue-50 hover:bg-blue-100 rounded-lg p-4 font-semibold transition">

                    🏠 Hostel Essentials

                </a>

            </div>

        </div>

    </aside>

    <!-- ================= RIGHT SIDE ================= -->

    <main class="flex-1 flex flex-col overflow-hidden">

        <!-- Heading -->

       <div class="bg-white shadow-sm py-2">

    <div class="text-center">

        <h1 class="text-2xl font-bold text-blue-700">
            Available Products
        </h1>

        <p class="text-gray-600 mt-1 text-sm">
            Browse products available in the marketplace.
        </p>

    </div>

</div>

        <!-- Products -->

        <div class="flex-1 overflow-y-auto p-8">

<%
if(products!=null && !products.isEmpty()){
%>

<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-8">

<%
for(Products p:products){
%>

<div class="product-card bg-white rounded-xl shadow-md overflow-hidden">

    <img src="images/<%=p.getImage()%>"
         class="w-full h-56 object-cover">

    <div class="p-5">

        <h2 class="text-2xl font-bold text-blue-700">
            <%=p.getName()%>
        </h2>

        <p class="text-gray-600 mt-3 h-16 overflow-hidden">
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
               class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg">
                View
            </a>

            <a href="BuyProduct?id=<%=p.getProductId()%>"
               class="bg-green-600 hover:bg-green-700 text-white px-4 py-2 rounded-lg">
                Buy
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

</div>

        <!-- ================= FOOTER ================= -->

       <!--   <footer class="bg-gray-900 text-white py-8 mt-auto">

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
        -->

    </main>

</div>

</body>
</html>