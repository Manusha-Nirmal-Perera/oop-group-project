<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Evermart-about Us</title>
    <%@ include file="../includes/imports.jsp" %>
    <style>
  @keyframes gradientMove {
    0%, 100% {
      background-position: 0% 50%;
    }
    50% {
      background-position: 100% 50%;
    }
  }

  .animated-gradient {
    background-size: 200% 200%;
    animation: gradientMove 5s ease infinite;
  }
</style>
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
<main class="container mx-auto px-4 py-12 space-y-16">
    <!-- Mission Statement -->
    <section class="mb-12 text-center bg-gradient-to-r from-blue-200 via-green-200 to-purple-200 animated-gradient py-12 rounded-lg shadow-md">
        <h2 class="text-4xl font-extrabold text-gray-800 mb-6">Our Mission</h2>
        <p class="text-gray-700 max-w-3xl mx-auto leading-relaxed text-lg">
            At Evermart, we're on a mission to make your shopping journey simple and delightful. From the latest trends to everyday essentials, we bring you high-quality products at unbeatable prices. We're all about innovation, sustainability, and putting you first.
        </p>
    </section>

    <!-- Team Section -->
    <section class="mb-12">
        <h2 class="text-4xl font-extrabold mb-6 text-center text-gray-800">Meet the Team</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
            <div class="bg-white p-8 rounded-lg shadow-lg text-center transition-transform hover:scale-105 hover:bg-gray-100">
                <img src="/ecommerce/components/images/utilities/nirmal.jpg" alt="Nirmal" class="w-32 h-32 rounded-full mx-auto mb-6">
                <h3 class="text-2xl font-bold text-gray-900">Nirmal</h3>
                <p class="text-gray-500 text-lg mb-4">Founder & CEO</p>
                <p class="text-gray-600">Visionary leader shaping Evermart's success, committed to exceptional customer experiences.</p>
            </div>
            <div class="bg-white p-8 rounded-lg shadow-lg text-center transition-transform hover:scale-105 hover:bg-gray-100">
                <img src="/ecommerce/components/images/utilities/rashan.jpg" alt="Rashan" class="w-32 h-32 rounded-full mx-auto mb-6">
                <h3 class="text-2xl font-bold text-gray-900">Rashaan</h3>
                <p class="text-gray-500 text-lg mb-4">Chief Technology Officer</p>
                <p class="text-gray-600">Tech wizard behind the smooth, secure Evermart platform, ensuring a seamless experience for all.</p>
            </div>
            <div class="bg-white p-8 rounded-lg shadow-lg text-center transition-transform hover:scale-105 hover:bg-gray-100">
                <img src="/ecommerce/components/images/utilities/chanodya.jpg" alt="Chamodya" class="w-32 h-32 rounded-full mx-auto mb-6">
                <h3 class="text-2xl font-bold text-gray-900">Chanodya</h3>
                <p class="text-gray-500 text-lg mb-4">Head of Marketing</p>
                <p class="text-gray-600">Creative force behind our brand, connecting Evermart with customers in innovative ways.</p>
            </div>
            <div class="bg-white p-8 rounded-lg shadow-lg text-center transition-transform hover:scale-105 hover:bg-gray-100">
                <img src="/ecommerce/components/images/utilities/yasidu.jpg" alt="Yasidu" class="w-32 h-32 rounded-full mx-auto mb-6">
                <h3 class="text-2xl font-bold text-gray-900">Yasidu</h3>
                <p class="text-gray-500 text-lg mb-4">Operations Manager</p>
                <p class="text-gray-600">The engine behind the scenes, making sure everything flows smoothly from store to doorstep.</p>
            </div>
        </div>
    </section>

    <!-- What We Offer Section -->
    <section class="bg-gradient-to-r from-blue-200 via-green-200 to-purple-200 animated-gradient py-12 rounded-lg shadow-md text-center">
        <h2 class="text-4xl font-extrabold text-gray-800 mb-6">What We Offer</h2>
        <p class="text-gray-700 max-w-3xl mx-auto leading-relaxed text-lg">
            From must-have electronics to the latest fashion finds, Evermart has it all. We partner with trusted suppliers to bring you top-quality products, delivered fast and affordably.
        </p>
    </section>

    <!-- Why Shop With Us Section -->
    <section class="text-center">
    <h2 class="text-4xl font-extrabold text-gray-800 mb-6">Why Shop With Us?</h2>
    <ul class="list-none space-y-4 text-gray-700 leading-relaxed mx-auto w-3/4 sm:w-1/2 text-lg">
        <li class="bg-white p-4 rounded-lg shadow-md hover:bg-gray-300 flex items-center">
            <i class="fas fa-shipping-fast text-gray-600 mr-3"></i>
            <strong>Fast Shipping:</strong> Lightning-fast delivery to your door.
        </li>
        <li class="bg-white p-4 rounded-lg shadow-md hover:bg-gray-300 flex items-center">
            <i class="fas fa-headset text-gray-600 mr-3"></i>
            <strong>24/7 Support: </strong> We're here for you around the clock.
        </li>
        <li class="bg-white p-4 rounded-lg shadow-md hover:bg-gray-300 flex items-center">
            <i class="fas fa-lock text-gray-600 mr-3"></i>
            <strong>Secure Payments: </strong> Safe and reliable checkout options.
        </li>
        <li class="bg-white p-4 rounded-lg shadow-md hover:bg-gray-300 flex items-center">
            <i class="fas fa-smile text-gray-600 mr-3"></i>
            <strong>Satisfaction : </strong> Shop with confidence, we've got your back.
        </li>
        
    </ul>
</section>

    <!-- Customer Testimonials Section -->
    <section class="text-center">
    <h2 class="text-4xl font-extrabold text-gray-800 mb-6">What Our Customers Say</h2>
    
    <!-- Flexbox container for the divs -->
    <div class="flex justify-between space-x-4 max-w-7xl mx-auto">
        
        <!-- First Review -->
        <div class="bg-gray-100 p-8 rounded-lg shadow-lg w-1/3">
            <p class="text-gray-700 italic text-lg">"Shopping at Evermart was a breeze! The product variety is fantastic, and delivery was super fast."</p>
            <p class="text-right text-gray-600 mt-4">— Jane D.</p>
        </div>

        <!-- Second Review -->
        <div class="bg-gray-100 p-8 rounded-lg shadow-lg w-1/3">
            <p class="text-gray-700 italic text-lg">"Great customer service and amazing products! Will definitely shop again."</p>
            <p class="text-right text-gray-600 mt-4">— John S.</p>
        </div>

        <!-- Third Review -->
        <div class="bg-gray-100 p-8 rounded-lg shadow-lg w-1/3">
            <p class="text-gray-700 italic text-lg">"Affordable prices and great product quality! I recommend Evermart to everyone."</p>
            <p class="text-right text-gray-600 mt-4">— Sarah W.</p>
        </div>

    </div>
</section>
    
</main>

	
<!-- Footer -->
	<jsp:include page="../includes/footer.jsp" />
<script src="/ecommerce/components/js/script.js"></script>
</body>

</html>

