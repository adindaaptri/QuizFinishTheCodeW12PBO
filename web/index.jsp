<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    
    <!-- Bootstrap Icons CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <link href="styles.css" rel="stylesheet" />
</head>
<body class="bg-light">

    <!-- Navbar -->
    <jsp:include page="Partials/navbar.jsp" />

    <!-- Masthead header-->
    <header class="masthead" style="min-height: 100vh">
            <div class="container px-5">
                <div class="row gx-5 align-items-center">
                    <div class="col-lg-6">
                        <!-- Mashead text and app badges-->
                        <div class="mb-5 mb-lg-0 text-center text-lg-start">
                            <h1 class="display-1 lh-1 mb-3 fw-bold">User Management Application</h1>
                            <p class="lead fw-normal text-muted mb-5">Manage your users with ease in our powerful user management system!</p>
                            <div class="justify-content-center align-items-left">
                                <a href="login.jsp" class="btn btn-primary btn-lg me-2"><i class="bi bi-box-arrow-in-right me-2"></i>Login</a>
                                <a href="register.jsp" class="btn btn-outline-primary btn-lg"> <i class="bi bi-person-plus me-2"></i>Register</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 text-center">
                        <!-- Icon User dengan ukuran 4rem dan warna primary -->
                        <i class="bi bi-people-fill text-primary" style="font-size: 23rem"></i>
                    </div>

                </div>
            </div>
        </header>

    <!-- Footer -->
    <jsp:include page="Partials/footer.jsp" />

    <!-- Bootstrap 5 JS Bundle (for interactive components if needed) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>