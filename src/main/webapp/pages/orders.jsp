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
<title>Insert title here</title>
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
		// conn = request.getSesssion().getAttribute("conn");
   	 	OrderDao orderDao  = new OrderDao(DbCon.getConnection());
		orders = orderDao.userOrders(u.getId());
			if(orders != null){
				for(Order o:orders){%>

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

        <!-- Cancel Order -->
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
        		<a class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600" href="../reject-order?id=<%= o.getOrderId()%>">Reject</a>
        	<%
        		}
        	%>
        	<%
        		if(o.getStatus().equals("Accepted")){
        	%>
        		<a class="bg-blue-200 text-blue-800 px-4 py-2 rounded-lg hover:bg-blue-300" href="">Review</a>
        	<%
        		}
        	%>
        	<%
        		if(o.getStatus().equals("Rejected")){
        	%>
        		<a class="bg-red-200 text-red-800 px-4 py-2 rounded-lg hover:bg-red-300" href="">Reason</a>
        	<%
        		}
        	%>
            
        </div>
    </div>
</div>

    
<%}
			}
			%>

</div>

<%@ include file="../includes/alert.jsp" %>
</body>
</html>
