package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the previous input values from the request attributes
        String username = (String) request.getAttribute("username");
        String email = (String) request.getAttribute("email");

        // Set the input values as request attributes
        request.setAttribute("username", username);
        request.setAttribute("email", email);

        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");

        boolean inputHasErrors = username.isEmpty() || email.isEmpty() || password.isEmpty() || (!password.equals(passwordConfirmation));

        if (inputHasErrors) {
            // Set the input values as request attributes for the next rendering of the form
            request.setAttribute("username", username);
            request.setAttribute("email", email);

            response.sendRedirect("/register");
            return;
        }

        // Check if the username or email already exists in the database
        boolean usernameExists = DaoFactory.getUsersDao().findByUsername(username) != null;
        boolean emailExists = DaoFactory.getUsersDao().findByEmail(email) != null;

        if (usernameExists) {
            request.setAttribute("usernameError", "Username is not available.");
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
            return;
        }

        if (emailExists) {
            request.setAttribute("emailError", "Email is already registered.");
            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
            return;
        }

        User user = new User(username, email, password);
        String hash = Password.hash(user.getPassword());
        user.setPassword(hash);
        DaoFactory.getUsersDao().insert(user);
        response.sendRedirect("/login");
    }

}

