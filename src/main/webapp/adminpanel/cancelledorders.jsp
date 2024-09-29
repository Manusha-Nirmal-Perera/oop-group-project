<%@page import="com.company.modal.User" %>
<jsp:include page="includes/headernav.jsp" />
    <!-- content goes here -->
    	<%
    	if(session.getAttribute("admin") == null) {
    	    response.sendRedirect("adminIndex.jsp");
    	    return;
    	}
    	%>
    
    <!-- content goes here  -->
<%@ include file="./includes/ending.jsp" %>