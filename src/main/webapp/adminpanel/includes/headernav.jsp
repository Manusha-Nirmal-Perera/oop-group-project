<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body class="bg-gray-100">
<!-- Top Navbar -->
<nav class="bg-gray-800 p-4">
    <div class="container mx-auto flex justify-between items-center">
        <a href="#" class="text-white text-2xl font-bold">Admin Panel</a>
        <div class="flex space-x-4">
            <a href="dashboard.jsp" class="text-gray-300 hover:text-white">Dashboard</a>
            <a href="settings.jsp" class="text-gray-300 hover:text-white">Settings</a>
            <a href="#" class="text-gray-300 hover:text-white">Profile</a>
            <a href="#" class="text-gray-300 hover:text-white">Logout</a>
        </div>
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
            </li>
                <a href="cancelledorders.jsp" class="flex items-center text-gray-300 hover:text-white">
                     <i class="fas fa-ban mr-2"></i> Cancelled Orders
                </a>
            </li>
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
                <a href="settings.jsp" class="flex items-center text-gray-300 hover:text-white">
                    <i class="fas fa-cogs mr-2"></i> Settings
                </a>
            </li>
        </ul>
    </aside>