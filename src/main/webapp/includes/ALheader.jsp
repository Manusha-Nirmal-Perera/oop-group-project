<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="com.company.modal.*" %>
<%@ page import="com.company.dao.*" %>
<%@ page import="java.sql.Connection" %>
<%@page import="com.company.connection.DbCon"%>
<%
	DecimalFormat dcf = new DecimalFormat("###,###,###.##");
	request.setAttribute("dcf", dcf);

	User u = (User) request.getSession().getAttribute("user");
	OrderDao odao = new OrderDao(DbCon.getConnection());
	int noOfOrders = odao.getUserOrderCount(u.getId());
	
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
            <a id="home-nav" href="/ecommerce/pages/home.jsp" class="text-gray-300 hover:text-white">Home</a>
            <a id="shop-nav" href="/ecommerce/pages/shop.jsp" class="text-gray-300 hover:text-white">Shop</a>
            <a id="orders-nav" href="/ecommerce/pages/orders.jsp" class="text-gray-300 hover:text-white">Orders <span class="bg-red-600 text-white text-xs font-medium px-2.5 py-0.5 rounded-full"><%=noOfOrders%></span></a>
            <a id="myprofile-nav" href="/ecommerce/pages/myprofile.jsp" class="text-gray-300 hover:text-white">MyProfile</a>
            <a id="about-nav" href="/ecommerce/pages/about.jsp" class="text-gray-300 hover:text-white">About</a>
            <a id="contact-nav" href="/ecommerce/pages/contact.jsp" class="text-gray-300 hover:text-white">Contact</a>
            <!-- Cart Button -->
            <button id="cartButton" class="text-white bg-yellow-500 hover:bg-yellow-600 focus:ring-4 focus:outline-none focus:ring-yellow-300 font-medium rounded-lg text-sm px-5 py-2.5 dark:bg-yellow-600 dark:hover:bg-yellow-700 dark:focus:ring-yellow-800" type="button">
                  <i class="fas fa-shopping-cart"></i> <span class="bg-red-600 text-white text-xs font-medium px-2.5 py-0.5 rounded-full">${cart_list != null ? cart_list.size() : 0}</span>
                
            </button>
            <!-- Sign Out Button -->
            <a href="/ecommerce/user-logout"id="signout-btn" class="text-white bg-red-700 hover:bg-red-800 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 dark:bg-red-600 dark:hover:bg-red-700 dark:focus:ring-red-800" type="button">
                Sign Out
            </a>
        </div>
    </div>
</nav>

<!-- Background Overlay -->
<div id="backgroundOverlay" class="hidden fixed inset-0 bg-black bg-opacity-50 backdrop-blur-sm z-10"></div>

<!-- Cart Popup -->
<div id="cartPopup" style="min-width: 750px;" class="hidden absolute right-0 mt-2 w-75 bg-white border border-gray-200 rounded-lg shadow-lg overflow-hidden mr-4 z-10"> 
    <div class="p-4 overflow-y-auto" style="max-height: 300px;">
        <!-- Product Item -->
        <%		
        	if(cart_list != null){
        		for(Cart c: cartProduct){
        %>
        <div class="bg-gray-50 shadow-md p-1 pr-2 mb-2 rounded-lg">
            <form method="post" action="/ecommerce/make-order-now" class="flex items-center justify-between space-x-4 mb-4">
                <input type="hidden" name="cpID" value="<%= c.getId()%>">
                <img class="w-12 h-12 object-cover" src="/ecommerce/components/images/products/<%= c.getImage() %>" alt="Product Image">
                <div class="flex-1">
                    <h3 class="font-medium text-gray-900"><%= c.getName() %></h3>
                    <div class="flex items-center space-x-2 mt-2">
                        <span class="text-sm text-gray-600"><%= dcf.format(c.getPrice() / c.getQuantity() ) %></span>
                        <span class="text-sm text-gray-900 font-semibold">Total: <%= dcf.format(c.getPrice()) %></span>
                    </div>
                </div>
                <div class="flex items-center space-x-2">
                    <a href="/ecommerce/qty-inc-dec?action=dec&id=<%= c.getId() %>" 
                       class="bg-gray-200 text-gray-900 font-bold hover:bg-gray-400 hover:text-white px-3 py-1 rounded transition ease-in-out duration-300">-</a>
                    <input type="text" name="cpQty" class="font-medium w-6 text-center text-gray-900" value="<%= c.getQuantity() %>" readonly>
                    <a href="/ecommerce/qty-inc-dec?action=inc&id=<%= c.getId() %>" 
                       class="bg-gray-200 text-gray-900 font-bold hover:bg-gray-400 hover:text-white px-3 py-1 rounded transition ease-in-out duration-300">+</a>
                </div>
                <a href="/ecommerce/rm-from-cart?id=<%=c.getId() %>" 
                   class="bg-gray-200 text-red-500 font-bold hover:bg-red-500 hover:text-white px-2 py-1 rounded transition ease-in-out duration-300">Remove</a>
                <input type="submit" 
                       class="bg-blue-100 text-blue-600 font-bold hover:bg-blue-600 hover:text-white px-4 py-1 rounded cursor-pointer transition ease-in-out duration-300" 
                       value="Buy">
            </form>
        </div>
	<%
        		}
        	}
	%>
    </div>
    
    <!-- Subtotal Section -->
	<div class="flex justify-between bg-gray-900 text-white rounded-md mx-4 p-2 shadow-lg mt-2">
        <p class="font-semibold">Sub Total:</p>
	    <p class="font-semibold">LKR ${total != null ? dcf.format(total) : 0}</p>
	</div>

    <!-- Checkout and Empty Cart Buttons -->
    <div class="p-4 bg-gray-100 flex justify-between">
    	<a href="/ecommerce/cart-all-products-chekout" 
       		class="w-1/2 p-2 bg-blue-600 hover:bg-blue-800 text-white font-semibold rounded-md mx-2 text-center">Checkout</a>
    	<a href="/ecommerce/empty-cart" 
    		class="w-1/2 p-2 bg-red-600 hover:bg-red-800 text-white font-semibold rounded-md mx-2 text-center">Empty Cart</a>
	</div>
	
</div>

<script src="/ecommerce/components/js/ALscript.js"></script>
