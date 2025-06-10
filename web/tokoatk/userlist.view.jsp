<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="id">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Daftar Pengguna</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Bootstrap Icons -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css">
    </head>
    <body class="bg-light">
        <!-- Navbar -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
            <div class="container">
                <a class="navbar-brand" href="#">
                    <i class="bi bi-people-fill me-2"></i>
                    Manajemen Pengguna
                </a>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container mt-4">
            <div class="row">
                <div class="col-12">
                    <!-- Header Card -->
                    <div class="card shadow-sm mb-4">
                        <div class="card-header bg-white">
                            <div class="d-flex justify-content-between align-items-center">
                                <h2 class="card-title mb-0">
                                    <i class="bi bi-list-ul text-primary me-2"></i>
                                    Daftar Pengguna
                                </h2>
                                <a href="formusertambah.jsp" class="btn btn-success">
                                    <i class="bi bi-person-plus me-2"></i>
                                    Tambah Pengguna Baru
                                </a>
                            </div>
                        </div>
                        <div class="card-body">
                            <!-- User List -->
                            <c:choose>
                                <c:when test="${empty list}">
                                    <div class="alert alert-info text-center" role="alert">
                                        <i class="bi bi-info-circle me-2"></i>
                                        Belum ada pengguna yang terdaftar
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="row">
                                        <c:forEach var="user" items="${list}">
                                            <div class="col-md-6 col-lg-4 mb-3">
                                                <div class="card border-0 shadow-sm h-100">
                                                    <div class="card-body">
                                                        <div class="d-flex align-items-center">
                                                            <div class="avatar-circle bg-primary text-white rounded-circle d-flex align-items-center justify-content-center me-3" style="width: 50px; height: 50px;">
                                                                <i class="bi bi-person-fill"></i>
                                                            </div>
                                                            <div>
                                                                <h6 class="card-title mb-1">${user.getFullname()}</h6>
                                                                <small class="text-muted">
                                                                    <i class="bi bi-at me-1"></i>
                                                                    ${user.getUsername()}
                                                                </small>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-footer bg-transparent border-0">
                                                        <div class="btn-group w-100" role="group">
                                                            <button type="button" class="btn btn-outline-primary btn-sm">
                                                                <i class="bi bi-eye me-1"></i>
                                                                Lihat
                                                            </button>
                                                            <button type="button" class="btn btn-outline-warning btn-sm">
                                                                <i class="bi bi-pencil me-1"></i>
                                                                Edit
                                                            </button>
                                                            <button type="button" class="btn btn-outline-danger btn-sm">
                                                                <i class="bi bi-trash me-1"></i>
                                                                Hapus
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>