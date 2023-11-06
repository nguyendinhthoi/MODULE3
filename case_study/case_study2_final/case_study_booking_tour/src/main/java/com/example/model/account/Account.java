package com.example.model.account;

public class Account {
    private int id;
    private String username;
    private String password;
    private int status;
    private int role;
    private String email;

    public Account() {
    }

    public Account(int id, String username, String password, int status, int role, String email) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.status = status;
        this.role = role;
        this.email = email;
    }

    public Account(int id, String username, String password, int status, int role) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.status = status;
        this.role = role;
    }

    public Account(String username, String password, int status, int role) {
        this.username = username;
        this.password = password;
        this.status = status;
        this.role = role;
    }

    public Account(String username, String password, int status, int role, String email) {
        this.username = username;
        this.password = password;
        this.status = status;
        this.role = role;
        this.email = email;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Account{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", status=" + status +
                '}';
    }
}
