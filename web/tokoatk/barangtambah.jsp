<%@page import="tokoatk.Barang"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Cek session login
    String fullname = (String) session.getAttribute("fullname");
    if(fullname == null) {
        response.sendRedirect("formlogin.jsp");
        return;
    }

    // Ambil parameter dari form
    String nama = request.getParameter("nama");
    String jenis = request.getParameter("jenis");
    String hargaStr = request.getParameter("harga");

    // Validasi input
    if(nama == null || jenis == null || hargaStr == null || 
       nama.trim().isEmpty() || jenis.trim().isEmpty() || hargaStr.trim().isEmpty()) {
        response.sendRedirect("formtambahbarang.jsp?error=1");
        return;
    }

    try {
        // Konversi harga ke double
        double harga = Double.parseDouble(hargaStr);
        
        if(harga <= 0) {
            response.sendRedirect("formtambahbarang.jsp?error=2");
            return;
        }

        // Buat objek barang baru
        Barang barang = new Barang();
        barang.nama = nama.trim();
        barang.jenis = jenis.trim();
        barang.harga = harga;

        // Simpan ke database
        if(barang.tambah()) {
            // Berhasil - redirect ke daftar dengan pesan sukses
            response.sendRedirect("baranglist.jsp?success=1");
        } else {
            // Gagal - redirect kembali ke form dengan pesan error
            response.sendRedirect("formtambahbarang.jsp?error=3");
        }

    } catch (NumberFormatException e) {
        // Error parsing harga
        response.sendRedirect("formtambahbarang.jsp?error=2");
    }
%>