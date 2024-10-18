<%@page import="java.util.List"%>
<%@page import="com.company.dao.*"%>
<%@page import="com.company.connection.DbCon"%>
<%@page import="com.company.modal.*"%>
 <%@ page import="java.text.DecimalFormat" %>
<jsp:include page="includes/headernav.jsp" />

    <!-- content goes here -->
<%
	if(session.getAttribute("admin") == null) {
	    response.sendRedirect("adminIndex.jsp");
	    return;
	}
    OrderDao odao = new OrderDao(DbCon.getConnection());
    List<Order> reviewedOrders = odao.getAllOrdersByStatus("Reviewed");
    List<Order> acceptedOrders = odao.getAllOrdersByStatus("Accepted");
    reviewedOrders.addAll(acceptedOrders);
    DecimalFormat dcf = new DecimalFormat("###,###.##");
	request.setAttribute("dcf", dcf);
    	
%>
    <main class="flex-grow p-6">
    	<h2 class="text-2xl font-semibold text-gray-800 mb-6">Accepted Orders</h2>
        <!-- Order Cards Container -->
		<div class="overflow-y-auto" style="max-height: 750px;">
        <%
			if (!reviewedOrders.isEmpty()) {
				for (Order o : reviewedOrders) {
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
		    			    <p><span class="font-semibold text-red-600">Review:</span> <span class="text-blue-600"><%= o.getMsg() %></span></p>
		    			</div>
		
						<!-- User Info -->
						<div class="w-1/4">
						<p><span class="font-semibold">User Name:</span> <%=u.getfName() %> <%=u.getlName() %></p>
					        <p><span class="font-semibold">Email:</span> <%=u.getEmail() %> </p>
					        <p><span class="font-semibold">Phone:</span> <%=u.getPhone() %></p>
					        <p><span class="font-semibold">Address:</span><%=u.getAddress() %></p>
					    </div>
		
						<!-- Product Info -->
					    <div class="w-1/4">
					        <p><span class="font-semibold">Product Name:</span> <%=o.getName() %></p>
					        <p><span class="font-semibold">Unit Price:</span> <%=dcf.format(o.getPrice()) %></p>
					        <p><span class="font-semibold">Total Price:</span> LKR <%=dcf.format(o.getPrice() * o.getQunatity())%></p>
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