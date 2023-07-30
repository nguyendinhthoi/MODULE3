package com.example.ss9.model;

public class Student {
    private int code;
    private String nameStudent;
    private Double point;
    private String idCard;
    private int codeClass;

    public Student() {
    }

    public Student(int code, String nameStudent, Double point, String idCard, int codeClass) {
        this.code = code;
        this.nameStudent = nameStudent;
        this.point = point;
        this.idCard = idCard;
        this.codeClass = codeClass;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getNameStudent() {
        return nameStudent;
    }

    public void setNameStudent(String nameStudent) {
        this.nameStudent = nameStudent;
    }

    public Double getPoint() {
        return point;
    }

    public void setPoint(Double point) {
        this.point = point;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public int getCodeClass() {
        return codeClass;
    }

    public void setCodeClass(int codeClass) {
        this.codeClass = codeClass;
    }
}
