<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light shadow-sm" id="mainNav">
        <div class="container px-5">
            <a class="navbar-brand fw-bold" href="#page-top">User Management</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto me-4 my-3 my-lg-0">
                    <li class="nav-item"><a class="nav-link me-lg-3" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="UserServlet">User List</a></li>
                </ul>
                <a href="login.jsp" class="btn btn-primary rounded-pill px-3 mb-2 mb-lg-0 me-2">
                    <span class="d-flex align-items-center">
                        <i class="bi bi-box-arrow-in-right me-2"></i>
                        <span class="small">Login</span>
                    </span>
                </a>
                <a href="register.jsp" class="btn btn-outline-primary rounded-pill px-3 mb-2 mb-lg-0">
                    <span class="d-flex align-items-center">
                        <i class="bi bi-person-plus me-2"></i>
                        <span class="small">Register</span>
                    </span>
                </a>
            </div>
        </div>
    </nav>
