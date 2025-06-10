<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Cek apakah user sudah login
    String fullname = (String) session.getAttribute("fullname");
    String username = (String) session.getAttribute("username");
    
    if(fullname == null || username == null) {
        // Jika belum login, redirect ke halaman login
        response.sendRedirect("formlogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home - Toko ATK</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f8f9fa;
            }
            .header {
                background-color: #007bff;
                color: white;
                padding: 1rem 2rem;
                display: flex;
                justify-content: space-between;
                align-items: center;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }
            .logo {
                font-size: 24px;
                font-weight: bold;
            }
            .user-info {
                display: flex;
                align-items: center;
                gap: 15px;
            }
            .logout-btn {
                background-color: #dc3545;
                color: white;
                border: none;
                padding: 8px 16px;
                border-radius: 4px;
                cursor: pointer;
                text-decoration: none;
                font-size: 14px;
            }
            .logout-btn:hover {
                background-color: #c82333;
            }
            .container {
                max-width: 1200px;
                margin: 0 auto;
                padding: 2rem;
            }
            .welcome-section {
                background: white;
                padding: 2rem;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                margin-bottom: 2rem;
            }
            .menu-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
                gap: 1.5rem;
                margin-top: 2rem;
            }
            .menu-card {
                background: white;
                padding: 1.5rem;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                text-align: center;
                transition: transform 0.2s;
            }
            .menu-card:hover {
                transform: translateY(-2px);
            }
            .menu-card h3 {
                color: #007bff;
                margin-bottom: 1rem;
            }
            .menu-card a {
                text-decoration: none;
                color: #007bff;
                font-weight: bold;
            }
            .menu-card a:hover {
                color: #0056b3;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <div class="logo">🏪 Toko ATK</div>
            <div class="user-info">
                <span>Selamat datang, <strong><%= fullname %></strong></span>
                <a href="tokoatk/logout.jsp" class="logout-btn" onclick="return confirm('Apakah Anda yakin ingin logout?')">
                    Logout
                </a>
            </div>
        </div>

        <div class="container">
            <div class="welcome-section">
                <h1>Selamat Datang di Sistem Toko ATK</h1>
                <p>Halo <strong><%= fullname %></strong> (<%= username %>), Anda telah berhasil login ke sistem.</p>
                <p>Silakan pilih menu yang tersedia di bawah ini untuk mengelola toko ATK Anda.</p>
            </div>

            <div class="menu-grid">
                <div class="menu-card">
                    <h3>👥 Kelola User</h3>
                    <p>Tambah, edit, atau hapus data pengguna sistem</p>
                    <a href="tokoatk/userlist.jsp">Lihat Daftar User</a>
                </div>
                
                <div class="menu-card">
                    <h3>📦 Kelola Barang</h3>
                    <p>Manajemen data barang ATK yang dijual</p>
                    <a href="tokoatk/baranglist.jsp">Kelola Barang</a>
                </div>
                
                <div class="menu-card">
                    <h3>🛒 Transaksi</h3>
                    <p>Catat dan kelola transaksi penjualan</p>
                    <a href="transaksi.jsp">Input Transaksi</a>
                </div>
                
                <div class="menu-card">
                    <h3>📊 Laporan</h3>
                    <p>Lihat laporan penjualan dan stok</p>
                    <a href="laporan.jsp">Lihat Laporan</a>
                </div>
                
                <div class="menu-card">
                    <h3>⚙️ Pengaturan</h3>
                    <p>Ubah profil dan pengaturan akun</p>
                    <a href="pengaturan.jsp">Pengaturan</a>
                </div>
            </div>
        </div>

        <script>
            // Auto logout jika idle terlalu lama (opsional)
            let idleTime = 0;
            const idleInterval = setInterval(timerIncrement, 60000); // 1 menit

            function timerIncrement() {
                idleTime++;
                if (idleTime >= 30) { // 30 menit
                    if(confirm('Sesi Anda akan berakhir karena tidak aktif. Klik OK untuk logout atau Cancel untuk melanjutkan.')) {
                        window.location.href = 'logout.jsp';
                    } else {
                        idleTime = 0;
                    }
                }
            }

            // Reset timer saat ada aktivitas
            document.onmousemove = document.onkeypress = function() {
                idleTime = 0;
            };
        </script>
    </body>
</html>