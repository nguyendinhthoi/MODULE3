package com.example.controller.booking;

import com.example.model.booking.BookingDto;
import com.example.model.booking.FromDto;
import com.example.model.booking.RoleDto;
import com.example.service.booking.BookingService;
import com.example.service.booking.IBookingService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.List;

@WebServlet(name = "BookingServlet", value = "/BookingServlet")
public class BookingServlet extends HttpServlet {
    IBookingService service = new BookingService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String count = request.getParameter("count");
        if (action == null) {
            action = "";
        }
//        if(count.equals(tang))

        switch (action) {
            case "form":
                try {
                    showForm(request,response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "addquantitylist":
                try {
                    addQuantityList(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "checkquantity":
                try {
                    checkQuantity(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "addquantitycart":
                try {
                    addQuantityCart(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "deletequantitycart":
                try {
                    deleteQuantityCart(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "deletecart":
                try {
                    deleteCart(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "success":
                try {
                    success(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            case "list":
                try {
                    quantitylist(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
            default:
                try {
                    showList(request, response);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;
        }
    }

    private void showForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
//        int customerId = Integer.parseInt(request.getParameter("customerid"));
        FromDto fromDto = service.displayFrom(4);
        request.setAttribute("tourname",fromDto.getTourName());
        request.setAttribute("startdate",fromDto.getStartDate());
        request.setAttribute("enddate",fromDto.getEndDate());
        request.setAttribute("price",fromDto.getPrice());
        request.setAttribute("sum",fromDto.getSumPrice());
        request.setAttribute("quantity",fromDto.getQuantity());
        request.setAttribute("image",fromDto.getImg());
        RequestDispatcher dispatcher = request.getRequestDispatcher("views/booking/form.jsp");
        dispatcher.forward(request, response);
    }

    private void checkQuantity(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {

        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int id = Integer.parseInt(request.getParameter("id"));
        int check = service.checkQuantity(id, 4, quantity);
        String listRedirectURL = "";
        if (check == 1) {
            listRedirectURL = "/BookingServlet?checkQuantity=0";
        } else {
            listRedirectURL = "/BookingServlet?action=addquantitylist&id=" + id ;
        }
        response.sendRedirect(listRedirectURL);
    }



    private void success(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
//        String check = "true";
//        request.setAttribute("check", check);
        service.success(4);
        List<BookingDto> bookings = service.display(4);
        request.setAttribute("bookings", bookings);
        double sum = 0;
        for (BookingDto bookingDto : bookings) {
            sum += bookingDto.getTourSumPrice();
        }
        request.setAttribute("sum", sum);
        response.sendRedirect("/BookingServlet?");
    }

    private void deleteCart(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
//        int idCustomer = Integer.parseInt(request.getParameter("idcustomer"));
        int id = Integer.parseInt(request.getParameter("id"));
        service.deleteQuantityCart(id, 4);
        response.sendRedirect("/BookingServlet?checkQuantity=true");
    }



    private void addQuantityCart(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
//        int idCustomer = Integer.parseInt(request.getParameter("idcustomer"));
        int id = Integer.parseInt(request.getParameter("id"));
        service.addQuantity(id, 4);
        response.sendRedirect("/BookingServlet");
    }

    private void quantitylist(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
//        int customerId = Integer.parseInt(request.getParameter("customerid"));
        int id = Integer.parseInt(request.getParameter("id"));
        service.quantityList(4);
        response.sendRedirect("/BookingServlet?action=addquantitylist&id=" + id );
    }
    private void deleteQuantityCart(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
//        int idCustomer = Integer.parseInt(request.getParameter("idcustomer"));
        int id = Integer.parseInt(request.getParameter("id"));
        service.deleteQuantity(id, 4);
        response.sendRedirect("/BookingServlet");
    }

    private void addQuantityList(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
//      int idCustomer = Integer.parseInt(request.getParameter("idcustomer"));
        int id = Integer.parseInt(request.getParameter("id"));
        service.addQuantity(id, 4);
        response.sendRedirect("/BookingServlet?id="+id );

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

//    private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
//        String checkQuantity = "true";
//        String checkk = request.getParameter("checkQuantity");
//        if(checkk == null){
//            checkk="";
//        }
//        if (checkk.equals("0")) {
//            checkQuantity = "false";
//        }
//        String check = "false";
//        request.setAttribute("check", check);
//        request.setAttribute("checkQuantity", checkQuantity);
//        List<BookingDto> bookings = service.display(2);
//        if(bookings.equals("")){
//           response.sendRedirect("/tourServlet");
//        }
//        request.setAttribute("bookings", bookings);
//        double sum = 0;
//        for (BookingDto bookingDto : bookings) {
//            sum += bookingDto.getTourSumPrice();
//        }
//        DecimalFormat decimalFormat = new DecimalFormat("#,##0");
//        String formattedNumber = decimalFormat.format(sum);
//        request.setAttribute("sum", formattedNumber);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("View/cart.jsp");
//        dispatcher.forward(request, response);
//    }
private void showList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
    String checkQuantity = "true";
    String checkk = request.getParameter("checkQuantity");
    if (checkk == null) {
        checkk = "";
    }
    if (checkk.equals("0")) {
        checkQuantity = "false";
    }
    request.setAttribute("checkQuantity", checkQuantity);

    List<BookingDto> bookings = service.display(4);
    String check = "false";
    request.setAttribute("check", check);
    if (bookings.isEmpty()) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request, response);
        return;
    }

    request.setAttribute("bookings", bookings);
    double sum = 0;
    for (BookingDto bookingDto : bookings) {
        sum += bookingDto.getTourSumPrice();
    }
    DecimalFormat decimalFormat = new DecimalFormat("#,##0");
    String formattedNumber = decimalFormat.format(sum);
    request.setAttribute("sum", formattedNumber);
    RequestDispatcher dispatcher = request.getRequestDispatcher("views/booking/cart.jsp");
    dispatcher.forward(request, response);
}

}