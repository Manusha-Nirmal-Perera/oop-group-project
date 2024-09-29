	<%
	if(session.getAttribute("admin") == null) {
	    response.sendRedirect("adminIndex.jsp");
	    return;
	}
	%>
<jsp:include page="includes/headernav.jsp" />


	<div class="flex-1 p-6">
	    <h2 class="text-2xl font-semibold mb-4">Add New Product</h2>
	    <form action="../admin-add-product" method="post" enctype="multipart/form-data">
	        <div class="mb-4">
	            <label for="name" class="block text-gray-700">Product Name</label>
	            <input type="text" id="name" name="pr-name" class="w-full p-2 border border-gray-300 rounded mt-1" required>
	        </div>
	        <div class="mb-4">
	            <label for="category" class="block text-gray-700">Category</label>
	            <select id="category" name="pr-category" class="w-full p-2 border border-gray-300 rounded mt-1" required>
	                <option value="" disabled selected>Select a category</option>
	                <option value="kitchen-appliances">Kitchen Appliances</option>
	                <option value="tables">Table</option>
	                <option value="beds">Bed</option>
	                <option value="wallpapers">Wallpaper</option>
	            </select>
	        </div>
	        <div class="mb-4">
	            <label for="price" class="block text-gray-700">Price</label>
	            <input type="number" id="price" name="pr-price" step="0.01" class="w-full p-2 border border-gray-300 rounded mt-1" required>
	        </div>
	        <div class="mb-4">
	            <label for="image" class="block text-gray-700">Product Image</label>
	            <input type="file" id="image" name="image" class="w-full p-2 border border-gray-300 rounded mt-1" required>
	        </div>
	        
	        <input type="submit" class="bg-blue-500 text-white p-2 rounded" value="Add Product">
	    </form>
	</div>
	
	<%@ include file="../includes/alert.jsp" %>
	
<%@ include file="./includes/ending.jsp" %>
