<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.company.modal.User"%>
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
	User u = (User) request.getSession().getAttribute("user");
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

    <!-- Main Content -->
    <main class="container mx-auto px-4 py-8">
        <!-- Contact Us Section -->
        <section>
            <h2 class="text-2xl font-semibold mb-4">Contact Us</h2>
            <p class="text-gray-700 mb-4">If you have any questions or need further information, please fill out the form below, and we will get back to you as soon as possible.</p>
            <form class="space-y-6" action="#" method="post">
                <div>
                    <label for="name" class="block mb-2 text-sm font-medium text-gray-900">Your Name</label>
                    <input type="text" name="name" id="name" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" placeholder="Enter your full name (Eg: Nirmal Perera)" required />
                </div>
                <div>
                    <label for="email" class="block mb-2 text-sm font-medium text-gray-900">Your Email</label>
                    <input type="email" name="email" id="email" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" placeholder="Enter email (Eg: somone@example.com)" required />
                </div>
                <div>
                    <label for="inquiry" class="block mb-2 text-sm font-medium text-gray-900">Type of Inquiry</label>
                    <select id="inquiry" name="inquiry" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" required>
                        <option value="" disabled selected>Select an option</option>
                        <option value="report_issue">Report an Issue</option>
                        <option value="seek_assistance">Seek Assistance</option>
                        <option value="feedback_suggestion">Give Feedback and Suggestion</option>
                        <option value="feedback_suggestion">Other</option>
                    </select>
                </div>
                <div>
                    <label for="message" class="block mb-2 text-sm font-medium text-gray-900">Your Message</label>
                    <textarea id="message" name="message" rows="4" placeholder="Enter your messege" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full p-2.5" placeholder="Write your message here..." required></textarea>
                </div>
                
                <input type="submit" class="w-full text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center" value="Send Messege">
            </form>
        </section>
        
        <!-- Contact Details Section -->
        <section class="mt-8">
            <h2 class="text-2xl font-semibold mb-4">Contact Details</h2>
            <p class="text-gray-700 mb-4">You can reach us through the following methods:</p>
            <ul class="list-disc pl-5 space-y-2">
                <li><a href="mailto:nirmalperera2509@gmail.com" class="text-blue-600 hover:underline">Email: nirmalperera2509@gmail.com</a></li>
                <li><a href="tel:+94758908057" class="text-blue-600 hover:underline">Phone: +(94) 75-890-8057</a></li>
            </ul>
            <div class="mt-6">
                <h3 class="text-xl font-semibold mb-2">Our Location</h3>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2515.8288272373475!2d79.97083648632363!3d6.9149656992774435!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae256db1a6771c5%3A0x2c63e344ab9a7536!2sSri%20Lanka%20Institute%20of%20Information%20Technology!5e0!3m2!1sen!2slk!4v1723538292848!5m2!1sen!2slk" width="100%" height="800" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </div>
        </section>
    </main>

    <!-- Footer -->
<jsp:include page="../includes/footer.jsp" />

    <script src="/ecommerce/components/js/script.js"></script>
</body>
</html>
