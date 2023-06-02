package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UpdateUserServlet", urlPatterns = "/profile/update")
public class UpdateUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/WEB-INF/updateProfile.jsp").forward(req, resp);
        String username = req.getParameter("updateButton");
        User user = DaoFactory.getUsersDao().findByUsername(username);
        req.setAttribute("user", user);
        System.out.println(user.getEmail());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        Long userId = Long.valueOf(req.getParameter("userId"));
        String passwordConfirmation = req.getParameter("confirm_password");

        User user = DaoFactory.getUsersDao().findById(userId);
        String hash = Password.hash(password);

        boolean inputHasErrors = username.isEmpty() || email.isEmpty() || (!password.equals(passwordConfirmation)) || password.length() < 10;
        boolean noSpecialChar = (!(password.contains("!") || password.contains("@") || password.contains("#") || password.contains("$") || password.contains("%") || password.contains("^") || password.contains("&") || password.contains("*")));

        if (inputHasErrors || noSpecialChar) {
            String errorMessage = "Password must be at least 10 characters long with at least one special character.";
            req.setAttribute("error", errorMessage);
            req.getRequestDispatcher("/WEB-INF/updateProfile.jsp").forward(req, resp);
        } else {
            user.setUsername(username);
            user.setEmail(email);
            user.setPassword(hash);
            DaoFactory.getUsersDao().update(user);
            req.getSession().invalidate();
            resp.sendRedirect("/profile");
        }
    }
}
