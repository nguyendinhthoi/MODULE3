package com.example.ss9.repository;

import com.example.ss9.model.Student;

import java.util.List;

public interface IStudentRepository {
    List<Student> getAll();

    void addStudent(Student student);
}
