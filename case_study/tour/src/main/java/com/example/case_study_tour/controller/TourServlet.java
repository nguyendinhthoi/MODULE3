package com.example.case_study_tour.controller;


import com.example.case_study_tour.model.ENameCate;
import com.example.case_study_tour.model.Tour;
import com.example.case_study_tour.model.dto.TourListDTO;
import com.example.case_study_tour.model.TourPlace;

import com.example.case_study_tour.service.*;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

@WebServlet(name = "TourServlet", value = "/tourServlet")
public class TourServlet extends HttpServlet {
    ITourService tourService = new TourService();
    ITourPlaceService tourPlaceService = new TourPlaceService();
    IENameCateService nameCateService = new ENameCateService();

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
                showEditForm(request, response);
                break;
            case "view":
                showViewForm(request, response);
                break;
            default:
                showListTour(request, response);
                break;
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
                editTour(request, response);
                break;
            case "delete":
                deleteTour(request, response);
                break;
            default:
                showListTour(request, response);
                break;
        }
    }


    private void showListTour(HttpServletRequest request, HttpServletResponse response) {
        try {
//            List<TourListDTO> tourList = tourService.displayDTO();
            List<TourListDTO> tourList = tourService.displayUnDel();
            request.setAttribute("tours", tourList);
            request.getRequestDispatcher("views/2.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<TourPlace> tourPlaces = tourPlaceService.displayCateP();
            List<ENameCate> eNameCates = nameCateService.displayCateN();
            request.setAttribute("nameEmployee", eNameCates);
            request.setAttribute("place", tourPlaces);
            request.getRequestDispatcher("/views/create1.jsp").forward(request, response);
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
        int employee_id = Integer.parseInt(request.getParameter("e-id"));
        String s_place = request.getParameter("s-place");
        String e_place = request.getParameter("e-place");
        int type_place_id = Integer.parseInt(request.getParameter("t-place-id"));
        String image1 = request.getParameter("pic1");
        String image2 = request.getParameter("pic2");
        String image3 = request.getParameter("pic3");

        List<String> listImage = new ArrayList<>();
        listImage.add(image1);
        listImage.add(image2);
        listImage.add(image3);

        Tour tour = new Tour(name, desc, price, quantity, s_date, e_date, employee_id, s_place, e_place, type_place_id, listImage);

        List<TourPlace> tourPlaces = tourPlaceService.displayCateP();
        List<ENameCate> eNameCates = nameCateService.displayCateN();

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");

        try {
            LocalDate startDateBefore = LocalDate.parse(s_date);
            LocalDate currentDate = LocalDate.now();
            if (startDateBefore.isBefore(currentDate)) {
                request.setAttribute("place", tourPlaces);
                request.setAttribute("nameEmployee", eNameCates);
                request.setAttribute("tour", tour);
                request.setAttribute("messageDB", "Ngày bắt đầu không thể ở trong quá khứ");
                request.getRequestDispatcher("/views/create1.jsp").forward(request, response);
            } else {
                Date startDate = simpleDateFormat.parse(s_date);
                Date endDate = simpleDateFormat.parse(e_date);
                if (endDate.compareTo(startDate) > 0) {

                    ENameCate eNameCate;

                    eNameCate = nameCateService.getIdAvailable(employee_id, s_date, e_date);
                    if (eNameCate == null) {
                        tourService.createTour(tour);
                        nameCateService.updateCate();

                        request.setAttribute("message", "Bạn đã thêm mới thành công");
                        request.getRequestDispatcher("/views/create1.jsp").forward(request, response);
                    } else {
                        if (employee_id == eNameCate.getEmployeeId()) {
                            request.setAttribute("place", tourPlaces);
                            request.setAttribute("nameEmployee", eNameCates);
                            request.setAttribute("tour", tour);
                            request.setAttribute("messageE", "Hướng dẫn viên này đang bận");
                            request.getRequestDispatcher("/views/create1.jsp").forward(request, response);
                        } else {
                            tourService.createTour(tour);
                            nameCateService.updateCate();

                            request.setAttribute("message", "Bạn đã thêm mới thành công");
                            request.getRequestDispatcher("/views/create1.jsp").forward(request, response);
                        }
                    }
                } else {
                    request.setAttribute("place", tourPlaces);
                    request.setAttribute("nameEmployee", eNameCates);
                    request.setAttribute("tour", tour);
                    request.setAttribute("messageDate", "Ngày kết thúc phải sau ngày bắt đầu");
                    request.getRequestDispatcher("/views/create1.jsp").forward(request, response);
                }
            }
        } catch (ServletException | ParseException | IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void deleteTour(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("code"));
        Tour tour = tourService.findTour(id);
        try {
            if (tour == null) {
                request.getRequestDispatcher("/views/error.jsp").forward(request, response);
            } else {
                tourService.deleteTour(id);
                nameCateService.updateCateDel();
                response.sendRedirect("/tourServlet");
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));

        Tour tour = tourService.findTour(id);
        try {
            if (tour == null) {
                request.getRequestDispatcher("/views/error.jsp").forward(request, response);
            } else {
                List<String> listImage = tour.getImage();
                List<TourPlace> tourPlaces = tourPlaceService.displayCateP();
                List<ENameCate> eNameCates = nameCateService.displayCateN();

                request.setAttribute("img1", listImage.get(0));
                request.setAttribute("img2", listImage.get(1));
                request.setAttribute("img3", listImage.get(2));
                request.setAttribute("nameEmployee", eNameCates);
                request.setAttribute("tour", tour);
                request.setAttribute("place", tourPlaces);
                request.getRequestDispatcher("/views/edit1.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void editTour(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));

        String name = request.getParameter("name");
        String desc = request.getParameter("desc");
        double price = Double.parseDouble(request.getParameter("price"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        String s_date = request.getParameter("s-date");
        String e_date = request.getParameter("e-date");
        int employee_id = Integer.parseInt(request.getParameter("e-id"));
        String s_place = request.getParameter("s-place");
        String e_place = request.getParameter("e-place");
        int type_place = Integer.parseInt(request.getParameter("t-place-id"));

        String image1 = request.getParameter("pic1");
        String image2 = request.getParameter("pic2");
        String image3 = request.getParameter("pic3");
        Tour tour = tourService.findTour(id);

        List<String> listImageTour = tour.getImage();
        List<String> listImage = new ArrayList<>();


        if (Objects.equals(image1, "")) {
            listImage.add(listImageTour.get(0));
        } else {
            listImage.add(image1);
        }
        if (Objects.equals(image2, "")) {
            listImage.add(listImageTour.get(1));
        } else {
            listImage.add(image2);
        }
        if (Objects.equals(image3, "")) {
            listImage.add(listImageTour.get(2));
        } else {
            listImage.add(image3);
        }


        Tour tour1 = new Tour(name, desc, price, quantity, s_date, e_date, employee_id, s_place, e_place, type_place, listImage);
        try {
            if (tour == null) {
                request.getRequestDispatcher("/views/error.jsp").forward(request, response);
            } else {
                tourService.editTour(id, tour1);
                List<TourPlace> tourPlaces = tourPlaceService.displayCateP();
                request.setAttribute("tour", tour1);
                request.setAttribute("place", tourPlaces);
                request.setAttribute("message", "Đã cập nhật thành công");
                request.getRequestDispatcher("/views/edit1.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showViewForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            TourListDTO tourListDTO = tourService.findTourDTO(id);
            List<String> listImage = tourListDTO.getImage();
            if (tourListDTO == null) {
                request.getRequestDispatcher("/views/error.jsp").forward(request, response);
            } else {
                request.setAttribute("tour", tourListDTO);
                request.setAttribute("image1", listImage.get(0));
                request.setAttribute("image2", listImage.get(1));
                request.setAttribute("image3", listImage.get(2));
                request.getRequestDispatcher("/views/view.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}

