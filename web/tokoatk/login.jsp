<%@page import="tokoatk.User"%>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    
    // Validasi input
    if(username != null && password != null && !username.trim().isEmpty() && !password.trim().isEmpty()) {
        User user = new User();
        if(user.login(username.trim(), password)) {
            // Login berhasil
            session.setAttribute("fullname", user.getFullname());
            session.setAttribute("username", user.getUsername());
            
            // Set session timeout (30 menit)
            session.setMaxInactiveInterval(30 * 60);
            
            response.sendRedirect("../home.jsp");
        } else {
            // Login gagal
            response.sendRedirect("formlogin.jsp?error=1");
        }
    } else {
        // Input kosong
        response.sendRedirect("formlogin.jsp?error=2");
    }
%>