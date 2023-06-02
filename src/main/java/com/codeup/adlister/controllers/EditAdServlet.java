package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "EditAdServlet", urlPatterns = "/edit")
public class EditAdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String delete = req.getParameter("deleteButton");
        System.out.println(delete);

        if (delete != null) {
            DaoFactory.getAdsDao().delete(Long.valueOf(delete));
            resp.sendRedirect("/profile");
        } else {
            String edit = req.getParameter("editButton");
            Ad ad = DaoFactory.getAdsDao().selectAdById(Long.valueOf(edit));
            req.setAttribute("ad",ad);
            System.out.println(edit);
            req.getRequestDispatcher("/WEB-INF/ads/edit.jsp").forward(req, resp);
        }

    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
