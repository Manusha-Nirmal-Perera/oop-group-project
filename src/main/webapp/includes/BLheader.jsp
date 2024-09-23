<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.company.connection.DbCon"%>
	<% out.print(DbCon.getConnection()); %>
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
     <!-- Navbar -->
    <nav class="bg-gray-800 p-4">
        <div class="container mx-auto flex justify-between items-center">
            <a href="#" class="text-white text-2xl font-bold">Evermart</a>
            <div class="flex space-x-4">
                <a id="home-nav" href="/ecommerce/pages/home.jsp" class="text-gray-300 hover:text-white items-center flex ">Home</a>
                <a id="shop-nav" href="/ecommerce/pages/shop.jsp" class="text-gray-300 hover:text-white items-center flex">Shop</a>
                <a id="about-nav" href="/ecommerce/pages/about.jsp" class="text-gray-300 hover:text-white items-center flex">About</a>
                <a id="contact-nav" href="/ecommerce/pages/contact.jsp" class="text-gray-300 hover:text-white items-center flex">Contact</a>
                <!-- Login Button -->
                <button id="login-btn" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800" type="button">
                    Login
                </button>
                <!-- Signup Button -->
                <button id="signup-btn" class="text-white bg-green-700 hover:bg-green-800 focus:ring-4 focus:outline-none focus:ring-green-300 font-medium rounded-lg text-sm px-5 py-2.5 dark:bg-green-600 dark:hover:bg-green-700 dark:focus:ring-green-800" type="button">
                    Sign Up
                </button>
            </div>
        </div>
    </nav>


<!-- Login Modal -->
<div id="login-modal" class="hidden fixed inset-0 z-50 flex items-center justify-center bg-gray-800 bg-opacity-50">
    <div class="bg-white p-6 rounded-lg shadow-md max-w-sm w-full relative">
        <form method="post" action="/ecommerce/user-login">
            <!-- Close Button inside the form -->
            <button type="button" class="absolute top-2 right-2 text-gray-400 hover:text-gray-600" id="login-close-btn">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                </svg>
            </button>
            <h2 class="text-2xl font-semibold mb-4">Login</h2>
            <div class="mb-4">
                <label for="login-email" class="block text-sm font-medium text-gray-700">Email</label>
                <input type="email" name="login-email" id="login-email" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-500 focus:ring-opacity-50" placeholder="name@company.com">
            </div>
            <div class="mb-4">
                <label for="login-password" class="block text-sm font-medium text-gray-700">Password</label>
                <input type="password" name="login-password" id="login-password" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-blue-500 focus:ring focus:ring-blue-500 focus:ring-opacity-50" placeholder="••••••••">
            </div>
            <button type="submit" class="w-full bg-blue-700 text-white py-2 rounded-md hover:bg-blue-800 focus:outline-none focus:ring-4 focus:ring-blue-300">Login</button>
        </form>
    </div>
</div>

<!-- Signup Modal -->
<div id="signup-modal" class="hidden fixed inset-0 z-50 flex items-center justify-center bg-gray-800 bg-opacity-50">
    <div class="bg-white p-6 rounded-lg shadow-md max-w-sm w-full relative">
        <form method="post" action="/ecommerce/user-register" onsubmit="checkPassword()">
            <!-- Close Button inside the form -->
            <button type="button" class="absolute top-2 right-2 text-gray-400 hover:text-gray-600" id="signup-close-btn">
                <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12"></path>
                </svg>
            </button>
            <h2 class="text-2xl font-semibold mb-4">Sign Up</h2>
            <div class="mb-4">
                <label for="signup-email" class="block text-sm font-medium text-gray-700">First Name</label>
                <input type="text" name="signup-fname" id="signup-fname" class="mt-1 p-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-green-500 focus:ring focus:ring-green-500 focus:ring-opacity-50" placeholder="Peter">
            </div>
            <div class="mb-4">
                <label for="signup-password" class="block text-sm font-medium text-gray-700">Last Name</label>
                <input type="text" name="signup-lname" id="signup-lname" class="mt-1 p-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-green-500 focus:ring focus:ring-green-500 focus:ring-opacity-50" placeholder="Perera">
            </div>
            <div class="mb-4">
                <label for="signup-email" class="block text-sm font-medium text-gray-700">Email</label>
                <input type="email" name="signup-email" id="signup-email" class="mt-1 p-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-green-500 focus:ring focus:ring-green-500 focus:ring-opacity-50" placeholder="name@company.com">
            </div>
            <div class="mb-4">
                <label for="signup-password" class="block text-sm font-medium text-gray-700">Password</label>
                <input type="password" name="signup-password" id="signup-password" class="mt-1 p-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-green-500 focus:ring focus:ring-green-500 focus:ring-opacity-50" placeholder="••••••••">
            </div>
            <div class="mb-4">
                <label for="signup-cnfrm-pwd" class="block text-sm font-medium text-gray-700">Re-enter password</label>
                <input type="password" id="signup-cnfrm-pwd" class="mt-1 p-1 block w-full border-gray-300 rounded-md shadow-sm focus:border-green-500 focus:ring focus:ring-green-500 focus:ring-opacity-50" placeholder="••••••••">
            </div>
            <div class="mb-4">
            	<input type="checkbox" id="tnc" class="mt-1 p-1 border-gray-300 rounded-md shadow-sm focus:border-green-500 focus:ring focus:ring-green-500 focus:ring-opacity-50" autocomplete="off">
                <label for="tnc" class="text-sm font-medium text-gray-700">Agree to terms and conditions</label>
            </div>
            <input type="submit" id="reg-btn" class="w-full bg-green-700 text-white py-2 rounded-md hover:bg-green-800 focus:outline-none focus:ring-4 focus:ring-green-300" value="Sign Up">
        </form>
    </div>
</div>

<script src="/ecommerce/components/js/BLscript.js"></script>


  