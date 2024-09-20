<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.company.dao.*"%>
<%@page import="com.company.modal.*"%>
<%@page import="com.company.connection.*"%>
<% %>
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

<div class="bg-white shadow-md rounded-lg p-4 mb-6">
    <div class="flex items-center justify-between">
        <!-- Product Image -->
        <div class="w-1/5">
            <img src="../components/images/products/<%=o.getImage() %>" alt="Product Image" class="w-full h-auto rounded-md">
        </div>

        <!-- Product Details -->
        <div class="ml-2 w-2/6">
            <h2 class="text-lg font-semibold"><%=o.getName() %></h2>
            
            <!-- Order Date -->
            <p class="text-sm text-gray-400">Placed on: <%=o.getDate() %></p>
        </div>

        <!-- Quantity -->
        <div class="w-1/6 text-center">
            <span class="text-lg font-semibold"><%=o.getQunatity() %></span>
        </div>

        <!-- Unit Price -->
        <div class="w-1/6 text-center">
            <span class="text-lg font-semibold"><%=o.getPrice() %></span>
        </div>

        <!-- Total Price -->
        <div class="w-1/6 text-center">
            <span class="text-lg font-semibold"><%= o.getPrice() * o.getQunatity() %></span>
        </div>

        <!-- Cancel Order -->
        <div class="w-1/6 text-center">
            <a class="bg-red-500 text-white px-4 py-2 rounded-lg hover:bg-red-600" href="../cancel-order?id=<%= o.getOrderId()%>">
                Cancel
            </a>
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
