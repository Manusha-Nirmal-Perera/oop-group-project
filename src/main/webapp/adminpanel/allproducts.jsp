<%@page import="java.util.List"%>
<%@page import="com.company.dao.ProductDao"%>
<%@page import="com.company.connection.DbCon"%>
<%@page import="com.company.modal.*"%>

<jsp:include page="includes/headernav.jsp" />

    <%
	    if(session.getAttribute("admin") == null) {
	        response.sendRedirect("adminIndex.jsp");
	        return;
	    }
		ProductDao pd = new ProductDao(DbCon.getConnection());
		List<Product> products = pd.getAllProducts();
	%>

    	<main class="flex-grow p-6">
	        <h2 class="text-2xl font-bold mb-6">Products</h2>
	        <div class="overflow-y-auto" style="max-height: 700px;">
	            <table class="min-w-full bg-white border border-gray-300 rounded-lg">
	                <thead>
	                    <tr class="bg-gray-800 text-white leading-normal sticky top-0">
	                        <th class="py-3 px-6 text-left">Image</th>
	                        <th class="py-3 px-6 text-left">Name</th>
	                        <th class="py-3 px-6 text-left">Category</th>
	                        <th class="py-3 px-6 text-left">Price</th>
	                        <th class="py-3 px-6 text-center">Action</th>
	                    </tr>
	                </thead>
	                <tbody class="text-gray-600 text-sm font-light">
	                    
	                    <%
							if (!products.isEmpty()) {
								for (Product p : products) {
						%>
				        			<form method="post" action="../edit-pr-info">
				        				<input type="hidden" name="pr-id" value="<%= p.getId()%>">
				                     	<tr class="border-b border-gray-200 hover:bg-gray-100">
					                        <td class="py-3 px-6 text-left">
					                            <img src="../components/images/products/<%= p.getImage() %>" alt="Product Image" class="h-12 w-12 object-cover rounded">
					                        </td>
					                        <td class="py-3 px-6 text-left"><input type="text" value="<%=p.getName() %>" name="pr-name"></td>
					                        <td class="py-3 px-6 text-left"><%= p.getCategory() %></td>
					                        <td class="py-3 px-6 text-left">LKR <input type="number" value="<%= p.getPrice() %>" step="0.01" name="pr-price"></td>
					                        <td class="py-3 px-6 text-center">
					                            <input type="submit" class="bg-blue-500 text-white px-4 py-2 rounded hover:bg-blue-600" value="Save">
					                            <a href="../admin-rm-product?id=<%=p.getId() %>" class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600">Remove</a>
					                        </td>
				                    	</tr>
				                     </form>
	                     
	                     <%
									}
								}
		                 %>
	        
	                </tbody>
	            </table>
	        </div>
    	</main>

    <!-- content goes here  -->
    <%@ include file="./includes/ending.jsp" %>
    <%@ include file="../includes/alert.jsp" %>