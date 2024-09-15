<%@page import="java.util.List"%>
<%@page import="com.company.dao.ProductDao"%>
<%@page import="com.company.connection.DbCon"%>
<%@page import="com.company.modal.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	ProductDao pd = new ProductDao(DbCon.getConnection());
	List<Product> products = pd.getAllProducts();
	
%>
	
	
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Online Store</title>
    <%@ include file="../includes/imports.jsp" %>
    <style>
        #recommendations {
            z-index: 10;
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
	

    <!-- Shop Section -->
    <section class="bg-white py-10">
        <div class="container mx-auto">
            <h2 class="text-3xl font-bold text-center text-gray-800 mb-10">Shop by Category</h2>

            <!-- Search Filters -->
            <div class="flex justify-between items-center mb-10">
                <!-- Keyword Search with Recommendations -->
                <div class="relative w-full max-w-xs">
                    <input type="text" placeholder="Search products..." class="w-full p-2 border border-gray-300 rounded-lg focus:outline-none focus:border-blue-600" id="keywordSearch">
                    <div id="recommendations" class="absolute mt-1 w-full bg-white border border-gray-300 rounded-lg shadow-lg hidden">
                        <!-- Recommendations will be inserted here dynamically -->
                    </div>
                </div>

                <!-- Filter by Category -->
                <div class="relative w-full max-w-xs">
                    <select class="w-full p-2 border border-gray-300 rounded-lg focus:outline-none focus:border-blue-600" id="filterByCategory">
                        <option value="">Filter by category</option>
                        <option value="kitchen-appliances">Kitchen Appliances</option>
                        <option value="light-wallpapers">Light Wallpapers</option>
                        <option value="tables">Tables</option>
                        <option value="beds">Beds</option>
                    </select>
                </div>

                <!-- Search Button -->
                <button id="searchBtn" class="bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700">Search</button>
            </div>

            <!-- Products Section -->
            <div id="products">
            
                <!-- Kitchen Appliances -->
                <div class="category-section" id="kitchen-appliances">
                    <!-- <h3 class="text-2xl font-bold mb-4">Kitchen Appliances</h3> -->
                   
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-10">
	                    <%
							if (!products.isEmpty()) {
								for (Product p : products) {
						%>
	                        <div class="bg-gray-100 rounded-lg shadow-lg overflow-hidden">
	    						<div class="w-72 h-48 flex justify-center items-center bg-gray-200">
	        						<img src="../components/images/products/<%= p.getImage() %>" alt="Blender" class="max-w-full max-h-full object-contain">
	    						</div>
	    						<div class="p-4">
	    						    <h4 class="text-xl font-semibold text-gray-800"><%= p.getName() %></h4>
	    						    <p class="text-gray-600">LKR <%= p.getPrice() %></p>
	    						     
	    						    <a href="../add-to-cart?id=<%= p.getId() %>" class="mt-4 bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-900 block text-center">
	    						        Add to Cart &nbsp;&nbsp;&nbsp;<i class="fas fa-cart-plus"></i>
	    						    </a>
	    						    <a href="../make-order-now?cpQty=1&cpID=<%= p.getId() %>" class="mt-4 bg-green-600 text-white px-4 py-2 rounded hover:bg-green-900 block text-center">
	    						        Buy Now &nbsp;&nbsp;&nbsp;<i class="fas fa-check-circle"></i>
	    						    </a>
	    						</div>
							</div>  
	                    <%
								}
							}
	                    %>
                    </div>
                    
                    
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <jsp:include page="../includes/footer.jsp" />

    <script src="../components/js/script.js"></script>
	<%@ include file="../includes/alert.jsp" %>
</body>

</html>
