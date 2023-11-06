package com.example.controller.customer;

import com.example.model.customer.Customer;
import com.example.service.customer.ICustomerService;
import com.example.service.customer.impl.CustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "CustomerServlet", value = "/CustomerServlet")
public class CustomerServlet extends HttpServlet {
    private ICustomerService customerService = new CustomerService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "deleteCustomer":
                deleteCustomer(request, response);
                break;
            case "showFormEdit":
                showFormEdit(request, response);
                break;
            case "showFormCreate":
                showFormCreate(request, response);
                break;
            case "showList":
                showList(request, response);
                break;
            case "detail":
                showDetail(request, response);
                break;
            default:
                showList(request, response);
//            RequestDispatcher requestDispatcher = request.getRequestDispatcher("home/index.jsp");
//            requestDispatcher.forward(request,response);

        }

    }

    private void showDetail(HttpServletRequest request, HttpServletResponse response) {
        int accountId = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.getDetail(accountId);

            try {
                if (customer==null){
                    response.sendRedirect("views/accounnt/error.jsp");
                }else {
                    request.setAttribute("customer", customer);
                    request.getRequestDispatcher("views/customer/detail.jsp").forward(request,response);
                }

            } catch (IOException | ServletException e) {
                throw new RuntimeException(e);
            }

    }

    private void showFormCreate(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/customer/add.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showFormEdit(HttpServletRequest request, HttpServletResponse response) {
        int idCustomer = Integer.parseInt(request.getParameter("customer_id"));
        Customer customer = customerService.getCustomerById(idCustomer);
        request.setAttribute("customer", customer);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/customer/edit.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int idCustomer = Integer.parseInt(request.getParameter("customer_id"));
        customerService.deleteCustomerById(idCustomer);
        try {
            response.sendRedirect("/CustomerServlet");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void showList(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = customerService.getAll();
        request.setAttribute("customerList", customerList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("views/customer/list.jsp");
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "editCustomer":
                editCustomer(request, response);
                break;
            case "addCustomer":
                addCustomer(request, response);
                break;
        }
    }

    private void addCustomer(HttpServletRequest request, HttpServletResponse response) {
        String id = request.getParameter("Id");
        String name = request.getParameter("Name");
        String idCard = request.getParameter("IdCard");
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        Customer customer = new Customer(id,name,idCard,gender,email,phone,address);


        String phonePattern = "^(0\\d{9})$";
        Pattern pattern = Pattern.compile(phonePattern);
        Matcher matcher = pattern.matcher(phone);
        try {
            if (!matcher.matches()) {
                // Số điện thoại không hợp lệ, hiển thị thông báo lỗi
                request.setAttribute("error", "Số điện thoại không hợp lệ");
                request.setAttribute("customer",customer);
                request.getRequestDispatcher("views/customer/add.jsp").forward(request, response);
            } else {
                customerService.addCustomer(customer);
                request.setAttribute("message", "Bạn đã thêm mới thành công");
                request.getRequestDispatcher("views/customer/add.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void editCustomer(HttpServletRequest request, HttpServletResponse response) {
        boolean newGender = false;
        int customerId = Integer.parseInt(request.getParameter("Id"));
        String customerName = request.getParameter("Name");
        String customerIdCard = request.getParameter("IdCard");
        int gender = Integer.parseInt(request.getParameter("gender")) ;
        if (gender==1){
            newGender= true;
        }else {
            newGender=false;
        }
        String customerEmail = request.getParameter("email");
        String customerPhone = request.getParameter("phone");
        String customerAddress = request.getParameter("address");
        int customerTypeId = Integer.parseInt(request.getParameter("typeId"));
        int accountId = Integer.parseInt(request.getParameter("accountId"));
//        boolean isDelete = request.getParameter("isDelete").equals("Delete");
        Customer customer = new Customer(customerId, customerName, customerIdCard, newGender, customerEmail, customerPhone, customerAddress, customerTypeId, accountId);

        String phonePattern = "^(0\\d{9})$";
        Pattern pattern = Pattern.compile(phonePattern);
        Matcher matcher = pattern.matcher(customerPhone);
        try {
            if (!matcher.matches()) {
                // Số điện thoại không hợp lệ, hiển thị thông báo lỗi
                request.setAttribute("error", "Số điện thoại không hợp lệ");
                request.setAttribute("customer",customer);
                request.getRequestDispatcher("views/customer/edit.jsp").forward(request, response);
            } else {
                customerService.updateCustomer(customer);
                request.setAttribute("message", "Bạn đã sửa thành công");
                request.getRequestDispatcher("views/customer/edit.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
