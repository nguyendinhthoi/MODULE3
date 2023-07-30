package com.customermanagement.controller;

import com.customermanagement.model.Customer;
import com.customermanagement.service.CustomerService;
import com.customermanagement.service.ICustomerService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customers")
public class CustomerServlet extends HttpServlet {
    private ICustomerService customerService = new CustomerService();

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
            case "delete":
                showDeleteForm(request, response);
                break;
            case "view":
                viewCustomer(request, response);
                break;
            default:
                listCustomers(request, response);
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
                createCustomer(request, response);
                break;
            case "edit":
                updateCustomer(request, response);
                break;
            case "delete":
                deleteCustomer(request, response);
                break;
            default:
                break;
        }
    }


    private void listCustomers(HttpServletRequest request, HttpServletResponse response) {
        List<Customer> customerList = new ArrayList<>(customerService.findAll().values());
        request.setAttribute("customers", customerList);
        try {
            request.getRequestDispatcher("/views/customer/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/views/customer/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void createCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int id = (int) (Math.random() * 1000);

        Customer customer = new Customer(id, name, email, address);
        this.customerService.save(customer);
        request.setAttribute("message", "New customer was created");
        try {
            request.getRequestDispatcher("/views/customer/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findById(id);
        try {
            if (customer == null) {
                request.getRequestDispatcher("/views/customer/error-404.jsp").forward(request, response);
            } else {
                request.setAttribute("customer", customer);
                request.getRequestDispatcher("/views/customer/edit.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        Customer customer = customerService.findById(id);
        try {
            if (customer == null) {
                request.getRequestDispatcher("/views/customer/error-404.jsp").forward(request, response);
            } else {
                customer.setName(name);
                customer.setEmail(email);
                customer.setAddress(address);
                customerService.update(id, customer);
                request.setAttribute("customer", customer);
                request.setAttribute("message", "Customer information was updated");
                request.getRequestDispatcher("/views/customer/edit.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findById(id);
        try {
            if (customer == null) {
                request.getRequestDispatcher("/views/customer/error-404.jsp").forward(request, response);
            } else {
                request.setAttribute("customer", customer);
                request.getRequestDispatcher("/views/customer/delete.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }

    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findById(id);
        try {
            if (customer == null) {
                request.getRequestDispatcher("/views/customer/error-404.jsp").forward(request, response);
            } else {
                customerService.remove(id, true);
                response.sendRedirect("/customers");
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void viewCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findById(id);
        try {
            if (customer == null) {
                request.getRequestDispatcher("/views/customer/error-404.jsp").forward(request, response);
            } else {
                request.setAttribute("customer", customer);
                request.getRequestDispatcher("/views/customer/view.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}
