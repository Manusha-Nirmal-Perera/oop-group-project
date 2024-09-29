 <%@page import="com.company.connection.DbCon"%>
 <%@page import="com.company.dao.*"%>
<%@page import="com.company.modal.Admin" %>
<%@ page import="java.text.DecimalFormat" %>
<%

	if(session.getAttribute("admin") == null) {
    	response.sendRedirect("adminIndex.jsp");
    	return;
	}

	OrderDao odao = new OrderDao(DbCon.getConnection());
	UserDao udao = new UserDao(DbCon.getConnection());
	ReportDao rdao = new ReportDao(DbCon.getConnection());
	int orderCount = odao.getOrderCount();
	int userCount = udao.getUserCount();
	int reportCount = rdao.getReportCount();
	double totalSales = odao.getTotalSales();
	DecimalFormat dcf = new DecimalFormat("###,###.##");
	request.setAttribute("dcf", dcf);
	
	Admin a = (Admin) request.getSession().getAttribute("admin");
	
%>

<jsp:include page="includes/headernav.jsp" /> 
	
    <!-- Main content (Dashboard) -->
    <main class="flex-1 p-6 bg-gray-100">
    
    	<h1 class="text-5xl font-semibold text-gray-800 mb-4">Admin Dashboard</h1>
    	<div class="justify-between items-center bg-gray-800 text-white p-5 rounded-lg shadow-md mb-6">
		    <div>
		        <h1 class="text-6xl font-semibold mb-2">WELCOME <%=a.getfName() %> <%=a.getlName() %></h1>
		        <p class="text-xl mt-5">Email: <%= a.getEmail() %></p>
		    </div>
		    <div>
		        <p class="text-lg mt-5" id="datetime"></p>
		    </div>
		</div>
        <div class="container mx-auto">
            
            <!-- Cards Section for Statistics -->
            <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
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
                <div class="bg-white p-6 rounded-lg shadow-lg flex items-center">
                    <div class="text-green-600 bg-green-100 rounded-full p-3 mr-4">
                        <i class="fas fa-shopping-cart text-2xl"></i>
                    </div>
                    <div>
                        <h2 class="text-2xl font-bold">New Orders</h2>
                        <p class="text-gray-700 text-lg"><%=orderCount %></p>
                    </div>
                </div>
                <!-- Card 3: Users -->
                <div class="bg-white p-6 rounded-lg shadow-lg flex items-center">
                    <div class="text-yellow-600 bg-yellow-100 rounded-full p-3 mr-4">
                        <i class="fas fa-users text-2xl"></i>
                    </div>
                    <div>
                        <h2 class="text-2xl font-bold">Users</h2>
                        <p class="text-gray-700 text-lg"><%=userCount %></p>
                    </div>
                </div>
                <!-- Card 4: Reports -->
                <div class="bg-white p-6 rounded-lg shadow-lg flex items-center">
                    <div class="text-red-600 bg-red-100 rounded-full p-3 mr-4">
                        <i class="fas fa-chart-line text-2xl"></i>
                    </div>
                    <div>
                        <h2 class="text-2xl font-bold">Reports</h2>
                        <p class="text-gray-700 text-lg"><%=reportCount %></p>
                    </div>
                </div>
            </div>

        </div>
        <div class="bg-gray-800 w-full flex justify-center items-center rounded shadow-md text-white mt-4 p-4 transition duration-300 hover:bg-gray-700 hover:text-yellow-300">
    		<a class="block text-lg text-center" href="../pages/home.jsp" target="_blank">Visit Store</a>
		</div>

        
    </main>
    
    <script>
    function updateDateTime() {
        const now = new Date();
        const options = {
            weekday: 'long', 
            year: 'numeric', 
            month: 'long', 
            day: 'numeric',
            hour: '2-digit', 
            minute: '2-digit', 
            second: '2-digit'
        };
        document.getElementById('datetime').textContent = now.toLocaleDateString('en-US', options);
    }
    
    // Update the date and time every second
    setInterval(updateDateTime, 1000);
    // Call once immediately to set the initial value
    updateDateTime();
</script>
    <%@ include file="../includes/alert.jsp" %>
<%@ include file="./includes/ending.jsp" %>