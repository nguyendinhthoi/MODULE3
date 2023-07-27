import com.example.caculatorapp.Calculator;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CalculatorServlet", value = "/calculate")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double fNumber = Double.parseDouble(request.getParameter("f-operand"));
        double sNumber = Double.parseDouble(request.getParameter("s-operand"));
        String operator = request.getParameter("operator");

        PrintWriter writer = response.getWriter();
        writer.println("<html>");
        writer.println("<h1>Result : </h1>");
        try {
            double result = Calculator.calculate(fNumber, sNumber, operator);
            writer.println(fNumber + " " + operator + " " + sNumber + " = " + result);
        } catch (Exception e) {
            writer.println("Error : "+e.getMessage());
        }
        writer.println("</html>");
    }
}