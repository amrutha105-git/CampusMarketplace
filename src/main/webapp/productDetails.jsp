<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.campus.dto.Products"%>
<%@ page import="com.campus.dto.Review"%>
<%@ page import="com.campus.dto.User"%>

<%
User u=(User)session.getAttribute("signin");

if(u==null){
    response.sendRedirect("userLogin.jsp");
    return;
}

Products product=(Products)request.getAttribute("product");
List<Review> reviews=(List<Review>)request.getAttribute("reviews");

int reviewCount=0;
int totalRating=0;

if(reviews!=null){

    reviewCount=reviews.size();

    for(Review r:reviews){
        totalRating += r.getRating();
    }
}

int avgRating=0;

if(reviewCount>0){
    avgRating = totalRating/reviewCount;
}

%>


<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Product Details</title>

<script src="https://cdn.tailwindcss.com"></script>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">


<style>

.review-card:hover{
    background:#f9fafb;
    transition:.3s;
}

</style>


</head>


<body class="bg-gray-100">


<!-- NAVBAR -->

<nav class="bg-blue-700 text-white shadow-lg">

<div class="max-w-7xl mx-auto flex justify-between items-center px-8 py-5">


<h1 class="text-3xl font-bold">

<i class="fas fa-store"></i>
Campus Marketplace

</h1>


<div class="space-x-8 text-lg">


<a href="viewProduct"
class="hover:text-yellow-300">

Back

</a>


<a href="LogoutServlet"
class="hover:text-red-300">

Logout

</a>


</div>

</div>

</nav>




<!-- PRODUCT SECTION -->


<div class="flex min-h-screen">


<!-- LEFT IMAGE -->


<div class="w-2/5 bg-white border-r flex flex-col justify-center items-center p-10">


<img src="images/<%=product.getImage()%>"
class="w-[85%] h-[450px] object-contain">


</div>





<!-- RIGHT DETAILS -->


<div class="w-3/5 bg-white p-10">


<h1 class="text-4xl font-bold text-blue-700">

<%=product.getName()%>

</h1>



<p class="text-green-600 text-3xl font-bold mt-5">

₹ <%=product.getPrice()%>

</p>




<!-- RATINGS -->

<div class="flex items-center mt-6">


<div class="text-yellow-400 text-2xl">


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


<span class="ml-4 text-lg text-gray-600">


<%=avgRating%>/5 • <%=reviewCount%> Reviews


</span>


</div>





<!-- DESCRIPTION -->


<h2 class="mt-8 text-2xl font-bold">

Description

</h2>



<p class="mt-3 text-gray-700 leading-8 text-lg">


<%=product.getDescription()%>


</p>




<hr class="my-10">





<!-- REVIEWS -->


<h2 class="text-3xl font-bold text-blue-700">

Customer Reviews

</h2>



<%

if(reviews!=null && !reviews.isEmpty()){


for(Review r:reviews){

%>



<div class="review-card border rounded-xl p-6 mt-6 shadow-sm">



<div class="flex items-center">


<div class="text-yellow-400 text-xl">


<%

for(int i=1;i<=5;i++){


if(i<=r.getRating()){


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


<span class="ml-4 text-gray-500">

<%=r.getRating()%>/5

</span>


</div>



<p class="mt-4 italic text-gray-700 text-lg">


"<%=r.getComment()%>"


</p>



<p class="text-sm text-gray-500 mt-3">


Reviewed on <%=r.getCreated_at()%>


</p>



</div>



<%

}

}else{


%>


<div class="text-center py-20">


<i class="fas fa-comment-slash text-6xl text-gray-400"></i>


<p class="text-gray-500 mt-6 text-xl">

No Reviews Yet

</p>


</div>



<%

}

%>




</div>


</div>





<!-- BUY BUTTON -->


<div class="bg-white border-t py-6 flex justify-center">


<a href="BuyProduct?id=<%=product.getProductId()%>"
class="bg-green-600 hover:bg-green-700 text-white text-xl font-semibold px-20 py-4 rounded-lg shadow-lg">


<i class="fas fa-shopping-cart mr-2"></i>


Buy Now


</a>



</div>




</body>

</html>