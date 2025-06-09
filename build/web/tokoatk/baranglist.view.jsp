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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Daftar Barang - Toko ATK</title>
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
            .container {
                max-width: 1200px;
                margin: 2rem auto;
                padding: 0 1rem;
            }
            .action-bar {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 2rem;
                background: white;
                padding: 1rem;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }
            .add-btn {
                background-color: #28a745;
                color: white;
                text-decoration: none;
                padding: 10px 20px;
                border-radius: 4px;
                font-weight: bold;
            }
            .add-btn:hover {
                background-color: #218838;
            }
            .table-container {
                background: white;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.1);
                overflow: hidden;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            th {
                background-color: #007bff;
                color: white;
                padding: 12px;
                text-align: left;
                font-weight: bold;
            }
            td {
                padding: 12px;
                border-bottom: 1px solid #dee2e6;
            }
            tr:hover {
                background-color: #f8f9fa;
            }
            .btn {
                padding: 6px 12px;
                text-decoration: none;
                border-radius: 4px;
                font-size: 12px;
                margin-right: 5px;
            }
            .btn-edit {
                background-color: #ffc107;
                color: #212529;
            }
            .btn-edit:hover {
                background-color: #e0a800;
            }
            .btn-delete {
                background-color: #dc3545;
                color: white;
            }
            .btn-delete:hover {
                background-color: #c82333;
            }
            .no-data {
                text-align: center;
                padding: 2rem;
                color: #6c757d;
            }
            .stats {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                gap: 1rem;
                margin-bottom: 2rem;
            }
            .stat-card {
                background: white;
                padding: 1.5rem;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0,0,0,0.1);
                text-align: center;
            }
            .stat-number {
                font-size: 2rem;
                font-weight: bold;
                color: #007bff;
            }
            .stat-label {
                color: #6c757d;
                margin-top: 0.5rem;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <h1>📦 Daftar Barang</h1>
            <a href="../home.jsp" class="back-btn">← Kembali ke Home</a>
        </div>

        <div class="container">
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
            
            <div class="stats">
                <div class="stat-card">
                    <div class="stat-number"><%= totalBarang %></div>
                    <div class="stat-label">Total Barang</div>
                </div>
                <div class="stat-card">
                    <div class="stat-number"><%= formatRupiah.format(totalNilai) %></div>
                    <div class="stat-label">Total Nilai Stok</div>
                </div>
            </div>

            <div class="action-bar">
                <h2>Kelola Data Barang</h2>
                <a href="formtambahbarang.jsp" class="add-btn">+ Tambah Barang Baru</a>
            </div>

            <div class="table-container">
                <% if(listBarang != null && !listBarang.isEmpty()) { %>
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nama Barang</th>
                                <th>Jenis</th>
                                <th>Harga</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <% for(Barang barang : listBarang) { %>
                            <tr>
                                <td><%= barang.id %></td>
                                <td><%= barang.nama %></td>
                                <td><%= barang.jenis %></td>
                                <td><%= formatRupiah.format(barang.harga) %></td>
                                <td>
                                    <a href="formeditbarang.jsp?id=<%= barang.id %>" class="btn btn-edit">Edit</a>
                                    <a href="hapusbarang.jsp?id=<%= barang.id %>" 
                                       class="btn btn-delete" 
                                       onclick="return confirm('Apakah Anda yakin ingin menghapus barang <%= barang.nama %>?')">
                                       Hapus
                                    </a>
                                </td>
                            </tr>
                            <% } %>
                        </tbody>
                    </table>
                <% } else { %>
                    <div class="no-data">
                        <h3>Belum ada data barang</h3>
                        <p>Klik tombol "Tambah Barang Baru" untuk menambah barang pertama Anda.</p>
                    </div>
                <% } %>
            </div>
        </div>
    </body>
</html>