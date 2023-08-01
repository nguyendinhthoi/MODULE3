package com.example.case_study_tour.controller;

import com.example.case_study_tour.service.ITourService;
import com.example.case_study_tour.service.TourService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "TourServlet", value = "/TourServlet")
public class TourServlet extends HttpServlet {
    ITourService tourService = new TourService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action = "";
        }
        switch (action){
            case "create":
                break;
            case "edit":
                break;
            case "delete":
                break;
            default:
                showListTour(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    private void showListTour(HttpServletRequest request, HttpServletResponse response) {
    }

}