<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.campus.dto.Products"%>
<%@ page import="com.campus.dto.User"%>

<%
User u = (User)session.getAttribute("signin");

if(u == null){
    response.sendRedirect("userLogin.jsp");
    return;
}

Products p = (Products)request.getAttribute("product");

if(p == null){
    response.sendRedirect("viewProduct");
    return;
}


double price = p.getPrice();

double gst = price * 0.18;

double total = price + gst;

%>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Checkout</title>

<script src="https://cdn.tailwindcss.com"></script>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

</head>


<body class="bg-gray-100">


<!-- Navbar -->

<nav class="bg-blue-700 text-white px-10 py-5">

<h1 class="text-3xl font-bold">
<i class="fas fa-store"></i>
Campus Marketplace
</h1>

</nav>



<div class="max-w-5xl mx-auto mt-10 bg-white rounded-xl shadow-lg p-10">


<h1 class="text-3xl font-bold text-blue-700 mb-8">

<i class="fas fa-shopping-cart"></i>
Checkout

</h1>



<div class="flex gap-10">


<!-- Product Image -->

<div class="w-1/3">

<img src="images/<%=p.getImage()%>"
class="w-full h-72 object-contain border rounded-lg">

</div>



<!-- Product Details -->

<div class="w-2/3">


<h2 class="text-3xl font-bold">

<%=p.getName()%>

</h2>



<p class="mt-5 text-gray-700 text-lg">

<%=p.getDescription()%>

</p>



<div class="mt-6 text-xl">


<p>
Price :
<span class="font-bold text-green-600">
₹ <%=price%>
</span>
</p>


<p class="mt-3">

GST (18%) :

<span class="font-bold">
₹ <%=gst%>
</span>

</p>



<hr class="my-5">



<p class="text-2xl font-bold text-blue-700">

Total Amount :
₹ <%=total%>

</p>


</div>


</div>

</div>




<!-- Order Form -->

<form action="PlaceOrder" method="post"
class="mt-10">


<input type="hidden"
name="productId"
value="<%=p.getProductId()%>">



<input type="hidden"
name="price"
value="<%=price%>">



<input type="hidden"
name="gst"
value="<%=gst%>">



<input type="hidden"
name="total"
value="<%=total%>">



<label class="text-xl font-semibold">

Quantity

</label>


<input type="number"
name="quantity"
value="1"
min="1"
class="border rounded-lg px-4 py-2 ml-5 w-24">



<div class="mt-10 flex justify-center">


<button type="submit"

class="bg-green-600 hover:bg-green-700 text-white text-xl font-semibold px-16 py-4 rounded-lg shadow">

<i class="fas fa-check"></i>

Confirm Order

</button>


</div>


</form>


</div>


</body>

</html>