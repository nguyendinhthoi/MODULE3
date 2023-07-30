package com.example.ss9.service;

import com.example.ss9.model.Student;

import java.util.List;

public interface IStudentService {
    List<Student> getAll();

    void addStudent(Student student);
}
