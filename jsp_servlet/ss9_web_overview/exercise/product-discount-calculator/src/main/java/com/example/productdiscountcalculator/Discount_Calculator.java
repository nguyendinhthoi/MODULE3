package com.example.productdiscountcalculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "Discount_Calculator", value = "/display-discount")
public class Discount_Calculator extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String desc = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        double percent = Double.parseDouble(request.getParameter("percent"));

        double discount_amount = price * percent * 0.01;
        double discount_price = price - discount_amount;

        request.setAttribute("desc", desc);
        request.setAttribute("price", price);
        request.setAttribute("percent", percent);
        request.setAttribute("discount_amount", discount_amount);
        request.setAttribute("discount_price", discount_price);

        request.getRequestDispatcher("calculate.jsp").forward(request, response);
    }
}