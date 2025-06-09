<%
    if(session.getAttribute("fullname")==null) {
        response.sendRedirect("tokoatk/formlogin.jsp");
    } else {
        response.sendRedirect("home.jsp");
    }
%>