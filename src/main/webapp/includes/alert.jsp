
<% 
	String alertMessage = (String) session.getAttribute("alertMessage");
    String alertType = (String) session.getAttribute("alertType");
    if (alertMessage != null && alertType != null) {
%>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
    Swal.fire({
        title: '<%= alertType.equals("success") ? "Success" : alertType.equals("error") ? "Oops..." : alertType.equals("warning") ? "Watch Out!" : "Just So You Know" %>',
        text: '<%= alertMessage %>',
        icon: '<%= alertType %>',
        confirmButtonText: 'OK'
    });

    </script>
<% 
        session.removeAttribute("alertMessage");
        session.removeAttribute("alertType");
    }
%>