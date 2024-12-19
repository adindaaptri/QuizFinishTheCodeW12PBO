<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ page import="model.User" %>
<%
    // Check if the user ID is available in the request (if it's null or invalid, redirect to the user list)
    String userId = request.getParameter("id");
    if (userId == null || userId.isEmpty()) {
        response.sendRedirect("userlist.jsp");
        return;  // Stop further processing of the page
    }
    // Fetch the user object based on the ID
    User user = (User) request.getAttribute("user");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light">
    
    <!-- Navbar -->
    <jsp:include page="Partials/navbar.jsp" />

    <!-- Container for Edit Form -->
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <div class="card shadow-lg border-0 rounded-3">
                    <div class="card-header bg-primary text-white text-center">
                        <h4>Edit User</h4>
                    </div>
                    <div class="card-body">
                        <!-- Edit User Form -->
                        <form action="UserServlet" method="post">
                            <input type="hidden" name="action" value="update">
                            <input type="hidden" name="id" value="<%= user.getId() %>">

                            <!-- Name Input -->
                            <div class="mb-3">
                                <label for="name" class="form-label">Name</label>
                                <input type="text" id="name" name="name" value="<%= user.getName() %>" class="form-control" required>
                            </div>

                            <!-- Username Input -->
                            <div class="mb-3">
                                <label for="username" class="form-label">Username</label>
                                <input type="text" id="username" name="username" value="<%= user.getUsername() %>" class="form-control" required>
                            </div>

                            <!-- Email Input -->
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" id="email" name="email" value="<%= user.getEmail() %>" class="form-control" required>
                            </div>

                            <!-- Password Input -->
                            <div class="mb-3">
                                <label for="password" class="form-label">Password</label>
                                <input type="password" id="password" name="password" value="<%= user.getPassword() %>" class="form-control" required>
                            </div>

                            <!-- Submit Button -->
                            <div class="text-center">
                                <button type="submit" class="btn btn-primary">Update</button>
                            </div>
                        </form>
                    </div>
                    <div class="card-footer text-center">
                        <a href="UserServlet" class="btn btn-secondary">Back to User List</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <jsp:include page="Partials/footer.jsp" />
    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
