<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <!-- DataTables CSS -->
    <link href="https://cdn.datatables.net/2.1.8/css/dataTables.bootstrap5.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <%
        Boolean showUpdateSuccess = (Boolean) session.getAttribute("showUpdateSuccess");
        Boolean deleteSuccess = (Boolean) session.getAttribute("deleteSuccess");

        if ((showUpdateSuccess != null && showUpdateSuccess) || (deleteSuccess != null && deleteSuccess)) {
            // Reset the flags to prevent the alert from showing again
            session.setAttribute("showUpdateSuccess", false);
            session.setAttribute("deleteSuccess", false);
    %>
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            // Show SweetAlert based on which flag is set
            <% if (showUpdateSuccess != null && showUpdateSuccess) { %>
                Swal.fire({
                    title: 'Update Successful!',
                    text: 'The user data has been updated successfully.',
                    icon: 'success',
                    confirmButtonText: 'OK',
                    allowOutsideClick: false
                });
            <% } else if (deleteSuccess != null && deleteSuccess) { %>
                Swal.fire({
                    title: 'Delete Successful!',
                    text: 'The user has been deleted successfully.',
                    icon: 'success',
                    confirmButtonText: 'OK',
                    allowOutsideClick: false
                });
            <% } %>
        });
    </script>
    <%
        }
    %>

</head>
<body class="bg-light">
    
    <!-- Navbar -->
    <jsp:include page="Partials/navbar.jsp" />

    <!-- Container for User List -->
    <div class="container py-5 px-5" style="min-height: 100vh">
        <div class="row justify-content-center align-items-center">
            <div class="col-lg-12">
                <div class="card shadow-lg border-0 rounded-3">
                    <div class="card-header text-center bg-primary text-white">
                        <h4>User List</h4>
                    </div>
                    <div class="card-body">
                        <!-- Table for Users -->
                        <table id="userTable" class="table table-striped table-bordered" style="width: 100%">
                            <thead>
                                <tr>
                                    <th class="text-center">No</th>
                                    <th class="text-center">Name</th>
                                    <th class="text-center">Username</th>
                                    <th class="text-center">Email</th>
                                    <th class="text-center">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% 
                                    int no = 1;
                                    List<model.User> users = (List<model.User>) request.getAttribute("users");
                                    if (users != null && !users.isEmpty()) {
                                        for (model.User user : users) {
                                %>
                                <tr>
                                    <td class="text-center"><%= no++ %></td>
                                    <td><%= user.getName() %></td>
                                    <td><%= user.getUsername() %></td>
                                    <td><%= user.getEmail() %></td>
                                    <td class="text-center">
                                        <a href="UserServlet?action=edit&id=<%= user.getId() %>" class="btn btn-warning btn-sm">Edit</a> 
                                        <button class="btn btn-danger btn-sm" data-bs-toggle="modal" data-bs-target="#deleteModal" data-id="<%= user.getId() %>">Delete</button>
                                    </td>
                                </tr>
                                <% 
                                        }
                                    }
                                %>
                                
                            </tbody>
                        </table>

                    </div>
                    <div class="card-footer text-center">
                        <a href="register.jsp" class="btn btn-success">Add New User</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
                            
    <!-- Modal for Delete Confirmation-->
    <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="deleteModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteModalLabel">Delete User</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Are you sure you want to delete this user?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <a id="deleteConfirmBtn" class="btn btn-danger" href="#">Delete</a>
                </div>
            </div>
        </div>
    </div>
                            
    <jsp:include page="Partials/footer.jsp" />

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
    
    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/2.1.8/js/dataTables.js"></script>
    <script src="https://cdn.datatables.net/2.1.8/js/dataTables.bootstrap5.js"></script>

    <!-- Initialize DataTable -->
    <script>
        $(document).ready(function() {
            $('#userTable').DataTable({
                paging: true,  // Enables paging
                searching: true, // Enables searching
                info: true  // Shows table info
            });

            // Capture click event for Delete button and set the ID in the modal
            $('#deleteModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget);  // Button that triggered the modal
                var userId = button.data('id');  // Extract info from data-* attributes
                var deleteUrl = 'UserServlet?action=delete&id=' + userId;

                // Set the href of the delete confirmation button
                var modal = $(this);
                modal.find('#deleteConfirmBtn').attr('href', deleteUrl);
            });
        });
    </script>
    
</body>
</html>
