<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="java.text.DecimalFormat" %>
<%@page import="com.company.connection.DbCon"%>
<%@page import="com.company.modal.*"%>
<%@page import="com.company.dao.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
</head>
<body class="bg-gray-100">

	<!-- Background Overlay -->
	<div id="bg-overlay" class="hidden fixed inset-0 bg-black bg-opacity-50 backdrop-blur-sm z-10"></div>
    <%
        if (session.getAttribute("user") != null) {
    %><jsp:include page="../includes/ALheader.jsp" /> <% 
        } else {
            response.sendRedirect("home.jsp");
            return;
        }
    %>
    <%
        User u = (User) request.getSession().getAttribute("user");
    %>
    <!-- Profile Section -->
    <section class="py-16 bg-gray-100">
        <div class="container mx-auto px-4">
            <div class="bg-white rounded-lg shadow-lg z-50 p-6 max-w-4xl mx-auto">
                <div class="flex flex-col md:flex-row items-center md:items-start">
                    <!-- Profile Picture -->
                    <div class="w-48 h-48 bg-gray-200 rounded-full overflow-hidden mb-6 md:mb-0 md:mr-8 shadow">
                        <img src="/ecommerce/components/images/users/<%= u.getImage() %>" alt="Profile Picture" class="w-full h-full object-cover">
                    </div>
                    <!-- User Information -->
                    <div class="md:flex-1">
                        <form method="post" action="/ecommerce/user-edit-info" enctype="multipart/form-data">
                        	<input type="hidden" name="userID" value="<%= u.getId() %>">
                            <h1 class="text-4xl font-bold mb-2 text-gray-800"><%= u.getfName() %> <%= u.getlName() %></h1>
                            <p class="text-gray-500 mb-4">Joined: 
                               <%=u.getRegisteredDate() %>
                            </p>
                            <p class="text-gray-700 mb-4">Email: 
                                <input class="toggle-readonly" type="email" name="email" value="<%= u.getEmail() %>" class="border border-gray-300 rounded-lg px-2 py-1 w-full" readonly/>
                            </p>
                            <p class="text-gray-700 mb-4">Phone Number: 
                                <input class="toggle-readonly" type="tel" name="phone" value="<%= u.getPhone() %>" class="border border-gray-300 rounded-lg px-2 py-1 w-full" readonly/>
                            </p>
                            <p class="text-gray-700 mb-4">Address: 
                                <input class="toggle-readonly" type="text" name="address" value="<%= u.getAddress() %>" class="border border-gray-300 rounded-lg px-2 py-1 w-full" readonly/>
                            </p>
							
							<p id="profile-pic-up" class="hidden text-gray-700 mb-4">New profile picture: 
                                <input class="toggle-readonly" type="file" name="profile-pic" class="border border-gray-300 rounded-lg px-2 py-1 w-full" readonly/>
                            </p>
                            <!-- Profile Actions -->
                            <div class="space-y-2 mb-4">
							    <button id="edit-profile-btn" class="block w-full text-center bg-blue-500 text-white py-2 px-4 rounded-lg hover:bg-blue-600">Edit Profile</button>
							    <input type="submit" id="save-changes-btn" class="hidden block w-full text-center bg-green-600 text-white py-2 px-4 rounded-lg hover:bg-green-700" value="Save changes">
							    <button id="change-pw-btn" class="block w-full text-center bg-yellow-500 text-white py-2 px-4 rounded-lg hover:bg-yellow-600">Change Password</button>
							</div>
                        </form>
                    </div>
                </div>
                <div class="mt-10">
    <!-- Card Container -->
    <div class="grid grid-cols-1 sm:grid-cols-2 gap-6">
        
        <!-- My Wish-list Card -->
        <div class="bg-white shadow-lg rounded-lg p-6 flex flex-col items-center justify-center hover:shadow-xl transition-shadow duration-300">
            <div class="text-red-500 mb-4">
                <i class="fas fa-heart fa-3x"></i> <!-- Heart icon for Wishlist -->
            </div>
            <h3 class="text-xl font-bold text-gray-900 mb-2">My Wishlist</h3>
            <p class="text-gray-600">View and manage your favorite products.</p>
            <button id="wishlist-open-btn" class="mt-4 bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">
                Open Wish-list
            </button>
        </div>
        
        <!-- My Contacts Card -->
        <div class="bg-white shadow-lg rounded-lg p-6 flex flex-col items-center justify-center hover:shadow-xl transition-shadow duration-300">
            <div class="text-green-500 mb-4">
                <i class="fas fa-address-book fa-3x"></i> <!-- Address book icon for Contacts -->
            </div>
            <h3 class="text-xl font-bold text-gray-900 mb-2">My Contacts</h3>
            <p class="text-gray-600">Manage your saved contact information.</p>
            <a href="/ecommerce/my-contacts" class="mt-4 bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700">
                Go to Contacts
            </a>
        </div>
        
    </div>
</div>

                <div class="flex justify-center mt-6 px-4">
                    <a href="../delete-user?id=<%= u.getId() %>" class="bg-red-600 text-white py-2 px-4 rounded-lg hover:bg-red-700 w-max">Delete Account</a>
                </div>
            </div>
        </div>
    </section>
<!-- change password modal -->
    <div id="changepw-modal" class="hidden fixed inset-0 z-10 flex items-center justify-center">
    <div class="bg-white p-6 rounded-lg shadow-md max-w-sm w-full relative">
        <form method="post" action="/ecommerce/user-change-password">
            <!-- Close Button inside the form -->
            <button type="button" class="absolute top-2 right-2 text-gray-400 hover:text-gray-600" id="chpwModal-close-btn">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                </svg>
            </button>
            <h2 class="text-2xl font-semibold mb-4">Change Password</h2>
            <input type="hidden" name="userID" value="<%= u.getId()%>">
            <div class="mb-4">
                <label for="chpw-email" class="block text-sm font-medium text-gray-700">Email</label>
                <input type="email" name="chpw-email" id="chpw-email" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-500 focus:ring-opacity-50" placeholder="name@company.com">
            </div>
            <div class="mb-4">
                <label for="chpw-old-password" class="block text-sm font-medium text-gray-700">Current password</label>
                <input type="password" name="chpw-old-password" id="chpw-old-password" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-500 focus:ring-opacity-50" placeholder="••••••••">
            </div>
            <div class="mb-4">
                <label for="chpw-password" class="block text-sm font-medium text-gray-700">New password</label>
                <input type="password" name="chpw-password" id="chpw-password" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-500 focus:ring-opacity-50" placeholder="••••••••">
            </div>
            <div class="mb-4">
                <label for="chpw-cnfrm-pwd" class="block text-sm font-medium text-gray-700">Confirm New password</label>
                <input type="password" id="chpw-cnfrm-pwd" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-500 focus:ring-opacity-50" placeholder="••••••••">
            </div>
            <button id="update-pw-btn" type="submit" class="w-full bg-blue-700 text-white py-2 rounded-md hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-300">Update Password</button>
        </form>
    </div>
</div>
	
<!-- wishlist modal -->

	<%
		WishlistDao wlDao = new WishlistDao(DbCon.getConnection());
		ProductDao pDao = new ProductDao(DbCon.getConnection());
		List<WishlistItem>  wishlistItems = wlDao.getAllWishlistItems(u.getId());
		DecimalFormat dcf = new DecimalFormat("###,###,###.##");
		request.setAttribute("dcf", dcf);
	%>
	<div id="wishlist-popup" class="hidden fixed inset-0 flex justify-center items-center z-10">
	    <!-- Popup-Card -->
	    <div class="bg-white rounded-lg shadow-lg max-h-screen overflow-y-auto p-6 relative">
	        
	        <!-- Close Button -->
	        <button type="button" class="absolute top-2 right-2 text-gray-400 hover:text-gray-600" id="wishlist-close-btn">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                </svg>
            </button>
	        
	        <!-- wish-list Title -->
	        <h2 class="text-2xl font-bold text-gray-900 mb-4 text-center">My Wishlist</h2>
	        
	        <!-- wish list Item-->
	        <%
		        if (!wishlistItems.isEmpty()) {
					for (WishlistItem wl : wishlistItems) {
						Product p = pDao.getSingleProduct(wl.getId());

	        %>
	        <div class="bg-gray-50 shadow-md p-1 pr-2 mb-2 rounded-lg">
	        	<div class="flex items-center justify-between space-x-4 mb-4">
	                <img class="w-12 h-12 object-cover" src="/ecommerce/components/images/products/<%= p.getImage() %>" alt="Product Image">
	                <div class="flex-1">
	                    <h3 class="font-medium text-gray-900"><%=p.getName() %></h3>
	                    <div class="flex items-center space-x-2 mt-2">
	                        <span class="text-sm text-gray-600"><%=dcf.format(p.getPrice()) %></span>
	                        <span class="text-sm text-gray-900 font-semibold"><%=dcf.format(p.getPrice() * wl.getWLquantity()) %></span>
	                    </div>
	                </div>
	                <div class="flex items-center space-x-2">
	                    <a href="/ecommerce/qty-inc-dec?action=dec&id=productID" 
	                       class="bg-gray-200 text-gray-900 font-bold hover:bg-gray-400 hover:text-white px-3 py-1 rounded transition ease-in-out duration-300">-</a>
	                    <input type="text" name="cpQty" class="font-medium w-6 text-center text-gray-900" value="2" readonly>
	                    <a href="/ecommerce/qty-inc-dec?action=inc&id=productID" 
	                       class="bg-gray-200 text-gray-900 font-bold hover:bg-gray-400 hover:text-white px-3 py-1 rounded transition ease-in-out duration-300">+</a>
	                </div>
	                <a href="/ecommerce/user-remove-from-wishlist?prID=<%=wl.getId() %>" 
	                   class="bg-gray-200 text-red-500 font-bold hover:bg-red-500 hover:text-white px-2 py-1 rounded transition ease-in-out duration-300"><i class="fas fa-trash"></i>
	                </a>
	                <a href="/ecommerce/add-to-cart?id=<%= p.getId() %>&quantity=<%=wl.getWLquantity() %>"
	                	class="bg-blue-100 text-blue-600 font-bold hover:bg-blue-600 hover:text-white px-4 py-1 rounded cursor-pointer transition ease-in-out duration-300" >
	                       <i class="fas fa-cart-plus"></i>
					</a>
	            </div>
	        </div>
	        <%
						}
			        }
	        %>
	    </div>
	</div>
	
    <%@ include file="../includes/footer.jsp" %>
    <script src="/ecommerce/components/js/userprofile.js"></script>
    <%@ include file="../includes/alert.jsp" %>
</body>
</html>
