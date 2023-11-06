package com.example.model.tour;

public class ENameCate {
    int employeeId;
    String employeeName;

    public ENameCate() {
    }

    public ENameCate(int employeeId) {
        this.employeeId = employeeId;
    }

    public ENameCate(String employeeName) {
        this.employeeName = employeeName;
    }

    public ENameCate(int employeeId, String employeeName) {
        this.employeeId = employeeId;
        this.employeeName = employeeName;
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

    @Override
    public String toString() {
        return "ENameCate{" +
                "employeeId=" + employeeId +
                ", employeeName='" + employeeName + '\'' +
                '}';
    }
}
