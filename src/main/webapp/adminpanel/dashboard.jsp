 <%@page import="com.company.connection.DbCon"%>
 <%@page import="com.company.dao.*"%>
 <%@ page import="java.text.DecimalFormat" %>
<%
	OrderDao odao = new OrderDao(DbCon.getConnection());
	UserDao udao = new UserDao(DbCon.getConnection());
	int orderCount = odao.getOrderCount();
	int userCount = udao.getUserCount();
	double totalSales = odao.getTotalSales();
	DecimalFormat dcf = new DecimalFormat("###,###.##");
	request.setAttribute("dcf", dcf);
	
%>

<%@ include file="./includes/headernav.jsp" %>

    <!-- Main content (Dashboard) -->
    <main class="flex-1 p-6 bg-gray-100">
        <div class="container mx-auto">
            <!-- Dashboard Title -->
            <h1 class="text-4xl font-semibold text-gray-800 mb-4">Admin Dashboard</h1>

            <!-- Cards Section for Statistics -->
            <div class="grid grid-cols-1 md:grid-cols-4 gap-4">
                <!-- Card 1: Total Sales -->
                <div class="bg-white p-6 rounded-lg shadow-md flex items-center">
                    <div class="text-blue-600 bg-blue-100 rounded-full p-3 mr-4">
                        <i class="fas fa-dollar-sign text-2xl"></i>
                    </div>
                    <div>
                        <h2 class="text-2xl font-bold">Total Sales</h2>
                        <p class="text-gray-700 text-lg">LKR <%=dcf.format(totalSales)%></p>
                    </div>
                </div>
                <!-- Card 2: New Orders -->
                <div class="bg-white p-6 rounded-lg shadow-md flex items-center">
                    <div class="text-green-600 bg-green-100 rounded-full p-3 mr-4">
                        <i class="fas fa-shopping-cart text-2xl"></i>
                    </div>
                    <div>
                        <h2 class="text-2xl font-bold">New Orders</h2>
                        <p class="text-gray-700 text-lg"><%=orderCount %></p>
                    </div>
                </div>
                <!-- Card 3: Users -->
                <div class="bg-white p-6 rounded-lg shadow-md flex items-center">
                    <div class="text-yellow-600 bg-yellow-100 rounded-full p-3 mr-4">
                        <i class="fas fa-users text-2xl"></i>
                    </div>
                    <div>
                        <h2 class="text-2xl font-bold">Users</h2>
                        <p class="text-gray-700 text-lg"><%=userCount %></p>
                    </div>
                </div>
                <!-- Card 4: Reports -->
                <div class="bg-white p-6 rounded-lg shadow-md flex items-center">
                    <div class="text-red-600 bg-red-100 rounded-full p-3 mr-4">
                        <i class="fas fa-chart-line text-2xl"></i>
                    </div>
                    <div>
                        <h2 class="text-2xl font-bold">Reports</h2>
                        <p class="text-gray-700 text-lg">45</p>
                    </div>
                </div>
            </div>

            <div class="mt-8">
                <div class="overflow-y-auto" style="max-height: 600px;">
                    <h2 class="text-2xl font-bold mb-4">Orders</h2>
                    <table class="min-w-full bg-white">
                        <thead class="bg-gray-800 text-white">
                            <tr>
                                <th class="py-2">Order ID</th>
                                <th class="py-2">Product ID</th>
                                <th class="py-2">Customer</th>
                                <th class="py-2">Quantity</th>
                                <th class="py-2">Total Price</th>
                            </tr>
                        </thead>
                        <tbody class="text-gray-700">
				
                            <tr>
                                <td class="py-2 text-center">1</td>
                                <td class="py-2 text-center">1</td>
                                <td class="py-2 text-center">fname lname</td>
                                <td class="py-2 text-center">3</td>
                                <td class="py-2 text-center">LKR 15000.00</td>
                            </tr>
                            <tr>
                                <td class="py-2 text-center">2</td>
                                <td class="py-2 text-center">3</td>
                                <td class="py-2 text-center">fname lname</td>
                                <td class="py-2 text-center">5</td>
                                <td class="py-2 text-center">LKR 12000.00</td>
                            </tr>
                            <tr>
                                <td class="py-2 text-center">3</td>
                                <td class="py-2 text-center">1</td>
                                <td class="py-2 text-center">fname lname</td>
                                <td class="py-2 text-center">3</td>
                                <td class="py-2 text-center">LKR 15000.00</td>
                            </tr>
                            <tr>
                                <td class="py-2 text-center">4</td>
                                <td class="py-2 text-center">3</td>
                                <td class="py-2 text-center">fname lname</td>
                                <td class="py-2 text-center">5</td>
                                <td class="py-2 text-center">LKR 12000.00</td>
                            </tr> 
                            <tr>
                                <td class="py-2 text-center">5</td>
                                <td class="py-2 text-center">1</td>
                                <td class="py-2 text-center">fname lname</td>
                                <td class="py-2 text-center">3</td>
                                <td class="py-2 text-center">LKR 15000.00</td>
                            </tr>
                            <tr>
                                <td class="py-2 text-center">6</td>
                                <td class="py-2 text-center">3</td>
                                <td class="py-2 text-center">fname lname</td>
                                <td class="py-2 text-center">5</td>
                                <td class="py-2 text-center">LKR 12000.00</td>
                            </tr>
                            <tr>
                                <td class="py-2 text-center">7</td>
                                <td class="py-2 text-center">1</td>
                                <td class="py-2 text-center">fname lname</td>
                                <td class="py-2 text-center">3</td>
                                <td class="py-2 text-center">LKR 15000.00</td>
                            </tr>
                            <tr>
                                <td class="py-2 text-center">8</td>
                                <td class="py-2 text-center">3</td>
                                <td class="py-2 text-center">fname lname</td>
                                <td class="py-2 text-center">5</td>
                                <td class="py-2 text-center">LKR 12000.00</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>


        </div>
    </main>
<%@ include file="./includes/ending.jsp" %>