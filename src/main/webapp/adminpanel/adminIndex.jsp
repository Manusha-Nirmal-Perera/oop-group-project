<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login & Register Forms</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
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
<body class="bg-gray-100 h-screen flex items-center justify-center">
    <div class="relative w-96 overflow-hidden">
        <div class="form-container flex">
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
        
        <div class="form-container flex">
            
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
