<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tambah Barang - Toko ATK</title>
    </head>
    <body>
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