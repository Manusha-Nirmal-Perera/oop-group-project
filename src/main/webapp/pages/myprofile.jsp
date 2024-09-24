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
                    <img src="<%= u.getImage() %>" alt="Profile Picture" class="w-full h-full object-cover">
                </div>
                <!-- User Information -->
                <div class="md:flex-1">
                    <h1 class="text-4xl font-bold mb-2 text-gray-800"><%= u.getfName() %> <%= u.getlName() %></h1>
                    <p class="text-gray-700 mb-4"><%= u.getEmail() %></p>
                    <p class="text-gray-500 mb-4">Joined: <%= u.getRegisteredDate() %></p>

                    <!-- Profile Actions -->
                    <div class="space-y-2 mb-4">
                        <a href="edit-profile.jsp" class="block text-center bg-blue-600 text-white py-2 px-4 rounded-lg hover:bg-blue-700">Edit Profile</a>
                        <a href="change-password.jsp" class="block text-center bg-yellow-500 text-white py-2 px-4 rounded-lg hover:bg-yellow-600">Change Password</a>
                    </div>

                    <!-- Delete Account Button -->
                    
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
				<a href="../delete-user?id=<%=u.getId() %>" class="bg-red-600 text-white py-2 px-4 rounded-lg hover:bg-red-700 w-max">Delete Account</a>
			</div>
        </div>
        
    </div>
    
    
</section>

	

	<p><%=u.getId() %></p>
    <%@ include file="../includes/footer.jsp" %>
</body>
</html>
