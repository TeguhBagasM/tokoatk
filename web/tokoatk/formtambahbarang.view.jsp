<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tambah Barang - Toko ATK</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    </head>
    <body>
         <style>
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                padding: 0;
                background-color: #f8f9fa;
            }
            .header {
                color: black;
                padding: 1rem 2rem;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .header h1 {
                margin: 0;
            }
            .back-btn {
                background-color: #6c757d;
                color: white;
                text-decoration: none;
                padding: 8px 16px;
                border-radius: 4px;
            }
            .back-btn:hover {
                background-color: #545b62;
            }
            .form-container {
                background: white;
                padding: 2rem;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            }
            .form-group {
                margin-bottom: 1.5rem;
            }
            .form-group label {
                display: block;
                margin-bottom: 0.5rem;
                font-weight: bold;
                color: #333;
            }
            .form-group input, .form-group select {
                width: 100%;
                padding: 0.75rem;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 1rem;
                box-sizing: border-box;
            }
            .form-group input:focus, .form-group select:focus {
                outline: none;
                border-color: #007bff;
                box-shadow: 0 0 0 2px rgba(0,123,255,0.25);
            }
            .btn-group {
                display: flex;
                gap: 1rem;
                margin-top: 2rem;
            }
            .btn {
                padding: 0.75rem 1.5rem;
                border: none;
                border-radius: 4px;
                font-size: 1rem;
                cursor: pointer;
                text-decoration: none;
                text-align: center;
                flex: 1;
            }
            .btn-primary {
                background-color: #007bff;
                color: white;
            }
            .btn-primary:hover {
                background-color: #0056b3;
            }
            .btn-secondary {
                background-color: #6c757d;
                color: white;
            }
            .btn-secondary:hover {
                background-color: #545b62;
            }
            .required {
                color: #dc3545;
            }
            .help-text {
                font-size: 0.875rem;
                color: #6c757d;
                margin-top: 0.25rem;
            }
            .error-message {
                color: #dc3545;
                background-color: #f8d7da;
                border: 1px solid #f5c6cb;
                padding: 0.75rem;
                border-radius: 4px;
                margin-bottom: 1rem;
            }
        </style>
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow">
            <div class="container">
                <a class="navbar-brand" href="../home.jsp">
                    <i class="bi bi-shop me-2"></i>
                    Toko ATK
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="../home.jsp"><i class="bi bi-house me-1"></i>Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="userlist.jsp"><i class="bi bi-people me-1"></i>Kelola User</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="#"><i class="bi bi-box me-1"></i>Kelola Barang</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../transaksi.jsp"><i class="bi bi-cart me-1"></i>Transaksi</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../laporan.jsp"><i class="bi bi-graph-up me-1"></i>Laporan</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="header">
            <h1>📦 Tambah Barang Baru</h1>
            <a href="baranglist.jsp" class="back-btn">← Kembali ke Daftar</a>
        </div>

        <div class="container">
            <div class="form-container">
                <h2>Form Tambah Barang</h2>
                <p>Silakan isi form di bawah ini untuk menambah barang baru ke dalam sistem.</p>

                <%
                    String error = request.getParameter("error");
                    if("1".equals(error)) {
                        out.println("<div class='error-message'>Semua field harus diisi!</div>");
                    } else if("2".equals(error)) {
                        out.println("<div class='error-message'>Harga harus berupa angka yang valid!</div>");
                    } else if("3".equals(error)) {
                        out.println("<div class='error-message'>Gagal menambah barang. Silakan coba lagi.</div>");
                    }
                %>

                <form action="barangtambah.jsp" method="post" onsubmit="return validateForm()">
                    <div class="form-group">
                        <label for="nama">Nama Barang <span class="required">*</span></label>
                        <input type="text" id="nama" name="nama" required maxlength="100" 
                               placeholder="Contoh: Pulpen Pilot">
                        <div class="help-text">Masukkan nama barang (maksimal 100 karakter)</div>
                    </div>

                    <div class="form-group">
                        <label for="jenis">Jenis Barang <span class="required">*</span></label>
                        <select id="jenis" name="jenis" required>
                            <option value="">-- Pilih Jenis Barang --</option>
                            <option value="Alat Tulis">Alat Tulis</option>
                            <option value="Alat Gambar">Alat Gambar</option>
                            <option value="Buku">Buku</option>
                            <option value="Kertas">Kertas</option>
                            <option value="Perlengkapan Kantor">Perlengkapan Kantor</option>
                            <option value="Lainnya">Lainnya</option>
                        </select>
                        <div class="help-text">Pilih kategori jenis barang</div>
                    </div>

                    <div class="form-group">
                        <label for="harga">Harga (Rupiah) <span class="required">*</span></label>
                        <input type="number" id="harga" name="harga" required min="0" step="0.01" 
                               placeholder="0" onkeyup="formatHarga(this)">
                        <div class="help-text">Masukkan harga dalam rupiah (tanpa titik atau koma)</div>
                    </div>

                    <div class="btn-group">
                        <button type="submit" class="btn btn-primary">💾 Simpan Barang</button>
                        <a href="baranglist.jsp" class="btn btn-secondary">❌ Batal</a>
                    </div>
                </form>
            </div>
        </div>

        <script>
            function validateForm() {
                var nama = document.getElementById('nama').value.trim();
                var jenis = document.getElementById('jenis').value;
                var harga = document.getElementById('harga').value;

                if(nama === '' || jenis === '' || harga === '') {
                    alert('Semua field harus diisi!');
                    return false;
                }

                if(isNaN(harga) || harga <= 0) {
                    alert('Harga harus berupa angka yang valid dan lebih besar dari 0!');
                    return false;
                }

                return confirm('Apakah Anda yakin ingin menambah barang ini?');
            }

            function formatHarga(input) {
                // Format tampilan harga dengan separator ribuan
                var value = input.value.replace(/\D/g, '');
                input.value = value;
            }
        </script>
    </body>
</html>