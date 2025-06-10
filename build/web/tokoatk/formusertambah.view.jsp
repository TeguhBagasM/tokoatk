<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tambah Pengguna Baru</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
        <style>
            .form-container {
                max-width: 500px;
                margin: 0 auto;
            }
            .card-header {
                background: linear-gradient(135deg, #007bff 0%, #0056b3 100%);
                color: white;
            }
            .form-control:focus {
                border-color: #007bff;
                box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
            }
        </style>
    </head>
    <body class="bg-light">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container">
                <a class="navbar-brand" href="#">
                    <i class="bi bi-people-fill me-2"></i>
                    Manajemen Pengguna
                </a>
                <div class="navbar-nav ms-auto">
                    <a class="nav-link" href="userlist.jsp">
                        <i class="bi bi-arrow-left me-1"></i>
                        Kembali ke Daftar
                    </a>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container mt-5">
            <div class="form-container">
                <div class="card shadow">
                    <div class="card-header text-center">
                        <h3 class="mb-0">
                            <i class="bi bi-person-plus me-2"></i>
                            Tambah Pengguna Baru
                        </h3>
                    </div>
                    <div class="card-body p-4">
                        <form action="usertambah.jsp" method="post" id="addUserForm">
                            <!-- Username Field -->
                            <div class="mb-3">
                                <label for="username" class="form-label">
                                    <i class="bi bi-at text-primary me-1"></i>
                                    Username
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text">
                                        <i class="bi bi-person"></i>
                                    </span>
                                    <input type="text" 
                                           class="form-control" 
                                           id="username" 
                                           name="username" 
                                           placeholder="Masukkan username"
                                           required>
                                </div>
                                <div class="form-text">Username harus unik dan tidak boleh kosong</div>
                            </div>

                            <!-- Fullname Field -->
                            <div class="mb-3">
                                <label for="fullname" class="form-label">
                                    <i class="bi bi-person-badge text-primary me-1"></i>
                                    Nama Lengkap
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text">
                                        <i class="bi bi-person-fill"></i>
                                    </span>
                                    <input type="text" 
                                           class="form-control" 
                                           id="fullname" 
                                           name="fullname" 
                                           placeholder="Masukkan nama lengkap"
                                           required>
                                </div>
                            </div>

                            <!-- Password Field -->
                            <div class="mb-4">
                                <label for="password" class="form-label">
                                    <i class="bi bi-key text-primary me-1"></i>
                                    Password
                                </label>
                                <div class="input-group">
                                    <span class="input-group-text">
                                        <i class="bi bi-lock"></i>
                                    </span>
                                    <input type="password" 
                                           class="form-control" 
                                           id="password" 
                                           name="password" 
                                           placeholder="Masukkan password"
                                           required>
                                    <button class="btn btn-outline-secondary" 
                                            type="button" 
                                            id="togglePassword">
                                        <i class="bi bi-eye" id="toggleIcon"></i>
                                    </button>
                                </div>
                                <div class="form-text">Password minimal 6 karakter</div>
                            </div>

                            <!-- Submit Buttons -->
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary btn-lg">
                                    <i class="bi bi-check-circle me-2"></i>
                                    Tambah Pengguna
                                </button>
                                <a href="userlist.jsp" class="btn btn-outline-secondary">
                                    <i class="bi bi-x-circle me-2"></i>
                                    Batal
                                </a>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Info Card -->
                <div class="card mt-4 border-info">
                    <div class="card-header bg-info text-white">
                        <h6 class="mb-0">
                            <i class="bi bi-info-circle me-2"></i>
                            Informasi
                        </h6>
                    </div>
                    <div class="card-body">
                        <ul class="list-unstyled mb-0">
                            <li><i class="bi bi-check text-success me-2"></i>Username harus unik</li>
                            <li><i class="bi bi-check text-success me-2"></i>Password minimal 6 karakter</li>
                            <li><i class="bi bi-check text-success me-2"></i>Semua field wajib diisi</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        
        <!-- Custom JavaScript -->
        <script>
            // Toggle password visibility
            document.getElementById('togglePassword').addEventListener('click', function() {
                const password = document.getElementById('password');
                const toggleIcon = document.getElementById('toggleIcon');
                
                if (password.type === 'password') {
                    password.type = 'text';
                    toggleIcon.classList.remove('bi-eye');
                    toggleIcon.classList.add('bi-eye-slash');
                } else {
                    password.type = 'password';
                    toggleIcon.classList.remove('bi-eye-slash');
                    toggleIcon.classList.add('bi-eye');
                }
            });

            // Form validation
            document.getElementById('addUserForm').addEventListener('submit', function(e) {
                const username = document.getElementById('username').value.trim();
                const fullname = document.getElementById('fullname').value.trim();
                const password = document.getElementById('password').value;

                if (username.length < 3) {
                    e.preventDefault();
                    alert('Username minimal 3 karakter!');
                    return;
                }

                if (password.length < 6) {
                    e.preventDefault();
                    alert('Password minimal 6 karakter!');
                    return;
                }

                if (!fullname) {
                    e.preventDefault();
                    alert('Nama lengkap tidak boleh kosong!');
                    return;
                }
            });

            // Add loading state on form submit
            document.getElementById('addUserForm').addEventListener('submit', function() {
                const submitBtn = this.querySelector('button[type="submit"]');
                submitBtn.innerHTML = '<i class="bi bi-hourglass-split me-2"></i>Memproses...';
                submitBtn.disabled = true;
            });
        </script>
    </body>
</html>