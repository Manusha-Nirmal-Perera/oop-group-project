<%@page import="java.util.List" %>
<%@page import="com.company.modal.*" %>
<%@page import="com.company.dao.*" %>
<%@page import="com.company.connection.DbCon" %>
<jsp:include page="includes/headernav.jsp" />
    <!-- content goes here -->
    
    <%
	    if(session.getAttribute("admin") == null) {
	        response.sendRedirect("adminIndex.jsp");
	        return;
	    }
    	ReportDao rDao  = new ReportDao(DbCon.getConnection());
    	List<Report> reports = rDao.getAllReports();
    	
    	UserDao udao = new UserDao(DbCon.getConnection());
	%>
    <main class="flex-1 p-6">
        <h1 class="text-3xl font-bold mb-6 text-gray-800">User Reports</h1>
    
        <!-- Reports Table -->
        <div class="bg-white shadow-lg rounded-lg overflow-y-auto" style="max-height: 710px;">
            <table class="min-w-full bg-white border border-gray-200 rounded-lg">
                <thead class="bg-gray-800">
                    <tr class="bg-gray-800 text-white uppercase text-sm leading-normal sticky top-0">
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-200 uppercase tracking-wider">
                            User Info
                        </th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-200 uppercase tracking-wider">
                            Report Details

                        </th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-200 uppercase tracking-wider">
                            Date
                        </th>
                        <th class="px-4 py-3 text-left text-xs font-medium text-gray-200 uppercase tracking-wider">
                            Action
                        </th>
                    </tr>
                </thead>
                <tbody class="bg-white divide-y divide-gray-200 ">
                
                	<%
                		if(reports != null){
            				for(Report r:reports){
            					User u = udao.getUserByID(r.getUid());
                	%>
                    <tr>
                        <td class="px-4 py-4 whitespace-nowrap">
                            <p class="text-md text-gray-900 p-1"><%=u.getfName()%> <%= u.getlName() %></p>
                            <p class="text-md text-gray-900 p-1"><%=u.getEmail()%></p>
                            <p class="text-md text-gray-900 p-1"><%=u.getPhone()%></p>
                        </td>

                        <td class="px-4 py-4 whitespace-normal">
                            <div class="block text-md font-semibold text-gray-900 p=1"><%=r.getType() %></div>
                            <div class="text-sm text-gray-900"><%=r.getMessege() %></div>
                        </td>
                        <td class="px-4 py-4 whitespace-nowrap">
                            <div class="text-sm text-gray-500"><%=r.getDate() %></div>
                            
                            <%
                            	if(r.getStatus().equals("Pending")){
                           	%>
                           			<div class="border-red-500 border-2 rounded-full px-4 py-1 inline-block"><%= r.getStatus() %></div>
                           	<%	
                            	} else{
                           	%>
									<div class="border-green-500 border-2 rounded-full px-4 py-1 inline-block"><%= r.getStatus() %></div>
                            <%
                            	}
                            %>

                        </td>
                        <td class="px-4 py-4 whitespace-normal">
                            <a href="/ecommerce/admin-remove-report?rid=<%=r.getRid() %>" class="bg-red-600 hover:bg-red-700 text-white font-bold py-1 px-2 mb-1 rounded flex items-center w-1/2">
                                <i class="fas fa-trash-alt mr-2"></i> Remove
                            </a>
                            <a href="/ecommerce/admin-resolve-report?rid=<%=r.getRid() %>" class="bg-green-600 hover:bg-green-700 text-white font-bold py-1 px-2 rounded flex items-center w-1/2">
                                <i class="fas fa-check-circle mr-2"></i> Resolve
                            </a>
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
    	<%@ include file="../includes/alert.jsp" %>
<%@ include file="./includes/ending.jsp" %>