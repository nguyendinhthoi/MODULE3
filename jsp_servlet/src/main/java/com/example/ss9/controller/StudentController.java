package com.example.ss9.controller;

import com.example.ss9.model.Student;
import com.example.ss9.service.IStudentService;
import com.example.ss9.service.impl.StudentService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StudentController", value = "/students")
public class StudentController extends HttpServlet {
    private static IStudentService studentService = new StudentService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {

                request.getRequestDispatcher("student/create.jsp").forward(request, response);
                break;
            }
            default:
                List<Student> studentList = studentService.getAll();
                if (studentList.size() == 0) {
                    request.setAttribute("students", null);
                } else {
                    request.setAttribute("students", studentList);
                }
                request.getRequestDispatcher("student/list.jsp").forward(request, response);
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws
            ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                int code = Integer.parseInt(request.getParameter("code"));
                String nameStudent = request.getParameter("nameStudent");
                String idCard = request.getParameter("idCard");
                Double point = Double.valueOf(request.getParameter("point"));
                int codeClass = Integer.parseInt(request.getParameter("codeClass"));
                Student student = new Student(code, nameStudent, point, idCard, codeClass);
                studentService.addStudent(student);
                response.sendRedirect("/students");
                break;
        }
    }
}
