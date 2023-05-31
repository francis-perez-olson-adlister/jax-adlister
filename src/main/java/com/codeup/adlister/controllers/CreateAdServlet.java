package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }

        String titleValue = (String) request.getAttribute("titleValue");
        String descriptionValue = (String) request.getAttribute("descriptionValue");

        request.setAttribute("titleValue", titleValue);
        request.setAttribute("descriptionValue", descriptionValue);

        request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User loggedInUser = (User) request.getSession().getAttribute("user");
        String title = request.getParameter("title");
        String description = request.getParameter("description");

        boolean isValid = validateFormData(title, description);

        if (isValid) {
            Ad ad = new Ad(
                    loggedInUser.getId(),
                    title,
                    description
            );
            DaoFactory.getAdsDao().insert(ad);
            response.sendRedirect("/ads");
        } else {
            request.setAttribute("titleValue", title);
            request.setAttribute("descriptionValue", description);

            doGet(request, response); // Call doGet to display the form again with the entered values
        }
    }


    private boolean validateFormData(String title, String description) {

        return title != null && !title.isEmpty() && description != null && !description.isEmpty();
    }
}