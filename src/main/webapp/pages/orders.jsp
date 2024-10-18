<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.company.dao.*"%>
<%@page import="com.company.modal.*"%>
<%@page import="com.company.connection.*"%>
<%@ page import="java.text.DecimalFormat" %>
<% 
	DecimalFormat dcf = new DecimalFormat("###,###,###.##");
	request.setAttribute("dcf", dcf);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Evermart-My Orders</title>
<%@ include file="../includes/imports.jsp" %>
</head>
<body>
    <%
        if (session.getAttribute("user") != null) {
        	
    %><jsp:include page="../includes/ALheader.jsp" /> <% 

        } else {
            response.sendRedirect("home.jsp");
            return;
        }
    %>
    
<div class="container mx-auto p-4">
    <h1 class="text-3xl font-bold text-center mb-8">Your Orders</h1>
    
    <!-- Order Item -->
    <%
		List<Order> orders = null;
		User u = (User) request.getSession().getAttribute("user");
   	 	OrderDao orderDao  = new OrderDao(DbCon.getConnection());
		orders = orderDao.userOrders(u.getId());
			if(orders != null){
				for(Order o:orders){
	%>
				
				<div class="bg-gray-100 hover:bg-gray-300 shadow-md rounded-lg p-4 mb-2">
				    <div class="flex items-center justify-between">
				    		
				        <!-- Product Image -->
				        <div class="w-1/5">
				            <img src="../components/images/products/<%=o.getImage() %>" alt="Product Image" class="w-20 h-20 object-cover rounded-md">
				        </div>
				
				        <!-- Product Details -->
				        <div class="ml-2 w-2/6">
				            <h2 class="text-lg font-semibold"><%=o.getName() %></h2>
				            
				            <!-- Order Date -->
				            <p class="text-sm text-gray-400">Placed on: <%=o.getDate() %></p>
				            <p class="text-sm text-gray-400">Status: <%=o.getStatus() %></p>
				        </div>
				
				        <!-- Quantity -->
				        <div class="w-1/6 text-center">
				            <span class="text-lg font-semibold"><%=o.getQunatity() %></span>
				        </div>
				
				        <!-- Unit Price -->
				        <div class="w-1/6 text-center">
				            <span class="text-lg font-semibold"><%=dcf.format(o.getPrice())%></span>
				        </div>
				
				        <!-- Total Price -->
				        <div class="w-1/6 text-center">
				            <span class="text-lg font-semibold"><%= dcf.format(o.getPrice() * o.getQunatity()) %></span>
				        </div>
				
				        <!-- Actions -->
				        <div class="w-1/6 text-center">
				        	<%
				        		if(o.getStatus().equals("pending")){
				        	%>
				        		<a class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600" href="../cancel-order?id=<%= o.getOrderId()%>">Cancel</a>
				        	<%
				        		}
				        	%>
				        	<%
				        		if(o.getStatus().equals("Delivered")){
				        	%>
				        		<a class="bg-blue-500 text-white px-4 py-2 rounded-lg hover:bg-blue-600" href="../accept-order?id=<%= o.getOrderId()%>">Accept</a>
				        		<a id="reject-btn" class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600" href="/ecommerce/pages/orders.jsp?orderId=<%= o.getOrderId()%>&action=reject">Reject</a>
				        	<%
				        		}
				        	%>
				        	<%
				        		if(o.getStatus().equals("Accepted")){
				        	%>
				        		<a id="review-btn" class="bg-blue-200 text-blue-800 px-4 py-2 rounded-lg hover:bg-blue-300" href="/ecommerce/pages/orders.jsp?orderId=<%= o.getOrderId()%>&action=review">Review</a>
				        	<%
				        		}
				        	%>
				        	<%
				        		if(o.getStatus().equals("Rejected")){
				        	%>
				        		<span class="border border-red-600 text-red-600 font-semibold px-4 py-2 rounded-full">Rejected</span>

				        	<%
				        		}
				        	%>
				        	<%
				        		if(o.getStatus().equals("Reviewed")){
				        	%>
				        		<span class="border border-blue-600 text-blue-600 font-semibold px-4 py-2 rounded-full">Reviewed</span>

				        	<%
				        		}
				        	%>
				            
				        </div>
				    </div>
				</div>
				
				    
	<%
				}
			}
	%>
				
</div>


<!-- Review Or Reject order modal -->
<%
    String orderId = request.getParameter("orderId");

    if (orderId != null && !orderId.isEmpty()) {
        int convertedOID = Integer.parseInt(orderId);
    }
%>


<div id="reviewCancel-modal" class="hidden fixed inset-0 z-50 flex items-center justify-center bg-gray-800 bg-opacity-50">
	
	<div class="bg-white p-6 rounded-lg shadow-md max-w-sm w-full relative">
		<form id="review-order-form" class="hidden" method="post" action="/ecommerce/review-order">
			<!-- Close Button inside the form -->
			<button type="button" class="absolute top-2 right-2 text-gray-400 hover:text-gray-600" id="review-close-btn">
				<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
					<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
			    </svg>
	        </button>
	        <h2 class="text-2xl font-semibold mb-4">Review Product</h2>
	        <input type="hidden" name="id" value="<%=orderId%>">
			<div class="mb-4">
				<label for="message" class="block mb-2 text-sm font-medium text-gray-900">Your Review</label>
		    	<textarea id="message" name="message" rows="4" placeholder="Enter your messege" class="p-1 mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-500 focus:ring-opacity-50" placeholder="Write your message here..." required></textarea>
        	</div>
		            
			<button type="submit" class="w-full bg-blue-700 text-white py-2 rounded-md hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-300">Send Review <i class="ml-1 fas fa-paper-plane"></i></button>
		</form>
		
		<!-- canceled reason form -->
		<form id="canel-order-form" class="hidden" method="post" action="/ecommerce/reject-order">
			<!-- Close Button inside the form -->
			<button type="button" class="absolute top-2 right-2 text-gray-400 hover:text-gray-600" id="cancel-close-btn">
				<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
					<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
			    </svg>
	        </button>
	        <h2 class="text-2xl font-semibold mb-4">Reject Product</h2>
	        <input type="hidden" name="id" value="<%=orderId%>">
			<div class="mb-4">
				<label for="message" class="block mb-2 text-sm font-medium text-gray-900">Reason</label>
		    	<textarea id="message" name="message" rows="2" placeholder="Enter your messege" class="p-1 mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-500 focus:ring-opacity-50" placeholder="Write your message here..." required></textarea>
        	</div>
		            
			<button type="submit" class="w-full bg-red-700 text-white py-2 text-center rounded-md hover:bg-red-800 focus:outline-none focus:ring-4 focus:ring-red-300">Reject Order</a>
		</form>
	</div>
</div>
<script src="../components/js/orders.js"></script>
<%@ include file="../includes/alert.jsp" %>
</body>
</html>
