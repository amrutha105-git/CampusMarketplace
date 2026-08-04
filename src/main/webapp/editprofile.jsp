<%@page import="com.campus.dto.Profile"%>
<%@page import="com.campus.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
User user = (User) session.getAttribute("signin");
Profile profile = (Profile) request.getAttribute("profile");

if (user == null) {
	response.sendRedirect("userLogin.jsp");
	return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>

<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', sans-serif;
}

body {
    background: linear-gradient(135deg, #EEF2FF, #E0F2FE, #F8FAFC);
    display: flex;
    justify-content: center;
    align-items: flex-start;
    min-height: 100vh;
    padding: 40px 20px;
}

.container {
    width: 100%;
    max-width: 500px;
    background: #fff;
    border-radius: 20px;
    padding: 35px;
    box-shadow: 0 15px 40px rgba(0,0,0,.15);
}

h2 {
	text-align: center;
	color: #1E3A8A;
	margin-bottom: 30px;
}

.form-group {
	margin-bottom: 22px;
}

form {
	display: flex;
	flex-direction: column;
}

label {
	display: block;
	margin-bottom: 8px;
	font-weight: 600;
	color: #374151;
}

input, select {
	width: 100%;
	padding: 14px;
	border: 1px solid #D1D5DB;
	border-radius: 10px;
	font-size: 15px;
	outline: none;
	transition: .3s;
}

input:focus, select:focus {
	border-color: #2563EB;
	box-shadow: 0 0 8px rgba(37, 99, 235, .25);
}

.buttons {
	display: flex;
	justify-content: space-between;
	margin-top: 35px;
}

.save-btn {
	width: 48%;
	padding: 14px;
	background: #2563EB;
	color: white;
	border: none;
	border-radius: 10px;
	font-size: 16px;
	cursor: pointer;
	transition: .3s;
}

.save-btn:hover {
	background: #1D4ED8;
}

.cancel-btn {
	width: 48%;
	padding: 14px;
	background: #E5E7EB;
	color: #111827;
	border: none;
	border-radius: 10px;
	font-size: 16px;
	cursor: pointer;
	transition: .3s;
}

.cancel-btn:hover {
	background: #D1D5DB;
}

.profile-icon {
	width: 120px;
	height: 120px;
	border-radius: 50%;
	background: #DBEAFE;
	color: #2563EB;
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 48px;
	font-weight: bold;
	margin: auto;
	margin-bottom: 25px;
}
</style>

</head>

<body>

	<div class="container">

		<div class="profile-icon">

			<%=user.getName().substring(0, 1).toUpperCase()%>

		</div>


		<h2>Edit Profile</h2>

		<form action="saveprofile" method="post">
		    <div class="form-group">
				<label>First Name</label> <input type="text" name="firstName"
					value="<%=profile != null ? profile.getFirstName() : ""%>">
			</div>
			
			<div class="form-group">
				<label>Last Name</label> <input type="text" name="lastName"
					value="<%=profile != null ? profile.getLastName() : ""%>">
			</div>

			<div class="form-group">
				<label>Phone Number</label> <input type="number" name="phNo"
					value="<%=profile != null ? profile.getPhNo() : ""%>">
			</div>

			<div class="form-group">
				<label>Gender</label> <select name="gender">

					<option value="MALE"
						<%=profile != null && "MALE".equals(profile.getGender()) ? "selected" : ""%>>
						Male</option>

					<option value="FEMALE"
						<%=profile != null && "FEMALE".equals(profile.getGender()) ? "selected" : ""%>>
						Female</option>

					<option value="OTHER"
						<%=profile != null && "OTHER".equals(profile.getGender()) ? "selected" : ""%>>
						Other</option>

				</select>

			</div>

			<div class="buttons">

				<button class="save-btn" type="submit">Save Changes</button>

				<button class="cancel-btn" type="button"
					onclick="location.href='viewprofile'">Cancel</button>

			</div>

		</form>

	</div>
</body>
</html>