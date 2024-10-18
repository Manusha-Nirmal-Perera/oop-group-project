<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Evermart-AdminPanel</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
    	/* Hide scrollbar for all browsers */
		html {
		    scrollbar-width: none; /* For Firefox */
		}
		
		body {
		    overflow: auto;
		    -ms-overflow-style: none;  /* For Internet Explorer and Edge */
		    scrollbar-width: none;  /* For Firefox */
		}
		
		body::-webkit-scrollbar {
		    display: none;  /* For Chrome, Safari, and Opera */
		}
        /* Custom CSS to handle form transitions */
        .form-container {
            transition: transform 0.5s ease-in-out;
        }

        .show-login {
            transform: translateX(0%);
        }

        .show-register {
            transform: translateX(100%);
        }
    </style>
</head>
<body class="bg-gray-100">
	
<!-- Top Navbar -->
<nav class="bg-gray-800 p-4">
    <div class="container flex justify-between mx-auto">
        <div class="text-white text-2xl font-bold">EverMart</div>
        <div class="text-white text-2xl font-bold">AdminPanel</div>
        <div class="text-white text-2xl font-bold">EverMart</div>
    </div>
</nav>

<div class="flex">
    <!-- Sidebar -->
    <aside class="w-64 bg-gray-800 h-screen p-6">
        <div class="text-white text-xl font-semibold mb-6">Admin Navigation</div>
        <ul class="space-y-4">
            <li>
                <a href="dashboard.jsp" class="flex items-center text-gray-300 hover:text-white">
                    <i class="fas fa-tachometer-alt mr-2"></i> Dashboard
                </a>
            </li>
            <li>
                <a href="orders.jsp" class="flex items-center text-gray-300 hover:text-white">
                    <i class="fas fa-list-ul mr-2"></i> Orders
                </a>
            </li>
            <li>
                <a href="rejectedOrders.jsp" class="flex items-center text-gray-300 hover:text-white">
                    <i class="fas fa-ban mr-2"></i> Rejected Orders
                </a>
            </li>
            <li>
                <a href="acceptedOrders.jsp" class="flex items-center text-gray-300 hover:text-white">
                    <i class="fas fa-check-square mr-2"></i> Accepted Orders
                </a>
            </li>
            <li>
            <li>
                <a href="allproducts.jsp" class="flex items-center text-gray-300 hover:text-white">
                    <i class="fas fa-box-open mr-2"></i> All Products
                </a>
            </li>
            <li>
            </li>
                <a href="addproducts.jsp" class="flex items-center text-gray-300 hover:text-white">
                    <i class="fas fa-plus-square mr-2"></i> Add Products
                </a>
            </li>
            <li>
                <a href="users.jsp" class="flex items-center text-gray-300 hover:text-white">
                    <i class="fas fa-users mr-2"></i> Users
                </a>
            </li>
            <li>
                <a href="reports.jsp" class="flex items-center text-gray-300 hover:text-white">
                    <i class="fas fa-chart-line mr-2"></i> Reports
                </a>
            </li>
            <li>
                <a href="adminActivity.jsp" class="flex items-center text-gray-300 hover:text-white">
                    <i class="fas fa-history mr-2"></i> My Acivity
                </a>

            </li>
            <li>
                <a href="/ecommerce/admin-logout" class="flex items-center text-gray-300 hover:text-white">
                   	<i class="fas fa-sign-out-alt mr-2"></i> Sign Out
                </a>

            </li>
        </ul>
    </aside>

	<div class="h-screen w-full flex items-center justify-center">
	    <div class="relative w-96 overflow-hidden">
	        <div class="form-container flex">
	        	<!-- registration form -->
	        	<div id="registerForm" class="hidden w-full p-6 bg-white shadow-md rounded-lg">
	                <h2 class="text-lg font-semibold mb-4 text-center">Register</h2>
	                <form action="/ecommerce/admin-register" method="post">
	                    <div class="mb-4">
	                        <label class="block text-sm font-medium text-gray-700">First Name</label>
	                        <input type="text" name="signup-fname" id="signup-fname" class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm">
	                    </div>
	                    <div class="mb-4">
	                        <label class="block text-sm font-medium text-gray-700">Last Name</label>
	                        <input type="text" name="signup-lname" id="signup-lname" class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm">
	                    </div>
	                    <div class="mb-4">
	                        <label class="block text-sm font-medium text-gray-700">Email</label>
	                        <input type="email" name="signup-email" id="signup-email" class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm">
	                    </div>
	                    <div class="mb-4">
	                        <label class="block text-sm font-medium text-gray-700">Password</label>
	                        <input type="password" name="signup-password" id="signup-password" class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm">
	                    </div>
	                    <div class="mb-4">
	                        <label class="block text-sm font-medium text-gray-700">Re enter password</label>
	                        <input type="password" id="signup-cnfrm-pwd" class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm">
	                    </div>
	                    <button type="submit" class="w-full bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded mb-2">
	                        Register
	                    </button>
	                    <!-- Back to Login Button to Transform -->
	                    <button type="button" id="reg-btn" onclick="showLogin()" class="w-full bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded">Back to Login</button>
	                </form>
	            </div>
	            <!-- Login Form -->
	            <div id="loginForm" class="w-full p-6 bg-white shadow-md rounded-lg">
	                <h2 class="text-lg font-semibold mb-4 text-center">Login</h2>
	                <form action="/ecommerce/admin-login" method="post">
	                    <div class="mb-4">
	                        <label class="block text-sm font-medium text-gray-700">Email</label>
	                        <input type="email" name="login-email" id="login-email" class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm">
	                    </div>
	                    <div class="mb-4">
	                        <label class="block text-sm font-medium text-gray-700">Password</label>
	                        <input type="password" name="login-password" id="login-password" class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm">
	                    </div>
	                    <button type="submit" class="w-full bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded mb-2">
	                        Login
	                    </button>
	                    <!-- Register Button to Transform -->
	                    <button type="button" onclick="showRegister()" class="w-full bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded">
	                        Register
	                    </button>
	                </form>
	            </div>
	            
	        </div>
	     </div>
	    
	</div>
</div>
    <script>
        const loginForm = document.getElementById("loginForm");
        const registerForm = document.getElementById("registerForm");

        function showRegister() {
        	loginForm.classList.add('hidden');
        	registerForm.classList.remove('hidden');
        }

        function showLogin() {
        	registerForm.classList.add('hidden');
        	loginForm.classList.remove('hidden');
        }
    </script>
    
    <%@ include file="../includes/alert.jsp" %>
</body>
</html>
