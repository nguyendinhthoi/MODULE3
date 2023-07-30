package com.example.ss9.service.impl;

import com.example.ss9.model.Student;
import com.example.ss9.repository.IStudentRepository;
import com.example.ss9.repository.impl.StudentRepository;
import com.example.ss9.service.IStudentService;

import java.util.List;

public class StudentService implements IStudentService {
    private static IStudentRepository studentRepository = new StudentRepository();
    @Override
    public List<Student> getAll() {
        return studentRepository.getAll();
    }

    @Override
    public void addStudent(Student student) {
        studentRepository.addStudent(student);
    }

}
