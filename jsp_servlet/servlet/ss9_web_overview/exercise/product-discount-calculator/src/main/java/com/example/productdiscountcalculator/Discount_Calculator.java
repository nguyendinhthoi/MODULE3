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

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>Description Of Product : " + desc + "</h1>");
        writer.println("<br>");
        writer.println("The price and the the percent are :" + price + " , " + percent);
        writer.println("<br>");
        writer.println("The Discount Amount after Calculate is : " + discount_amount);
        writer.println("<br>");
        writer.println("The Discount Price after minus Discount Amount is : " + discount_price);
    }
}