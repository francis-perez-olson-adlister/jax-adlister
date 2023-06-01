package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.beans.Statement;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "controllers.AdsIndexServlet", urlPatterns = "/ads")
public class AdsIndexServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("ads", DaoFactory.getAdsDao().all());
        request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        System.out.println(id);
        String title = req.getParameter("title");
        System.out.println(title);
        String description = req.getParameter("description");
        System.out.println(description);

        Ad ad = DaoFactory.getAdsDao().selectAdById(Long.valueOf(id));
        req.getSession().setAttribute("ad", ad);

        ad.setTitle(title);
        ad.setDescription(description);
        DaoFactory.getAdsDao().update(ad);

        resp.sendRedirect("/profile");
    }
}
