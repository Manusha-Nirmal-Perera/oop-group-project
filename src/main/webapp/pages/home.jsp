<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.text.DecimalFormat" %>
<%@page import="com.company.connection.DbCon"%>
<%@page import="com.company.modal.Product"%>
<%@page import="com.company.dao.ProductDao"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EverMart</title>
	<%@ include file="../includes/imports.jsp" %>

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
    <!-- Hero Section -->
    <section class="bg-white py-20">
        <div class="container mx-auto flex flex-col lg:flex-row items-center">
            <div class="lg:w-1/2">
                <h1 class="text-4xl lg:text-6xl font-bold text-gray-800 mb-6">Welcome to EverMart</h1>
                <p class="text-lg text-gray-600 mb-6">Discover the best products at unbeatable prices. Shop now and enjoy exclusive deals.</p>
                <a href="shop.jsp" class="bg-blue-600 text-white px-6 py-3 rounded-lg hover:bg-blue-700">Shop Now</a>
            </div>
            <div class="lg:w-1/2 mt-10 lg:mt-0">
                <img src="https://via.placeholder.com/600x400" alt="Hero Image" class="rounded-lg shadow-lg">
            </div>
        </div>
    </section>
	<%
		DecimalFormat dcf = new DecimalFormat("###,###,###.##");
		request.setAttribute("dcf", dcf);
	
		ProductDao pdao = new ProductDao(DbCon.getConnection());
		
		List<Product> products = new ArrayList<>();
		products.add(pdao.getSingleProduct(7));
		products.add(pdao.getSingleProduct(8));
		products.add(pdao.getSingleProduct(9));
		products.add(pdao.getSingleProduct(10));
		
		
	%>
    <!-- Featured Products Section -->
    <section class="bg-gray-100 py-20">
        <div class="container mx-auto">
            <h2 class="text-3xl font-bold text-center text-gray-800 mb-10">Featured Products</h2>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-10">
                <!-- Product Card -->
                
                <%
					if (!products.isEmpty()) {
						for (Product p : products) {
				%>
                <div class="bg-gray-100 rounded-lg shadow-lg overflow-hidden">
	    			<div class="w-72 h-48 flex justify-center items-center bg-gray-200">
	        			<img src="../components/images/products/<%= p.getImage() %>" alt="Blender" class="max-w-full max-h-full rounded object-contain">
	    			</div>
	    			<div class="p-4">
	    			    <h4 class="text-xl font-semibold text-gray-800"><%= p.getName() %></h4>
	    			    <p class="text-gray-600">LKR <%= dcf.format(p.getPrice()) %></p>
	    			     
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
    </section>
	
	<%@ include file="../includes/footer.jsp" %>
    
	<%@ include file="../includes/alert.jsp" %>
</body>

</html>
