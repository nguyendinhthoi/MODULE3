package com.example.model.employee.dto;

public class EmployeeListDto {
    private int id;
    private String name;
    private String phone;
    private String email;
    private int gender;
    private int status;
    private String typeName;

    public EmployeeListDto() {
    }

    public EmployeeListDto(String name, String phone, String email, int gender, int status, String typeName) {
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.gender = gender;
        this.status = status;
        this.typeName = typeName;
    }

    public EmployeeListDto(int id, String name, String phone, String email, int gender, int status, String typeName) {
        this.id = id;
        this.name = name;
        this.phone = phone;
        this.email = email;
        this.gender = gender;
        this.status = status;
        this.typeName = typeName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
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

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
}
