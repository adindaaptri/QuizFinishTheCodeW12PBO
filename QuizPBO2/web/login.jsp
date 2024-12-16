<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    // Check if login was successful and set session attribute 'loginSuccess'
    Boolean registrationSuccess = (Boolean) session.getAttribute("registrationSuccess");
    if (registrationSuccess != null && registrationSuccess) {
        // Reset the loginSuccess flag to prevent it from showing again on refresh
        session.setAttribute("registrationSuccess", false);
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body class="bg-light">

    <!-- Navbar -->
    <jsp:include page="Partials/navbar.jsp" />

    <!-- Centered Login Form -->
    <div class="container d-flex justify-content-center align-items-center py-5 min-vh-100">
        <div class="row justify-content-center w-100">
            <div class="col-lg-4 col-md-6 col-12">
                <div class="card shadow-lg border-0 rounded-3">
                    <div class="card-header text-center bg-primary text-white">
                        <h4>Login</h4>
                    </div>
                    <div class="card-body">
                        <form action="LoginServlet" method="post">
                            <div class="mb-3">
                                <label for="username" class="form-label">Username</label>
                                <input type="text" class="form-control" id="username" name="username" required>
                            </div>
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" class="form-control" id="password" name="password" required>
                            </div>
                            <div class="d-grid gap-2">
                                <button type="submit" class="btn btn-primary btn-lg">Login</button>
                            </div>
                        </form>
                    </div>
                    <div class="card-footer text-center">
                        <p class="mb-0">Don't have an account? <a href="register.jsp" class="text-decoration-none">Register</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="Partials/footer.jsp" />

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <!-- Show SweetAlert on successful login -->
    <script>
        <% 
            if (registrationSuccess != null && registrationSuccess) {
        %>
            Swal.fire({
                title: 'Register Successful!',
                text: 'Please Login!',
                icon: 'success',
                confirmButtonText: 'OK',
                allowOutsideClick: false
            }).then((result) => {
                if (result.isConfirmed) {
                    // Redirect to the user dashboard after login
                    window.location.href = 'dashboard.jsp'; 
                }
            });
        <% } %>
    </script>

</body>
</html>
