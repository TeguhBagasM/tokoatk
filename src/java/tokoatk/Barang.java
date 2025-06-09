package tokoatk;

import java.sql.*;
import java.util.ArrayList;

public class Barang {
    public int id;
    public String nama;
    public String jenis;
    public double harga;

    // Constructor kosong
    public Barang() {
    }

    // Constructor dengan parameter
    public Barang(String nama, String jenis, double harga) {
        this.nama = nama;
        this.jenis = jenis;
        this.harga = harga;
    }

    // Method untuk membaca data barang berdasarkan ID
    public boolean baca(int id) {
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            conn = DbConnection.connect();
            String sql = "SELECT * FROM barang WHERE id=?";
            st = conn.prepareStatement(sql);
            st.setInt(1, id);
            rs = st.executeQuery();

            if (rs.next()) {
                this.id = id;
                this.nama = rs.getString("nama");
                this.jenis = rs.getString("jenis");
                this.harga = rs.getDouble("harga");
                return true;
            } else {
                return false;
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } finally {
            try {
                if (rs != null) rs.close();
                if (st != null) st.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Method untuk menambah barang baru
    public boolean tambah() {
        Connection conn = null;
        PreparedStatement st = null;

        try {
            conn = DbConnection.connect();
            String sql = "INSERT INTO barang (nama, jenis, harga) VALUES (?, ?, ?)";
            st = conn.prepareStatement(sql);
            st.setString(1, this.nama);
            st.setString(2, this.jenis);
            st.setDouble(3, this.harga);

            int result = st.executeUpdate();
            return result > 0;

        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } finally {
            try {
                if (st != null) st.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Method untuk mengupdate barang
    public boolean update() {
        Connection conn = null;
        PreparedStatement st = null;

        try {
            conn = DbConnection.connect();
            String sql = "UPDATE barang SET nama=?, jenis=?, harga=? WHERE id=?";
            st = conn.prepareStatement(sql);
            st.setString(1, this.nama);
            st.setString(2, this.jenis);
            st.setDouble(3, this.harga);
            st.setInt(4, this.id);

            int result = st.executeUpdate();
            return result > 0;

        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } finally {
            try {
                if (st != null) st.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Method untuk menghapus barang
    public boolean hapus() {
        Connection conn = null;
        PreparedStatement st = null;

        try {
            conn = DbConnection.connect();
            String sql = "DELETE FROM barang WHERE id=?";
            st = conn.prepareStatement(sql);
            st.setInt(1, this.id);

            int result = st.executeUpdate();
            return result > 0;

        } catch (Exception ex) {
            ex.printStackTrace();
            return false;
        } finally {
            try {
                if (st != null) st.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Method static untuk mengambil semua data barang
    public static ArrayList<Barang> getList() {
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        ArrayList<Barang> result = new ArrayList<Barang>();

        try {
            conn = DbConnection.connect();
            String sql = "SELECT * FROM barang ORDER BY nama";
            st = conn.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                Barang barang = new Barang();
                barang.id = rs.getInt("id");
                barang.nama = rs.getString("nama");
                barang.jenis = rs.getString("jenis");
                barang.harga = rs.getDouble("harga");
                result.add(barang);
            }

            return result;

        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        } finally {
            try {
                if (rs != null) rs.close();
                if (st != null) st.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Getter methods
    public int getId() { return this.id; }
    public String getNama() { return this.nama; }
    public String getJenis() { return this.jenis; }
    public double getHarga() { return this.harga; }

    // Setter methods
    public void setId(int id) { this.id = id; }
    public void setNama(String nama) { this.nama = nama; }
    public void setJenis(String jenis) { this.jenis = jenis; }
    public void setHarga(double harga) { this.harga = harga; }
}