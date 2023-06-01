package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.AdDetailsServlet", urlPatterns = "/details")
public class AdDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Long details = Long.valueOf(req.getParameter("detailsBtn"));
        System.out.println(details);
        Ad ad = DaoFactory.getAdsDao().selectAdById(details);
        req.setAttribute("ad", ad);
        User user = DaoFactory.getUsersDao().findById(ad.getUserId());
        String email = user.getEmail();
        req.setAttribute("email", email);
        req.setAttribute("user", user);
        req.getRequestDispatcher("/WEB-INF/ads/details.jsp").forward(req, resp);
    }

}