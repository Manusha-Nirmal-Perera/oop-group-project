<%@page import="java.util.List"%>
<%@page import="com.company.dao.AdminDao"%>
<%@page import="com.company.connection.DbCon"%>
<%@page import="com.company.modal.*"%>
<jsp:include page="includes/headernav.jsp" />
    <!-- content goes here -->
    <%
	    if(session.getAttribute("admin") == null) {
	        response.sendRedirect("adminIndex.jsp");
	        return;
	    }
		AdminDao ad = new AdminDao(DbCon.getConnection());
		List<AdminActivity> activities = ad.getAllAdminActivity();
	%>
    <main class="flex-1 p-6">
        <h1 class="text-3xl font-bold mb-6 text-gray-800">Admin Activity Log</h1>
        
        <!-- Activity Table -->
        <div class="bg-white shadow-lg rounded-lg overflow-y-auto" style="max-height: 700px;">
            <table class="min-w-full bg-white border border-gray-200 rounded-lg">
                <thead>
                    <tr class="bg-gray-800 text-white uppercase text-sm leading-normal sticky top-0">
                        <th class="py-4 px-6 text-left text-sm font-bold">Action ID</th>
                        <th class="py-4 px-6 text-left text-sm font-bold">Action Type</th>
                        <th class="py-4 px-6 text-left text-sm font-bold">Description</th>
                        <th class="py-4 px-6 text-left text-sm font-bold">Date & Time</th>
                        <th class="py-4 px-6 text-left text-sm font-bold">Status</th>
                    </tr>
                </thead>
                <tbody class="divide-y divide-gray-200 ">
                    <%
						if (!activities.isEmpty()) {
							for (AdminActivity adAc : activities) {
								String status = adAc.getStatus(); // Get the status from the object
						        String statusClass = "";
						        String statusText = "";

						        if ("Successful".equals(status)) {
						            statusClass = "bg-green-100 text-green-700";
						            statusText = "Successful";
						        } else if ("Failed".equals(status)) {
						            statusClass = "bg-red-100 text-red-700";
						            statusText = "Failed";
						        } else if ("Pending".equals(status)) {
						            statusClass = "bg-yellow-100 text-yellow-700";
						            statusText = "Pending";
						        }
						        // remove pending if not needed @yasidu
					%>

                    <tr class="hover:bg-gray-100">
                        <td class="py-4 px-6"><%=adAc.getActId() %></td>
                        <td class="py-4 px-6"><%=adAc.getActType() %></td>
                        <td class="py-4 px-6"><%=adAc.getDescription() %></td>
                        <td class="py-4 px-6"><%=adAc.getActTime() %></td>
                        <td class="py-4 px-6">
                            <span class="<%=statusClass %> px-2 py-1 rounded-full text-xs"><%=adAc.getStatus() %></span>
                        </td>
                    </tr>
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