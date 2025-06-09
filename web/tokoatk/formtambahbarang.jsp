<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Cek session login
    String fullname = (String) session.getAttribute("fullname");
    if(fullname == null) {
        response.sendRedirect("formlogin.jsp");
        return;
    }
    
    // Forward ke view
    RequestDispatcher dispatcher = request.getRequestDispatcher("formtambahbarang.view.jsp");
    dispatcher.forward(request, response);
%>