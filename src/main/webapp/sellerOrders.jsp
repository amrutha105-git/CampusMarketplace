<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="com.campus.dto.SellersOrders"%>
<%@ page import="com.campus.dto.User"%>

<%
User seller = (User) session.getAttribute("signin");

if (seller == null) {
    response.sendRedirect("userLogin.jsp");
    return;
}

List<SellersOrders> orders =
(List<SellersOrders>) request.getAttribute("orders");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Seller Orders</title>

<script src="https://cdn.tailwindcss.com"></script>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

</head>

<body class="bg-gray-100">

<!-- Navbar -->

<nav class="bg-blue-700 text-white shadow-lg">

<div class="max-w-7xl mx-auto flex justify-between items-center px-8 py-5">

<h1 class="text-3xl font-bold">
<i class="fas fa-store"></i>
Campus Marketplace
</h1>

<div class="space-x-8">

<a href="home.jsp" class="hover:text-yellow-300">
Home
</a>

<a href="LogoutServlet" class="hover:text-red-300">
Logout
</a>

</div>

</div>

</nav>

<div class="max-w-7xl mx-auto mt-10">

<h2 class="text-3xl font-bold text-blue-700 mb-6">
Seller Orders
</h2>

<%
if (orders != null && !orders.isEmpty()) {
%>

<div class="overflow-x-auto">

<table class="w-full bg-white shadow-lg rounded-lg overflow-hidden">

<thead class="bg-blue-700 text-white">

<tr>
<th class="p-4">Order ID</th>
<th class="p-4">Buyer</th>
<th class="p-4">Product</th>
<th class="p-4">Quantity</th>
<th class="p-4">Price</th>
<th class="p-4">Status</th>
<th class="p-4">Ordered At</th>
<th class="p-4">Action</th>
</tr>

</thead>

<tbody>

<%
for (SellersOrders s : orders) {
%>

<tr class="border-b text-center hover:bg-gray-100">

<td class="p-4"><%=s.getOrderId()%></td>

<td class="p-4"><%=s.getBuyerName()%></td>

<td class="p-4"><%=s.getProductName()%></td>

<td class="p-4"><%=s.getQuantity()%></td>

<td class="p-4">₹ <%=s.getUnitPrice()%></td>

<!-- Status -->

<td class="p-4">

<%
if ("Pending".equals(s.getOrderStatus())) {
%>

<span class="bg-yellow-200 text-yellow-800 px-3 py-1 rounded">
Pending
</span>

<%
} else if ("Accepted".equals(s.getOrderStatus())) {
%>

<span class="bg-green-200 text-green-800 px-3 py-1 rounded">
Accepted
</span>

<%
} else if ("Rejected".equals(s.getOrderStatus())) {
%>

<span class="bg-red-200 text-red-800 px-3 py-1 rounded">
Rejected
</span>

<%
} else {
%>

<span class="bg-blue-200 text-blue-800 px-3 py-1 rounded">
Completed
</span>

<%
}
%>

</td>

<td class="p-4"><%=s.getOrderedAt()%></td>

<!-- Action Buttons -->

<td class="p-4">

<%
if ("Pending".equals(s.getOrderStatus())) {
%>

<a href="UpdateOrderStatus?orderId=<%=s.getOrderId()%>&status=Accepted"
class="bg-green-600 hover:bg-green-700 text-white px-3 py-2 rounded">

Accept

</a>

<a href="UpdateOrderStatus?orderId=<%=s.getOrderId()%>&status=Rejected"
class="bg-red-600 hover:bg-red-700 text-white px-3 py-2 rounded ml-2">

Reject

</a>

<%
} else if ("Accepted".equals(s.getOrderStatus())) {
%>

<a href="UpdateOrderStatus?orderId=<%=s.getOrderId()%>&status=Completed"
class="bg-blue-600 hover:bg-blue-700 text-white px-3 py-2 rounded">

Mark Completed

</a>

<%
} else {
%>

<span class="text-gray-500 font-semibold">
No Action
</span>

<%
}
%>

</td>

</tr>

<%
}
%>

</tbody>

</table>

</div>

<%
} else {
%>

<div class="bg-white shadow-lg rounded-lg p-10 text-center">

<i class="fas fa-box-open text-6xl text-gray-400"></i>

<h2 class="text-3xl font-bold mt-5">
No Orders Yet
</h2>

<p class="text-gray-500 mt-3">
No customer has ordered your products.
</p>

</div>

<%
}
%>

</div>

</body>
</html>