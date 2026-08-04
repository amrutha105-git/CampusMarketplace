<%@page import="com.campus.dto.Profile"%>
<%@page import="com.campus.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
User user = (User) session.getAttribute("signin");

if(user == null){
    response.sendRedirect("userLogin.jsp");
    return;
}

Profile profile = (Profile) request.getAttribute("profile");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Profile</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',Tahoma,Geneva,Verdana,sans-serif;
}

body{

    min-height:100vh;

    display:flex;
    justify-content:center;
    align-items:center;

    background:linear-gradient(135deg,#EEF2FF,#E0F2FE,#F8FAFC);

    padding:40px;
}

.profile-card{

    width:720px;

    background:#fff;

    border-radius:22px;

    box-shadow:0 20px 50px rgba(0,0,0,.15);

    padding:45px;

    position:relative;

    animation:fade .7s;
}

@keyframes fade{

from{

opacity:0;
transform:translateY(20px);

}

to{

opacity:1;
transform:translateY(0);

}

}

.edit-btn{

    position:absolute;

    right:35px;

    top:30px;

    background:#2563EB;

    color:white;

    border:none;

    padding:10px 22px;

    border-radius:10px;

    cursor:pointer;

    font-size:15px;

    transition:.3s;

}

.edit-btn:hover{

background:#1D4ED8;

}

.profile-image{

    display:flex;

    justify-content:center;

    margin-bottom:25px;

}

.profile-image img{

    width:180px;

    height:180px;

    border-radius:50%;

    object-fit:cover;

    border:6px solid white;

    box-shadow:0 10px 30px rgba(0,0,0,.2);

}

.default-image{

    width:180px;

    height:180px;

    border-radius:50%;

    display:flex;

    justify-content:center;

    align-items:center;

    background:#dbeafe;

    color:#2563EB;

    font-size:70px;

    font-weight:bold;

    border:6px solid white;

    box-shadow:0 10px 30px rgba(0,0,0,.2);

}

.fullname{

    text-align:center;

    font-size:30px;

    font-weight:bold;

    color:#222;

    margin-bottom:40px;

}

.info{

    display:flex;

    justify-content:space-between;

    align-items:center;

    padding:16px 0;

    border-bottom:1px solid #e5e7eb;

}

.label{

    font-weight:600;

    color:#555;

    font-size:17px;

}

.value{

    color:#222;

    font-size:17px;

    font-weight:500;

}

@media(max-width:768px){

.profile-card{

width:100%;

padding:30px;

}

.profile-image img,
.default-image{

width:140px;
height:140px;

}

.info{

flex-direction:column;
align-items:flex-start;
gap:6px;

}

.edit-btn{

position:static;
margin-bottom:25px;
width:100%;
text-decoration:none;
display:inline-block;
text-align:center;

}

}

</style>

</head>

<body>

<div class="profile-card">

<button class="edit-btn" onclick="location.href='editprofile'">Edit</button>

<div class="profile-image">
    <div class="default-image">
        <%= user.getName().substring(0,1).toUpperCase() %>
    </div>
</div>

<div class="fullname">

<%

if(profile!=null){

out.print(profile.getFirstName()+" "+profile.getLastName());

}else{

out.print(user.getName());

}

%>

</div>

<div class="info">

<div class="label">
First Name
</div>

<div class="value">

<%= profile!=null ? profile.getFirstName() : "-" %>

</div>

</div>

<div class="info">

<div class="label">
Last Name
</div>

<div class="value">

<%= profile!=null ? profile.getLastName() : "-" %>

</div>

</div>


<div class="info">

<div class="label">
Phone Number
</div>

<div class="value">

<%= profile!=null ? profile.getPhNo() : "-" %>

</div>

</div>

<div class="info">

<div class="label">
Gender
</div>

<div class="value">

<%= profile!=null ? profile.getGender() : "-" %>

</div>

</div>

<div class="info">

<div class="label">
Role
</div>

<div class="value">

<%= user.getRole() %>

</div>

</div>

</div>

</body>

</html>