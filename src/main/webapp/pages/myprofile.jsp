<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.company.modal.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">
    <%
        if (session.getAttribute("user") != null) {
    %><jsp:include page="../includes/ALheader.jsp" /> <% 
        } else {
            response.sendRedirect("home.jsp");
            return;
        }
    %>
    <%
        User u = (User) request.getSession().getAttribute("user");
    %>
    <!-- Profile Section -->
    <section class="py-16 bg-gray-100">
        <div class="container mx-auto px-4">
            <div class="bg-white rounded-lg shadow-lg p-6 max-w-4xl mx-auto">
                <div class="flex flex-col md:flex-row items-center md:items-start">
                    <!-- Profile Picture -->
                    <div class="w-48 h-48 bg-gray-200 rounded-full overflow-hidden mb-6 md:mb-0 md:mr-8 shadow">
                        <img src="/ecommerce/components/images/users/<%= u.getImage() %>" alt="Profile Picture" class="w-full h-full object-cover">
                    </div>
                    <!-- User Information -->
                    <div class="md:flex-1">
                        <form method="post" action="/ecommerce/user-edit-info" enctype="multipart/form-data">
                        	<input type="hidden" name="userID" value="<%= u.getId() %>">
                            <h1 class="text-4xl font-bold mb-2 text-gray-800"><%= u.getfName() %> <%= u.getlName() %></h1>
                            <p class="text-gray-500 mb-4">Joined: 
                               <%=u.getRegisteredDate() %>
                            </p>
                            <p class="text-gray-700 mb-4">Email: 
                                <input class="toggle-readonly" type="email" name="email" value="<%= u.getEmail() %>" class="border border-gray-300 rounded-lg px-2 py-1 w-full" readonly/>
                            </p>
                            <p class="text-gray-700 mb-4">Phone Number: 
                                <input class="toggle-readonly" type="tel" name="phone" value="<%= u.getPhone() %>" class="border border-gray-300 rounded-lg px-2 py-1 w-full" readonly/>
                            </p>
                            <p class="text-gray-700 mb-4">Address: 
                                <input class="toggle-readonly" type="text" name="address" value="<%= u.getAddress() %>" class="border border-gray-300 rounded-lg px-2 py-1 w-full" readonly/>
                            </p>
							
							<p id="profile-pic-up" class="hidden text-gray-700 mb-4">New profile picture: 
                                <input class="toggle-readonly" type="file" name="profile-pic" class="border border-gray-300 rounded-lg px-2 py-1 w-full" readonly/>
                            </p>
                            <!-- Profile Actions -->
                            <div class="space-y-2 mb-4">
                                <button id="edit-profile-btn" class="block w-full text-center bg-blue-500 text-white py-2 px-4 rounded-lg hover:bg-blue-600">Edit Profile</button>
                                <input type="submit" id="save-changes-btn" class="hidden block text-center bg-green-600 text-white py-2 px-4 rounded-lg hover:bg-green-700" value="Save changes">
                                <a href="change-password.jsp" class="block text-center bg-yellow-500 text-white py-2 px-4 rounded-lg hover:bg-yellow-600">Change Password</a>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="mt-10">
                    <h2 class="text-2xl font-bold mb-4 text-gray-800">Order History</h2>
                    <!-- Example order history item -->
                    <div class="bg-gray-50 p-4 rounded-lg shadow mb-4">
                        <h3 class="text-xl font-semibold mb-2 text-gray-800">Order #12345</h3>
                        <p class="text-gray-700 mb-2">Date: August 20, 2024</p>
                        <p class="text-gray-700 mb-2">Total: $120.00</p>
                        <a href="order-details.jsp" class="text-blue-600 hover:underline">View Details</a>
                    </div>
                    <!-- Repeat order history item as needed -->
                </div>
                <div class="flex justify-center mt-6 px-4">
                    <a href="../delete-user?id=<%= u.getId() %>" class="bg-red-600 text-white py-2 px-4 rounded-lg hover:bg-red-700 w-max">Delete Account</a>
                </div>
            </div>
        </div>
    </section>
	
    <%@ include file="../includes/footer.jsp" %>
    <script src="/ecommerce/components/js/userprofile.js"></script>
    	<%@ include file="../includes/alert.jsp" %>
</body>
</html>
