<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Hapus semua data session
    session.invalidate();
    
    // Redirect ke halaman login dengan pesan logout berhasil
    response.sendRedirect("formlogin.jsp?logout=success");
%>