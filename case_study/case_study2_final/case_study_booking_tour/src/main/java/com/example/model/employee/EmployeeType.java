package com.example.model.employee;

public class EmployeeType {
    private int employeeTypeId;
    private String employeeTypeName;

    public EmployeeType() {
    }

    public EmployeeType(int employeeTypeId, String employeeTypeName) {
        this.employeeTypeId = employeeTypeId;
        this.employeeTypeName = employeeTypeName;
    }

    public int getEmployeeTypeId() {
        return employeeTypeId;
    }

    public void setEmployeeTypeId(int employeeTypeId) {
        this.employeeTypeId = employeeTypeId;
    }

    public String getEmployeeTypeName() {
        return employeeTypeName;
    }

    public void setEmployeeTypeName(String employeeTypeName) {
        this.employeeTypeName = employeeTypeName;
    }
}
