package com.example.case_study_tour.controller;

import com.example.case_study_tour.model.Tour;
import com.example.case_study_tour.model.TourListDTO;
import com.example.case_study_tour.model.TourPlace;
import com.example.case_study_tour.repository.ITourPlaceRepo;
import com.example.case_study_tour.service.ITourPlaceService;
import com.example.case_study_tour.service.ITourService;
import com.example.case_study_tour.service.TourPlaceService;
import com.example.case_study_tour.service.TourService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TourServlet", value = "/tourServlet")
public class TourServlet extends HttpServlet {
    ITourService tourService = new TourService();
    ITourPlaceService tourPlaceService = new TourPlaceService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                break;
            case "delete":
                break;
            default:
                showListTour(request, response);
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createTour(request, response);
                break;
            case "edit":
                break;
            case "delete":
                break;
            default:
                showListTour(request, response);
        }
    }


    private void showListTour(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<TourListDTO> tourList = tourService.displayDTO();
            request.setAttribute("tours", tourList);
            request.getRequestDispatcher("views/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<TourPlace> tourPlaces = tourPlaceService.displayCateP();
            request.setAttribute("place", tourPlaces);
            request.getRequestDispatcher("/views/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void createTour(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String desc = request.getParameter("desc");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String s_date = request.getParameter("s-date");
        String e_date = request.getParameter("e-date");
        String employee_name = request.getParameter("e-name");
        String s_place = request.getParameter("s-place");
        String e_place = request.getParameter("e-place");
        String type_place = request.getParameter("t-place-name");
        String image = request.getParameter("pic");

        TourListDTO tourListDTO = new TourListDTO(name, desc, price, quantity, s_date, e_date, employee_name, s_place, e_place, type_place, image);

        tourService.createTour(tourListDTO);
        try {
            request.setAttribute("tour", tourListDTO);
            request.setAttribute("message", "Bạn đã thêm mới tour thành công");
            request.getRequestDispatcher("/views/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }

    }

}