package com.example.model.employee;

import java.sql.Struct;

public class Employee {
    private int employeeId;
    private String employeeName;
    private String employeePhone;
    private String employeeEmail;
    private int gender;
    private int status;
    private int employeeTypeId;

    public Employee() {
    }

    public Employee(String employeeName, String employeePhone, String employeeEmail, int gender, int status, int employeeTypeId) {
        this.employeeName = employeeName;
        this.employeePhone = employeePhone;
        this.employeeEmail = employeeEmail;
        this.gender = gender;
        this.status = status;
        this.employeeTypeId = employeeTypeId;
    }

    public Employee(int employeeId, String employeeName, String employeePhone, String employeeEmail, int gender, int status, int employeeTypeId) {
        this.employeeId = employeeId;
        this.employeeName = employeeName;
        this.employeePhone = employeePhone;
        this.employeeEmail = employeeEmail;
        this.gender = gender;
        this.status = status;
        this.employeeTypeId = employeeTypeId;
    }

    public Employee(String employeeName, String employeePhone, String employeeEmail, int gender, int employeeTypeId) {
        this.employeeName = employeeName;
        this.employeePhone = employeePhone;
        this.employeeEmail = employeeEmail;
        this.gender = gender;
        this.employeeTypeId = employeeTypeId;
    }

    public Employee(int employeeId, String employeeName, String employeePhone, String employeeEmail, int gender, int employeeTypeId) {
        this.employeeId = employeeId;
        this.employeeName = employeeName;
        this.employeePhone = employeePhone;
        this.employeeEmail = employeeEmail;
        this.gender = gender;
        this.employeeTypeId = employeeTypeId;
    }

    public int getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(int employeeId) {
        this.employeeId = employeeId;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getEmployeePhone() {
        return employeePhone;
    }

    public void setEmployeePhone(String employeePhone) {
        this.employeePhone = employeePhone;
    }

    public String getEmployeeEmail() {
        return employeeEmail;
    }

    public void setEmployeeEmail(String employeeEmail) {
        this.employeeEmail = employeeEmail;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getEmployeeTypeId() {
        return employeeTypeId;
    }

    public void setEmployeeTypeId(int employeeTypeId) {
        this.employeeTypeId = employeeTypeId;
    }
}
