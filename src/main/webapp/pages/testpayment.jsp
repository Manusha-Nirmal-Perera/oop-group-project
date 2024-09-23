<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Place Order</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 font-sans">

    <!-- Go Back Button -->
    <div class="flex items-center justify-start p-4">
        <a href="javascript:history.back()" class="text-gray-500 hover:text-gray-800 flex items-center">
            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mr-2" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7" />
            </svg>
            Go Back
        </a>
    </div>

    <!-- Main Form Container -->
    <div class="max-w-4xl mx-auto bg-white p-8 rounded-lg shadow-md mt-10">
        <h3 class="text-2xl font-bold text-gray-800 mb-6">Place Your Order</h3>

        <form action="/ecommerce/user-apply-voucher" method="post">
            <div class="flex space-x-8">
                <!-- Left Section: Voucher Details -->
                <div class="w-1/2">
                    <!-- Total Amount -->
                    <div class="mb-6">
                        <label for="totalAmount" class="block text-lg font-semibold text-gray-700">Total Amount</label>
                        <input type="text" id="totalAmount" name="totalAmount" value="10000" readonly
                               class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm bg-gray-100">
                    </div>

                    <!-- Voucher Section -->
                    <div class="mb-6">
                        <h4 class="text-lg font-semibold mb-2">Voucher Details</h4>
                        <div class="mb-4">
                            <label for="voucherNumber" class="block text-sm font-medium text-gray-700">Voucher Number</label>
                            <input type="text" id="voucherNumber" name="voucherNumber"
                                   class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500">
                        </div>
                        <div class="mb-4">
                            <label for="voucherAmount" class="block text-sm font-medium text-gray-700">Voucher Amount</label>
                            <input type="text" id="voucherAmount" name="voucherAmount"
                                   class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500">
                        </div>
                        <button type="button" onclick="applyVoucher()" class="bg-indigo-600 hover:bg-indigo-700 text-white py-2 px-4 rounded-lg shadow-md">
                            Apply Voucher
                        </button>

                        <!-- Display Applied Vouchers -->
                        <div id="appliedVouchers" class="mt-4">
                            <!-- List of applied vouchers will be shown here -->
                        </div>
                    </div>

                    <!-- Remaining Amount to Pay by Card -->
                    <div class="mb-6">
                        <label for="remainingAmount" class="block text-lg font-semibold text-gray-700">Remaining Amount</label>
                        <input type="text" id="remainingAmount" name="remainingAmount" value="10000" readonly
                               class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm bg-gray-100">
                    </div>
                </div>

                <!-- Right Section: Credit Card Details -->
                <div class="w-1/2">
                    <h4 class="text-lg font-semibold mb-2">Credit Card Details</h4>
                    <div class="mb-4">
                        <label for="cardNumber" class="block text-sm font-medium text-gray-700">Card Number</label>
                        <input type="text" id="cardNumber" name="cardNumber" required
                               class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500">
                    </div>
                    <div class="mb-4">
                        <label for="userName" class="block text-sm font-medium text-gray-700">Name on Card</label>
                        <input type="text" id="userName" name="userName" required
                               class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500">
                    </div>
                    <div class="mb-4">
                        <label for="expireDate" class="block text-sm font-medium text-gray-700">Expiration Date</label>
                        <input type="month" id="expireDate" name="expireDate" required
                               class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500">
                    </div>
                    <div class="mb-4">
                        <label for="cvv" class="block text-sm font-medium text-gray-700">CVV</label>
                        <input type="text" id="cvv" name="cvv" required
                               class="mt-1 block w-full p-2 border border-gray-300 rounded-md shadow-sm focus:ring-indigo-500 focus:border-indigo-500">
                    </div>

                    <!-- Checkout Button -->
                    <div class="flex justify-end">
                        <button type="submit" class="bg-green-600 hover:bg-green-700 text-white py-2 px-4 rounded-lg shadow-md focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-green-500">
                            Checkout
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <!-- Script for Applying Multiple Vouchers -->
    <script>
        let appliedVoucherList = [];
        let remainingAmount = 10000;  // Initial total amount

        function applyVoucher() {
            const voucherNumber = document.getElementById('voucherNumber').value;
            const voucherAmount = parseFloat(document.getElementById('voucherAmount').value);

            if (isNaN(voucherAmount) || voucherAmount <= 0 || voucherAmount > remainingAmount) {
                alert("Please enter a valid voucher amount or ensure it doesn't exceed the remaining amount.");
                return;
            }

            // Add voucher to the list
            appliedVoucherList.push({ number: voucherNumber, amount: voucherAmount });

            // Update remaining amount
            remainingAmount -= voucherAmount;
            document.getElementById('remainingAmount').value = remainingAmount.toFixed(2);

            // Clear the voucher input fields
            document.getElementById('voucherNumber').value = '';
            document.getElementById('voucherAmount').value = '';

            // Display applied vouchers
            displayAppliedVouchers();
        }

        function displayAppliedVouchers() {
            const appliedVouchersDiv = document.getElementById('appliedVouchers');
            appliedVouchersDiv.innerHTML = '';

            appliedVoucherList.forEach(voucher => {
                const voucherInfo = document.createElement('div');
                voucherInfo.className = 'bg-gray-200 p-2 mb-2 rounded-lg shadow-inner';
                voucherInfo.innerHTML = `Voucher: ${voucher.number}, Amount: Rs. ${voucher.amount}`;
                appliedVouchersDiv.appendChild(voucherInfo);
            });
        }
    </script>

</body>
</html>
