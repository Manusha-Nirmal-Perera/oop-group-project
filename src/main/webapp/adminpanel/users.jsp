<%@page import="java.util.List"%>
<%@page import="com.company.dao.UserDao"%>
<%@page import="com.company.connection.DbCon"%>
<%@page import="com.company.modal.*"%>

<%
	UserDao udao = new UserDao(DbCon.getConnection());
	List<User> users = udao.getAllUsers();
%>

<%@ include file="./includes/headernav.jsp" %>
<!-- content goes here -->

	<main class="flex-grow p-6">
        <h2 class="text-2xl font-semibold text-gray-800 mb-6">Users</h2>
        <div class="overflow-y-auto" style="max-height: 700px;">
            <table class="min-w-full bg-white border border-gray-300 rounded-lg">
                <thead>
                    <tr class="bg-gray-800 text-white uppercase text-sm leading-normal sticky top-0">
                        <th class="py-3 px-6 text-left">First Name</th>
                        <th class="py-3 px-6 text-left">Last Name</th>
                        <th class="py-3 px-6 text-left">Email</th>
                        <th class="py-3 px-6 text-left">Phone</th>
                        <th class="py-3 px-6 text-center">Action</th>
                    </tr>
                </thead>
                <tbody class="text-gray-600 text-sm font-light">
                    <!-- 
                    	TODO: get the phone number and email from the users and 
                    	      set them as hyperlink so that mail to and call functions are supported
                     -->
                    <%
						if (!users.isEmpty()) {
							for (User u : users) {
					%>
                    	<tr class="border-b border-gray-200 hover:bg-gray-100">
                    		<form action="../admin-edit-user" method ="post">
	                    		<input type="hidden" name="adminuser-id" value="<%= u.getId()%>">
		                        <td class="py-3 px-6 text-left"><input type="text" name="adminuser-fname" value="<%= u.getfName()%>"></td>
		                        <td class="py-3 px-6 text-left"><input type="text" name="adminuser-lname" value="<%= u.getlName()%>"></td>
		                        <td class="py-3 px-6 text-left"><input type="email" name="adminuser-email" value="<%= u.getEmail()%>"></td>
		                        <td class="py-3 px-6 text-left"><input type="text" name="adminuser-phone" value="<%= u.getPhone()%>"></td>
		                        <td class="py-3 px-6 text-center">
		                            <input type="submit" class="bg-yellow-500 text-white px-4 py-2 rounded hover:bg-yellow-600" value="Save">
		                            <a href="../admin-del-user?id=<%= u.getId() %>" class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600">Delete</a>
		                        </td>
	                        </form>
                    	</tr>
        			<%
							}
						}
					%>
                </tbody>
            </table>
        </div>
        
    </main>
	<%@ include file="../includes/alert.jsp" %>
<!-- content goes here  -->
<%@ include file="./includes/ending.jsp" %>