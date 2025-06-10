<%@page import="tokoatk.Barang"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.Locale"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    // Format rupiah
    NumberFormat formatRupiah = NumberFormat.getCurrencyInstance(new Locale("id", "ID"));
    
    // Ambil data barang
    ArrayList<Barang> listBarang = Barang.getList();
%>
<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Daftar Barang - Toko ATK</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
        <style>
            .stats-card {
                background: linear-gradient(135deg, #28a745 0%, #20c997 100%);
                color: white;
                border-radius: 15px;
                transition: transform 0.2s;
            }
            .stats-card:hover {
                transform: translateY(-2px);
            }
            .table-container {
                background: white;
                border-radius: 15px;
                overflow: hidden;
            }
            .btn-action {
                padding: 0.25rem 0.5rem;
                margin: 0 0.1rem;
                border-radius: 8px;
            }
            .no-data-illustration {
                max-width: 300px;
                margin: 0 auto;
            }
            .jenis-badge {
                font-size: 0.8rem;
                padding: 0.25rem 0.5rem;
            }
        </style>
    </head>
    <body class="bg-light">
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
                    <a href="../home.jsp" class="btn btn-outline-light">
                        <i class="bi bi-arrow-left me-1"></i>Kembali ke Home
                    </a>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container mt-4">
            <%
                // Hitung statistik
                int totalBarang = 0;
                double totalNilai = 0;
                if(listBarang != null) {
                    totalBarang = listBarang.size();
                    for(Barang b : listBarang) {
                        totalNilai += b.harga;
                    }
                }
            %>
            
            <!-- Header -->
            <div class="row mb-4">
                <div class="col-12">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h2 class="mb-1">
                                <i class="bi bi-box-seam text-primary me-2"></i>
                                Daftar Barang
                            </h2>
                            <p class="text-muted mb-0">Kelola data barang ATK yang dijual</p>
                        </div>
                        <a href="formtambahbarang.jsp" class="btn btn-success btn-lg">
                            <i class="bi bi-plus-circle me-2"></i>
                            Tambah Barang Baru
                        </a>
                    </div>
                </div>
            </div>

            <!-- Statistics Cards -->
            <div class="row mb-4">
                <div class="col-md-6">
                    <div class="card stats-card shadow">
                        <div class="card-body text-center">
                            <i class="bi bi-boxes" style="font-size: 3rem; opacity: 0.8;"></i>
                            <h3 class="mt-2 mb-1"><%= totalBarang %></h3>
                            <p class="mb-0">Total Barang</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card bg-info text-white shadow" style="border-radius: 15px;">
                        <div class="card-body text-center">
                            <i class="bi bi-currency-dollar" style="font-size: 3rem; opacity: 0.8;"></i>
                            <h3 class="mt-2 mb-1"><%= formatRupiah.format(totalNilai) %></h3>
                            <p class="mb-0">Total Nilai Stok</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Search and Filter -->
            <div class="card shadow-sm mb-4">
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-search"></i></span>
                                <input type="text" class="form-control" id="searchInput" placeholder="Cari nama barang...">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <select class="form-select" id="filterJenis">
                                <option value="">Semua Jenis</option>
                                <option value="Alat Tulis">Alat Tulis</option>
                                <option value="Alat Gambar">Alat Gambar</option>
                                <option value="Buku">Buku</option>
                                <option value="Kertas">Kertas</option>
                                <option value="Perlengkapan Kantor">Perlengkapan Kantor</option>
                                <option value="Lainnya">Lainnya</option>
                            </select>
                        </div>
                        <div class="col-md-2">
                            <button class="btn btn-outline-secondary w-100" onclick="resetFilter()">
                                <i class="bi bi-arrow-clockwise me-1"></i>Reset
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Table -->
            <div class="card shadow table-container">
                <% if(listBarang != null && !listBarang.isEmpty()) { %>
                    <div class="card-header bg-white">
                        <h5 class="mb-0">
                            <i class="bi bi-table me-2"></i>
                            Data Barang (<span id="totalItems"><%= totalBarang %></span> item)
                        </h5>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover mb-0" id="barangTable">
                                <thead class="table-primary">
                                    <tr>
                                        <th width="8%">
                                            <i class="bi bi-hash me-1"></i>ID
                                        </th>
                                        <th width="35%">
                                            <i class="bi bi-tag me-1"></i>Nama Barang
                                        </th>
                                        <th width="20%">
                                            <i class="bi bi-collection me-1"></i>Jenis
                                        </th>
                                        <th width="20%">
                                            <i class="bi bi-currency-dollar me-1"></i>Harga
                                        </th>
                                        <th width="17%" class="text-center">
                                            <i class="bi bi-gear me-1"></i>Aksi
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <% for(Barang barang : listBarang) { %>
                                    <tr>
                                        <td class="fw-bold text-primary">#<%= barang.id %></td>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <div class="bg-light rounded-circle p-2 me-2">
                                                    <i class="bi bi-box text-primary"></i>
                                                </div>
                                                <strong><%= barang.nama %></strong>
                                            </div>
                                        </td>
                                        <td>
                                            <% 
                                                String badgeClass = "bg-secondary";
                                                String iconClass = "bi-collection";
                                                switch(barang.jenis) {
                                                    case "Alat Tulis": badgeClass = "bg-primary"; iconClass = "bi-pencil"; break;
                                                    case "Alat Gambar": badgeClass = "bg-success"; iconClass = "bi-palette"; break;
                                                    case "Buku": badgeClass = "bg-info"; iconClass = "bi-book"; break;
                                                    case "Kertas": badgeClass = "bg-warning"; iconClass = "bi-file-text"; break;
                                                    case "Perlengkapan Kantor": badgeClass = "bg-dark"; iconClass = "bi-building"; break;
                                                }
                                            %>
                                            <span class="badge <%= badgeClass %> jenis-badge">
                                                <i class="<%= iconClass %> me-1"></i><%= barang.jenis %>
                                            </span>
                                        </td>
                                        <td>
                                            <span class="fw-bold text-success">
                                                <%= formatRupiah.format(barang.harga) %>
                                            </span>
                                        </td>
                                        <td class="text-center">
                                            <div class="btn-group" role="group">
                                                <button type="button" class="btn btn-outline-info btn-sm btn-action" 
                                                        title="Lihat Detail">
                                                    <i class="bi bi-eye"></i>
                                                </button>
                                                <a href="formeditbarang.jsp?id=<%= barang.id %>" 
                                                   class="btn btn-outline-warning btn-sm btn-action" 
                                                   title="Edit Barang">
                                                    <i class="bi bi-pencil-square"></i>
                                                </a>
                                                <button type="button" 
                                                        class="btn btn-outline-danger btn-sm btn-action" 
                                                        title="Hapus Barang"
                                                        onclick="confirmDelete('<%= barang.id %>', '<%= barang.nama %>')">
                                                    <i class="bi bi-trash"></i>
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                <% } else { %>
                    <div class="card-body text-center py-5">
                        <div class="no-data-illustration">
                            <i class="bi bi-box" style="font-size: 5rem; color: #dee2e6;"></i>
                            <h4 class="mt-3 text-muted">Belum Ada Data Barang</h4>
                            <p class="text-muted">
                                Silahkan tambahkan barang baru.
                            </p>
                        </div>
                    </div>
                <% } %>
            </div>
        </div>
</body>
</html>
