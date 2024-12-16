/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.UserDAO;
import model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


public class UserServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "new":
                request.getRequestDispatcher("register.jsp").forward(request, response);
                break;
            case "edit":
                int id = Integer.parseInt(request.getParameter("id"));
                User existingUser = userDAO.getUserById(id);
                request.setAttribute("user", existingUser);
                request.getRequestDispatcher("useredit.jsp").forward(request, response);
                break;
            case "delete":
                id = Integer.parseInt(request.getParameter("id"));
                userDAO.deleteUser(id);
                
                request.getSession().setAttribute("deleteSuccess", true);
                response.sendRedirect("UserServlet");
                break;
            default:
                List<User> users = userDAO.getAllUsers();
                if (users == null || users.isEmpty()) {
                    users = new ArrayList<>();  // Default empty list
                }
                request.setAttribute("users", users);
                request.getRequestDispatcher("userlist.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "create";

        switch (action) {
            case "create":
                String name = request.getParameter("name");
                String username = request.getParameter("username");
                String email = request.getParameter("email");
                String password = request.getParameter("password");

                // Cek apakah username sudah ada
                if (userDAO.isUsernameExist(username)) {
                    // Redirect ke halaman registrasi dengan pesan error
                    response.sendRedirect("register.jsp?error=usernameExists");
                } else {
                    // Jika username tidak ada, tambahkan user baru
                    User newUser = new User();
                    newUser.setName(name);
                    newUser.setUsername(username);
                    newUser.setEmail(email);
                    newUser.setPassword(password);
                    userDAO.addUser(newUser);
                    
                    // Set session attribute to indicate successful registration
                    request.getSession().setAttribute("registrationSuccess", true);

                    // Redirect ke halaman sukses
                    response.sendRedirect("login.jsp");
                }
                break;

            case "update":
                User updatedUser = new User();
                updatedUser.setId(Integer.parseInt(request.getParameter("id")));
                updatedUser.setName(request.getParameter("name"));
                updatedUser.setUsername(request.getParameter("username"));
                updatedUser.setEmail(request.getParameter("email"));
                updatedUser.setPassword(request.getParameter("password"));
                userDAO.updateUser(updatedUser);
                request.getSession().setAttribute("showUpdateSuccess", true);
                response.sendRedirect("UserServlet");
                break;
        }
    }

}
