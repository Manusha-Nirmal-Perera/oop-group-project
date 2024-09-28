<%@page import="java.util.List"%>
<%@page import="com.company.dao.*"%>
<%@page import="com.company.connection.DbCon"%>
<%@page import="com.company.modal.*"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
	ProductDao pd = new ProductDao(DbCon.getConnection());
	// List<Product> products = pd.getAllProducts();
	DecimalFormat dcf = new DecimalFormat("###,###,###.##");
	request.setAttribute("dcf", dcf);
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
			<!-- Search Filters -->
			<form action="/ecommerce/user-filter-products" method="get" id="filterForm">
			    <div class="flex justify-between items-center mb-10 shadow-md hover:bg-gray-100 rounded-full p-2">
			        <!-- Keyword Search -->
			        <!--  -->
			        <div class="relative w-full max-w-xs">
			            <input type="text" name="entered-pr-name" placeholder="Search products by name" class="w-full p-2 border border-gray-300 rounded-full text-center focus:outline-none focus:border-blue-600" id="keywordSearch" autocomplete="off">
			        </div>
			
			        <!-- Filter by Category -->
			        <div class="relative w-full max-w-xs">
			            <select name="category" class="w-full p-2 border border-gray-300 text-center rounded-full focus:outline-none focus:border-blue-600" id="filterByCategory">
			                <option class="text-center" value="">Filter by category</option>
			                <option class="text-center" value="kitchen-appliances">Kitchen Appliances</option>
			                <option class="text-center" value="wallpapers">Wallpapers</option>
			                <option class="text-center" value="tables">Tables</option>
			                <option class="text-center" value="beds">Beds</option>
			            </select>
			        </div>
			
			        <!-- Search Button -->
			        <button type="submit" class="bg-blue-600 text-white px-6 py-3 rounded-full hover:bg-blue-700 shadow-lg"><i class="fas fa-search"></i></button>
			    </div>
			</form>


            <!-- Products Section -->
            <div id="products">
            
                <!-- Kitchen Appliances -->
                <div class="category-section" id="kitchen-appliances">
                    <!-- <h3 class="text-2xl font-bold mb-4">Kitchen Appliances</h3> -->
                   
                    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-10">
	                    <%
	                    	List<Product> products = (List<Product>) request.getAttribute("products");
	                    	if(products == null){
	                    		products = pd.getAllProducts();
	                    	}
							if (!products.isEmpty()) {
								for (Product p : products) {
						%>
	                        <div class="bg-gray-100 rounded-lg shadow-md hover:shadow-lg overflow-hidden relative"> <!-- Added 'relative' to this parent div -->
							    <div class="w-72 h-48 flex justify-center items-center">
							        <img src="/ecommerce/components/images/products/<%= p.getImage() %>" alt="Blender" class="max-w-full max-h-full rounded object-contain">
							    </div>
							    <div class="p-4">
							        <h4 class="text-xl font-bold text-gray-900"><%= p.getName() %></h4>
							         <div class="flex items-center justify-between">
							        	<p class="text-gray-600 font-semibold">LKR <%= dcf.format(p.getPrice()) %></p>
							        
								        
								        	<%
									        	if (session.getAttribute("user") != null) {
													User u = (User) request.getSession().getAttribute("user");
													WishlistDao wDao = new WishlistDao(DbCon.getConnection());
													boolean res = wDao.isExist(u.getId(), p.getId());
													if(res){
											%>
														<a href="/ecommerce/user-uncheck-wishlist?prID=<%= p.getId()%>">
															<i class="text-red-600 hover:text-red-700 fas fa-heart text-3xl" style="text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);" title="Remove from Wishlist"></i>
														</a>
											<%
														
													}else{
											%>
														<a href="/ecommerce/user-add-to-wishlist?prid=<%= p.getId()%>">
															<i class="text-gray-500 hover:text-red-500 fas fa-heart text-3xl" style="text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);" title="Add to Wishlist"></i>
														</a>
											<%
														
													}
												} else {
											%>
													<i class="text-gray-500 hover:text-red-500 fas fa-heart text-3xl" style="text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);" title="Add to Wishlist"></i>
											<%
												}
								        	%>
								        </a>
							    	</div>
							        
							        <a href="/ecommerce/add-to-cart?id=<%= p.getId() %>&quantity=1" class="mt-4 bg-blue-600 text-white px-4 py-2 rounded hover:bg-blue-700 block text-center">
							            Add to Cart &nbsp;&nbsp;&nbsp;<i class="fas fa-cart-plus"></i>
							        </a>
							        <a href="/ecommerce/make-order-now?cpQty=1&cpID=<%= p.getId() %>" class="mt-4 bg-green-500 text-white px-4 py-2 rounded hover:bg-green-600 block text-center">
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

	<%@ include file="../includes/alert.jsp" %>
</body>

</html>
