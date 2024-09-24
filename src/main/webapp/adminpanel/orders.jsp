<%@page import="java.util.List"%>
<%@page import="com.company.dao.*"%>
<%@page import="com.company.connection.DbCon"%>
<%@page import="com.company.modal.*"%>
	
<jsp:include page="includes/headernav.jsp" />

    <!-- content goes here -->
<%
    OrderDao odao = new OrderDao(DbCon.getConnection());
    List<Order> orders = odao.getAllOrders();
    	
%>
    <main class="flex-grow p-6">
    	<h2 class="text-2xl font-semibold text-gray-800 mb-6">Orders</h2>
        <!-- Order Cards Container -->
		<div class="overflow-y-auto" style="max-height: 750px;">
        <%
			if (!orders.isEmpty()) {
				for (Order o : orders) {
			    	UserDao udao = new UserDao(DbCon.getConnection());
			    	User u = udao.getUserByID(o.getUid());
		%>
        		<!-- Order Card -->
		            <div class="bg-gray-100 hover:bg-gray-300 p-6 rounded-lg shadow-md flex justify-between items-start space-x-4 my-1">
					    <!-- Order Image -->
		    			<div class="w-20 h-20 rounded-lg flex justify-center items-center">
		        			<img src="../components/images/products/<%=o.getImage()%>" class="max-w-full max-h-full rounded-lg object-contain">
		    			</div>
		
		    			<!-- Order Info -->
						<div class="w-1/4">
		    				<p><span class="font-semibold">Order ID:</span> #<%= o.getOrderId() %></p>
		    			    <p><span class="font-semibold">Order Date:</span> <%= o.getDate() %></p>
		    			    <p><span class="font-semibold">Quantity:</span> <%= o.getQunatity() %></p>
		    			    <p><span class="font-semibold">Status:</span> <%= o.getStatus() %></p>
		    			</div>
		
						<!-- User Info -->
						<div class="w-1/4">
						<p><span class="font-semibold">User Name:</span> <%=u.getfName() %> <%=u.getlName() %></p>
					        <p><span class="font-semibold">Email:</span> <%=u.getEmail() %> </p>
					        <p><span class="font-semibold">Phone:</span> <%=u.getPhone() %></p>
					        <p><span class="font-semibold">Address:</span> 123 Main St</p>
					    </div>
		
						<!-- Product Info -->
					    <div class="w-1/4">
					        <p><span class="font-semibold">Product Name:</span> <%=o.getName() %></p>
					        <p><span class="font-semibold">Unit Price:</span> <%=o.getPrice() %></p>
					        <p><span class="font-semibold">Total Price:</span> LKR <%=o.getPrice() * o.getQunatity() %></p>
					    </div>
						
		    			<!-- Actions (Cancel and Deliver Buttons) -->
		    			<div class="flex flex-col space-y-2 w-20">
		    			    <a href="../admin-deliver-order?id=<%= o.getOrderId() %>" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600">Deliver</a>
		    			    <a href="../admin-cancel-order?id=<%= o.getOrderId() %>" class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600">Cancel</a>
		    			</div>
					</div>
            
        <%
				}
			}
        %>
        </div>
    </main>
    <!-- content goes here  -->
    
    <%@ include file="../includes/alert.jsp" %>
<%@ include file="./includes/ending.jsp" %>