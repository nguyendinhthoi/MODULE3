package com.example.ss9.repository.impl;

import com.example.ss9.model.Student;
import com.example.ss9.repository.IStudentRepository;

import java.util.ArrayList;
import java.util.List;

public class StudentRepository  implements IStudentRepository {
    private static List<Student> students = new ArrayList<>();

    static {
        students.add(new Student(1,"Haitt", 9.0, "22324",1));
        students.add(new Student(2,"TrungDP", 8.0, "22324",1));
        students.add(new Student(3,"TrungDC", 8.0, "22324",2));
        students.add(new Student(4,"TienNVT", 9.0, "22324",3));
        students.add(new Student(5,"ChanhTV", 9.0, "22324",4));
    }

    @Override
    public List<Student> getAll() {
        return students;
    }

    @Override
    public void addStudent(Student student) {
        students.add(student);
    }


}
