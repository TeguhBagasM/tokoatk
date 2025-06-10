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
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Home - Toko ATK</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
        <style>
            .navbar-brand {
                font-weight: bold;
                font-size: 1.5rem;
            }
            .welcome-card {
                background: linear-gradient(135deg, #007bff 0%, #0056b3 100%);
                color: white;
                border-radius: 15px;
            }
            .menu-card {
                transition: all 0.3s ease;
                border: none;
                border-radius: 15px;
                height: 100%;
            }
            .menu-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 10px 25px rgba(0,0,0,0.15);
            }
            .menu-icon {
                font-size: 3rem;
                margin-bottom: 1rem;
                color: #007bff;
            }
            .stats-card {
                background: linear-gradient(45deg, #28a745, #20c997);
                color: white;
                border-radius: 15px;
            }
            .idle-warning {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0,0,0,0.8);
                z-index: 9999;
            }
        </style>
    </head>
    <body class="bg-light">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow">
            <div class="container">
                <a class="navbar-brand" href="#">
                    <i class="bi bi-shop me-2"></i>
                    Toko ATK
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link active" href="#"><i class="bi bi-house me-1"></i>Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="tokoatk/userlist.jsp"><i class="bi bi-people me-1"></i>Kelola User</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="tokoatk/baranglist.jsp"><i class="bi bi-box me-1"></i>Kelola Barang</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="transaksi.jsp"><i class="bi bi-cart me-1"></i>Transaksi</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="laporan.jsp"><i class="bi bi-graph-up me-1"></i>Laporan</a>
                        </li>
                    </ul>
                    <div class="navbar-nav">
                        <div class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                                <i class="bi bi-person-circle me-1"></i>
                                <strong><%= fullname %></strong>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li><h6 class="dropdown-header">Halo, <%= username %></h6></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="pengaturan.jsp"><i class="bi bi-gear me-2"></i>Pengaturan</a></li>
                                <li><a class="dropdown-item" href="tokoatk/logout.jsp" onclick="return confirm('Apakah Anda yakin ingin logout?')">
                                    <i class="bi bi-box-arrow-right me-2"></i>Logout</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container mt-4">
            <!-- Welcome Section -->
            <div class="card welcome-card shadow-lg mb-4">
                <div class="card-body p-4">
                    <div class="row align-items-center">
                        <div class="col-md-8">
                            <h2 class="card-title mb-3">
                                <i class="bi bi-emoji-smile me-2"></i>
                                Selamat Datang di Sistem Toko ATK
                            </h2>
                            <p class="card-text mb-2">Halo <strong><%= fullname %></strong> (<%= username %>)</p>
                            <p class="card-text">Anda telah berhasil login ke sistem. Silakan pilih menu yang tersedia untuk mengelola toko ATK Anda.</p>
                        </div>
                        <div class="col-md-4 text-center">
                            <i class="bi bi-shop" style="font-size: 5rem; opacity: 0.3;"></i>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Quick Stats -->
            <div class="row mb-4">
                <div class="col-md-4">
                    <div class="card stats-card shadow">
                        <div class="card-body text-center">
                            <i class="bi bi-clock-history" style="font-size: 2rem; margin-bottom: 0.5rem;"></i>
                            <h5 class="card-title">Sesi Aktif</h5>
                            <p class="card-text" id="sessionTime">0 menit</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card bg-info text-white shadow">
                        <div class="card-body text-center">
                            <i class="bi bi-calendar-date" style="font-size: 2rem; margin-bottom: 0.5rem;"></i>
                            <h5 class="card-title">Tanggal Hari Ini</h5>
                            <p class="card-text" id="currentDate"></p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card bg-warning text-dark shadow">
                        <div class="card-body text-center">
                            <i class="bi bi-speedometer2" style="font-size: 2rem; margin-bottom: 0.5rem;"></i>
                            <h5 class="card-title">Status Sistem</h5>
                            <p class="card-text">
                                <span class="badge bg-success">Online</span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Main Menu -->
            <div class="row">
                <div class="col-12">
                    <h3 class="mb-4">
                        <i class="bi bi-grid-3x3-gap text-primary me-2"></i>
                        Menu Utama
                    </h3>
                </div>
            </div>

            <div class="row g-4">
                <div class="col-lg-4 col-md-6">
                    <div class="card menu-card shadow h-100">
                        <div class="card-body text-center p-4">
                            <i class="bi bi-people-fill menu-icon"></i>
                            <h4 class="card-title">Kelola User</h4>
                            <p class="card-text text-muted">Tambah, edit, atau hapus data pengguna sistem</p>
                            <a href="tokoatk/userlist.jsp" class="btn btn-primary">
                                <i class="bi bi-arrow-right me-1"></i>Lihat Daftar User
                            </a>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6">
                    <div class="card menu-card shadow h-100">
                        <div class="card-body text-center p-4">
                            <i class="bi bi-box-seam menu-icon"></i>
                            <h4 class="card-title">Kelola Barang</h4>
                            <p class="card-text text-muted">Manajemen data barang ATK yang dijual</p>
                            <a href="tokoatk/baranglist.jsp" class="btn btn-success">
                                <i class="bi bi-arrow-right me-1"></i>Kelola Barang
                            </a>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6">
                    <div class="card menu-card shadow h-100">
                        <div class="card-body text-center p-4">
                            <i class="bi bi-cart-check menu-icon"></i>
                            <h4 class="card-title">Transaksi</h4>
                            <p class="card-text text-muted">Catat dan kelola transaksi penjualan</p>
                            <a href="transaksi.jsp" class="btn btn-warning">
                                <i class="bi bi-arrow-right me-1"></i>Input Transaksi
                            </a>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6">
                    <div class="card menu-card shadow h-100">
                        <div class="card-body text-center p-4">
                            <i class="bi bi-graph-up-arrow menu-icon"></i>
                            <h4 class="card-title">Laporan</h4>
                            <p class="card-text text-muted">Lihat laporan penjualan dan stok barang</p>
                            <a href="laporan.jsp" class="btn btn-info">
                                <i class="bi bi-arrow-right me-1"></i>Lihat Laporan
                            </a>
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6">
                    <div class="card menu-card shadow h-100">
                        <div class="card-body text-center p-4">
                            <i class="bi bi-gear-fill menu-icon"></i>
                            <h4 class="card-title">Pengaturan</h4>
                            <p class="card-text text-muted">Ubah profil dan pengaturan akun Anda</p>
                            <a href="pengaturan.jsp" class="btn btn-secondary">
                                <i class="bi bi-arrow-right me-1"></i>Pengaturan
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card menu-card shadow h-100 border-danger">
                        <div class="card-body text-center p-4">
                            <i class="bi bi-shield-check menu-icon text-success"></i>
                            <h4 class="card-title">Backup Data</h4>
                            <p class="card-text text-muted">Backup dan restore data sistem</p>
                            <a href="backup.jsp" class="btn btn-outline-success">
                                <i class="bi bi-arrow-right me-1"></i>Backup Data
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Idle Warning Modal -->
        <div class="modal fade" id="idleModal" tabindex="-1">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header bg-warning">
                        <h5 class="modal-title">
                            <i class="bi bi-exclamation-triangle me-2"></i>
                            Peringatan Sesi
                        </h5>
                    </div>
                    <div class="modal-body text-center">
                        <p>Sesi Anda akan berakhir dalam <span id="countdown">60</span> detik karena tidak ada aktivitas.</p>
                        <p>Klik "Lanjutkan" untuk tetap aktif atau "Logout" untuk keluar.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-success" onclick="continueSession()">
                            <i class="bi bi-check-circle me-1"></i>Lanjutkan
                        </button>
                        <a href="tokoatk/logout.jsp" class="btn btn-danger">
                            <i class="bi bi-box-arrow-right me-1"></i>Logout
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        
        <script>
            // Session timer
            let sessionStart = new Date();
            let idleTime = 0;
            let countdownTimer;
            const idleModal = new bootstrap.Modal(document.getElementById('idleModal'));

            // Update session time display
            function updateSessionTime() {
                const now = new Date();
                const diff = Math.floor((now - sessionStart) / 60000);
                document.getElementById('sessionTime').textContent = diff + ' menit';
            }

            // Update current date
            function updateCurrentDate() {
                const now = new Date();
                const options = { 
                    weekday: 'long', 
                    year: 'numeric', 
                    month: 'long', 
                    day: 'numeric',
                    locale: 'id-ID'
                };
                document.getElementById('currentDate').textContent = now.toLocaleDateString('id-ID', options);
            }

            // Idle timeout function
            const idleInterval = setInterval(timerIncrement, 60000); // 1 menit

            function timerIncrement() {
                idleTime++;
                if (idleTime >= 29) { // 29 menit - show warning
                    showIdleWarning();
                }
            }

            function showIdleWarning() {
                let countdown = 60; // 60 detik countdown
                document.getElementById('countdown').textContent = countdown;
                idleModal.show();
                
                countdownTimer = setInterval(() => {
                    countdown--;
                    document.getElementById('countdown').textContent = countdown;
                    
                    if (countdown <= 0) {
                        clearInterval(countdownTimer);
                        window.location.href = 'tokoatk/logout.jsp';
                    }
                }, 1000);
            }

            function continueSession() {
                idleTime = 0;
                clearInterval(countdownTimer);
                idleModal.hide();
            }

            // Reset timer saat ada aktivitas
            document.onmousemove = document.onkeypress = document.onclick = function() {
                idleTime = 0;
                if (countdownTimer) {
                    clearInterval(countdownTimer);
                    idleModal.hide();
                }
            };

            // Initialize
            updateSessionTime();
            updateCurrentDate();
            setInterval(updateSessionTime, 60000); // Update setiap menit
        </script>
    </body>
</html>