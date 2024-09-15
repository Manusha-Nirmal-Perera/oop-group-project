<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Store</title>
    <%@ include file="../includes/imports.jsp" %>
    
</head>

<body class="bg-gray-100 text-gray-800">

	<% 
    	if (session.getAttribute("user") != null) {
    %>
    		<jsp:include page="../includes/ALheader.jsp" /> 
    <% 
    	} else {
    %>
    		<jsp:include page="../includes/BLheader.jsp" /> 
	<% 
    	}
	%>
	
  

    <!-- Main Content for About Us -->
<main class="container mx-auto px-4 py-8">
    <!-- Mission Statement -->
    <section class="mb-12">
        <h2 class="text-2xl font-semibold mb-4">Our Mission</h2>
        <p class="text-gray-700">
            Lorem ipsum dolor, sit amet consectetur adipisicing elit. Maxime, voluptatibus eius. Cumque eos molestiae debitis corrupti quo maxime laudantium, tenetur, praesentium laboriosam perspiciatis.
        </p>
    </section>

    <!-- Team -->
    <section class="mb-12">
        <h2 class="text-2xl font-semibold mb-6 text-center">Meet Our Team</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
            <div class="bg-white p-6 rounded-lg shadow-md text-center">
                <img src="https://via.placeholder.com/150" alt="Team Member" class="w-32 h-32 rounded-full mx-auto mb-4">
                <h3 class="text-xl font-semibold">Nirmal</h3>
                <p class="text-gray-500 text-md">position</p>
            </div>
            <div class="bg-white p-6 rounded-lg shadow-md text-center">
                <img src="https://via.placeholder.com/150" alt="Team Member" class="w-32 h-32 rounded-full mx-auto mb-4">
                <h3 class="text-xl font-semibold">Rashan</h3>
                <p class="text-gray-500 text-md">position</p>
            </div>
            <div class="bg-white p-6 rounded-lg shadow-md text-center">
                <img src="https://via.placeholder.com/150" alt="Team Member" class="w-32 h-32 rounded-full mx-auto mb-4">
                <h3 class="text-xl font-semibold">Chamodya</h3>
                <p class="text-gray-500 text-md">position</p>
            </div>
            <div class="bg-white p-6 rounded-lg shadow-md text-center">
                <img src="https://via.placeholder.com/150" alt="Team Member" class="w-32 h-32 rounded-full mx-auto mb-4">
                <h3 class="text-xl font-semibold">Yasidu</h3>
                <p class="text-gray-500 text-md">position</p>
            </div>
        </div>
    </section>
    
</main>

<!-- Footer -->
	<jsp:include page="../includes/footer.jsp" />
<script src="../components/js/script.js"></script>
</body>

</html>

