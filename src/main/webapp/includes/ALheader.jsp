<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.company.modal.*" %>
<%@ page import="com.company.dao.ProductDao" %>
<%@ page import="java.sql.Connection" %>
<%@page import="com.company.connection.DbCon"%>
<%
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	List<Cart> cartProduct = null;
	if (cart_list != null) {
		Connection conn = DbCon.getConnection();
		ProductDao pDao = new ProductDao(conn);
		request.setAttribute("conn", conn);
		cartProduct = pDao.getCartProducts(cart_list);
		double total = pDao.getTotalCartPrice(cart_list);
		request.setAttribute("total", total);
		request.setAttribute("cart_list", cart_list);
	}
%>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<nav class="bg-gray-800 p-4">
    <div class="container mx-auto flex justify-between items-center">
        <a href="#" class="text-white text-2xl font-bold">Evermart</a>
        <div class="flex space-x-4">
            <a href="home.jsp" class="text-gray-300 hover:text-white">Home</a>
            <a href="shop.jsp" class="text-gray-300 hover:text-white">Shop</a>
            <a href="orders.jsp" class="text-gray-300 hover:text-white">Orders</a>
            <a href="myprofile.jsp" class="text-gray-300 hover:text-white">MyProfile</a>
            <a href="about.jsp" class="text-gray-300 hover:text-white">About</a>
            <a href="contact.jsp" class="text-gray-300 hover:text-white">Contact</a>
            <!-- Cart Button -->
            <button id="cartButton" class="text-white bg-yellow-500 hover:bg-yellow-600 focus:ring-4 focus:outline-none focus:ring-yellow-300 font-medium rounded-lg text-sm px-5 py-2.5 dark:bg-yellow-600 dark:hover:bg-yellow-700 dark:focus:ring-yellow-800" type="button">
                  <i class="fas fa-shopping-cart"></i><span class="bg-red-600 text-white text-xs font-medium px-2.5 py-0.5 rounded-full">${cart_list != null ? cart_list.size() : 0}</span>
                
            </button>
            <!-- Sign Out Button -->
            <a href="../user-logout"id="signout-btn" class="text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-800" type="button">
                Sign Out
            </a>
        </div>
    </div>
</nav>

<!-- Background Overlay -->
<div id="backgroundOverlay" class="hidden fixed inset-0 bg-black bg-opacity-50 backdrop-blur-sm z-10"></div>

<!-- Cart Popup -->
<div id="cartPopup" class="hidden absolute right-0 mt-2 w-75 bg-white border border-gray-200 rounded-lg shadow-lg overflow-hidden mr-4 z-10">
    <div class="p-4 h-[400px] overflow-y-scroll ">
        <!-- Product Item -->
        <%
        	if(cart_list != null){
        		for(Cart c: cartProduct){
        %>
        
        			<form method="post" action="../make-order-now" class="flex items-center justify-between space-x-4 mb-4">
        				<input type="hidden" name="cpID" value="<%= c.getId()%>">
        			    <img class="w-12 h-12 object-cover" src="../components/images/products/<%= c.getImage() %>" alt="Product Image">
        			    <div class="flex-1">
        			        <h3 class="font-medium text-gray-800"><%= c.getName() %></h3>
        			        
        			        <div class="flex items-center space-x-2 mt-2">
        			            <span class="text-sm text-gray-500"><%= dcf.format(c.getPrice() / c.getQuantity() ) %></span>
        			            <span class="text-sm text-gray-800 font-semibold">Total: <%= dcf.format(c.getPrice()) %></span>
        			        </div>
        			    </div>
        			    <div class="flex items-center space-x-2">
        			        <a href="../qty-inc-dec?action=dec&id=<%= c.getId() %>" class="bg-gray-300 text-gray-800 px-2 py-1 rounded">-</a>
        			        <input type="text" name="cpQty" class="font-medium w-5" value="<%= c.getQuantity() %>" readonly>
        			        <a href="../qty-inc-dec?action=inc&id=<%= c.getId() %>" class="bg-gray-300 text-gray-800 px-2 py-1 rounded">+</a>
        			    </div>
        			    <a class="text-red-600 font-bold" href="../rm-from-cart?id=<%=c.getId() %>">Remove</a>
       			 		<input type="submit" class="text-blue-600 font-bold" value="Buy">
        			</form>

        			<hr class="my-4">
		<%		
        		}
        	}
        %>
		<div class="flex justify-between items-center">
			<p class="text-gray-800 font-semibold">Sub Total:</p>
            <p class="text-gray-800 font-semibold">LKR ${total != null ? dcf.format(total) : 0}</p>
		</div>
    </div>

    <div class="p-4 bg-gray-100">
        <a href="../cart-all-products-chekout" class="w-full py-2 mb-2 bg-blue-600 text-white font-semibold rounded-md">Checkout</a>
        <a href="../empty-cart" class="w-full py-2 bg-red-600 text-white font-semibold rounded-md">Empty Cart</a>
    </div>
</div>

<script src="../components/js/ALscript.js"></script>
