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
        System.out.println(username);
        System.out.println(email);
        System.out.println(password);
        System.out.println(passwordConfirmation);
        User user = DaoFactory.getUsersDao().findById(userId);
        String hash = Password.hash(password);

        boolean inputHasErrors = username.isEmpty() || email.isEmpty() || password.isEmpty() || (!password.equals(passwordConfirmation));

        if (inputHasErrors) {
            resp.sendRedirect("/profile/update");
        } else {
            user.setUsername(username);
            user.setEmail(email);
            user.setPassword(hash);
            DaoFactory.getUsersDao().update(user);
            resp.sendRedirect("/profile");
        }

    }
}
