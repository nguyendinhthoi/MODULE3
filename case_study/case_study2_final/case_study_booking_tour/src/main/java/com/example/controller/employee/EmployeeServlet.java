package com.example.controller.employee;


import com.example.model.employee.Employee;
import com.example.model.employee.EmployeeType;
import com.example.model.employee.dto.EmployeeListDto;
import com.example.service.customer.ICustomerService;
import com.example.service.customer.impl.CustomerService;
import com.example.service.employee.IEmployeeService;
import com.example.service.employee.IEmployeeTypeService;
import com.example.service.employee.impl.EmployeeService;
import com.example.service.employee.impl.EmployeeTypeService;
import com.example.service.tour.ITourService;
import com.example.service.tour.TourService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.awt.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet(name = "EmployeeServlet", value = "/employeeServlet")
public class EmployeeServlet extends HttpServlet {
    IEmployeeTypeService employeeTypeService = new EmployeeTypeService();
    IEmployeeService employeeService = new EmployeeService();
    ITourService tourService = new TourService();
    ICustomerService customerService = new CustomerService();

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
            case "detail":
                showDetail(request, response);
                break;
            case "statistical":
                showStatistical(request, response);
                break;
            default:
                showListEmployee(request, response);
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
                createEmployee(request, response);
                break;
            case "edit":
                editEmployee(request, response);
                break;
            case "delete":
                deleteEmployee(request, response);
                break;
            default:
                showListEmployee(request, response);
                break;
        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("code"));
        Employee employee = employeeService.findEmployee(id);
        try {
            if (employee == null) {
                request.getRequestDispatcher("views/employee/error.jsp").forward(request, response);
            } else {
                employeeService.deleteEmployee(id);
                response.sendRedirect("/employeeServlet");
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void editEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        int gender = Integer.parseInt(request.getParameter("gender"));
        int typeId = Integer.parseInt(request.getParameter("typeId"));

        Employee employee = employeeService.findEmployee(id);

        Employee employee1 = new Employee(id, name, phone, email, gender, typeId);

        String phonePattern = "^(0\\d{9})$";
        Pattern pattern = Pattern.compile(phonePattern);
        Matcher matcher = pattern.matcher(phone);
        try {
            if (!matcher.matches()) {
                List<EmployeeType> employeeTypes = employeeTypeService.getAll();
                request.setAttribute("type", employeeTypes);
                request.setAttribute("error", "Số điện thoại không hợp lệ");
                request.setAttribute("employee", employee1);
                request.getRequestDispatcher("views/employee/edit.jsp").forward(request, response);
//                request.getRequestDispatcher("employee/error.jsp").forward(request, response);
            } else {
                employeeService.editEmployee(id, employee1);
                List<EmployeeType> employeeTypes = employeeTypeService.getAll();
                request.setAttribute("employee", employee1);
                request.setAttribute("type", employeeTypes);
                request.setAttribute("message", "Bạn đã cập nhật thành công");
                request.getRequestDispatcher("views/employee/edit.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }


    private void createEmployee(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String employeeName = request.getParameter("name");
        String employeePhone = request.getParameter("phone");
        String employeeEmail = request.getParameter("email");
        int gender = Integer.parseInt(request.getParameter("gender"));
        int employeeTypeId = Integer.parseInt(request.getParameter("typeId"));
        Employee employee = new Employee(employeeName, employeePhone, employeeEmail, gender, employeeTypeId);

        String phonePattern = "^(0\\d{9})$";
        Pattern pattern = Pattern.compile(phonePattern);
        Matcher matcher = pattern.matcher(employeePhone);
        try {
            if (!matcher.matches()) {
                // Số điện thoại không hợp lệ, hiển thị thông báo lỗi
                List<EmployeeType> employeeTypes = employeeTypeService.getAll();
                request.setAttribute("type", employeeTypes);
                request.setAttribute("error", "Số điện thoại không hợp lệ");
                request.setAttribute("employee", employee);
                request.getRequestDispatcher("views/employee/create.jsp").forward(request, response);
            } else {
                employeeService.createEmployee(employee);
                request.setAttribute("message", "Bạn đã thêm mới nhân viên thành công");
                request.getRequestDispatcher("views/employee/create.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showListEmployee(HttpServletRequest request, HttpServletResponse response) {
        try {
            List<EmployeeListDto> employeeList = employeeService.getAllDto();
            if (employeeList.size() == 0) {
                request.setAttribute("employee", null);
                request.getRequestDispatcher("views/employee/list.jsp").forward(request, response);
            } else {
                request.setAttribute("employee", employeeList);
                request.getRequestDispatcher("views/employee/list.jsp").forward(request, response);
            }

        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showDetail(HttpServletRequest request, HttpServletResponse response) {
        List<EmployeeListDto> employeeList = employeeService.getAllDto();
        request.setAttribute("employee", employeeList);
        request.getRequestDispatcher("views/employee/detail.jsp");
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = employeeService.findEmployee(id);
        try {
            if (employee == null) {
                request.getRequestDispatcher("views/employee/error.jsp").forward(request, response);
            } else {
                List<EmployeeType> employeeTypes = employeeTypeService.getAll();
                request.setAttribute("employee", employee);
                request.setAttribute("type", employeeTypes);
                request.getRequestDispatcher("views/employee/edit.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws RuntimeException {
        try {
            List<EmployeeType> employeeTypes = employeeTypeService.getAll();
            request.setAttribute("type", employeeTypes);
            request.getRequestDispatcher("views/employee/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showStatistical(HttpServletRequest request, HttpServletResponse response) {
        try {
            int count = employeeService.sumCount();
            int countTour = tourService.sumCountTour();
            int countCus = customerService.sumCountCus();
            request.setAttribute("countCus",countCus);
            request.setAttribute("countTour", countTour);
            request.setAttribute("count", count);
            request.getRequestDispatcher("statistical.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
