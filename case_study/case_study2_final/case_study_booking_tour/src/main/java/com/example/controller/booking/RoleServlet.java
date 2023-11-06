package com.example.controller.booking;


import com.example.model.booking.BookingDto;
import com.example.model.booking.RoleDto;
import com.example.model.booking.Tours;
import com.example.service.booking.BookingService;
import com.example.service.booking.IBookingService;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "RoleServlet", value = "/RoleServlet")
public class RoleServlet extends HttpServlet {
    IBookingService service = new BookingService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if(action==null){
            action="";
        }
        switch (action){
            case "failure":
                try {
                    showFailure(request,response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                try {
                    showList(request,response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
        }

    }

    private void showChart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int month = Integer.parseInt(request.getParameter("month"));
        int year = Integer.parseInt(request.getParameter("year"));
        List<RoleDto> tours = service.displayChart(month,year);
        request.setAttribute("tours", tours);
        RequestDispatcher dispatcher = request.getRequestDispatcher("View/role.jsp");
        dispatcher.forward(request, response);
    }

    private void showSuccess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<RoleDto> tours = service.displaySuccess();
        request.setAttribute("tours", tours);
        RequestDispatcher dispatcher = request.getRequestDispatcher("View/role.jsp");
        dispatcher.forward(request, response);
    }

    private void showFailure(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        String startDate = request.getParameter("startDate");
        String endDate = request.getParameter("endDate");
        List<RoleDto> tours = service.displayFailure(startDate,endDate);
        request.setAttribute("tours", tours);
        RequestDispatcher dispatcher = request.getRequestDispatcher("View/role.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<RoleDto> tours = service.displayRole();
        request.setAttribute("tours", tours);
        RequestDispatcher dispatcher = request.getRequestDispatcher("View/role.jsp");
        dispatcher.forward(request, response);
    }
}