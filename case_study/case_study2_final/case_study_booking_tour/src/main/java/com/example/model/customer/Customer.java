package com.example.model.customer;

public class Customer {
    private int customerId;
    private String customerName;
    private String customerIdCard;
    private boolean customerGender;
    private String customerEmail;
    private String customerPhone;
    private String customerAddress;
    private int customerTypeId;
    private int accountId;
    private boolean isDelete;

    public Customer() {
    }

    public Customer(int customerId, String customerName, String customerIdCard, boolean customerGender,
                    String customerEmail, String customerPhone, String customerAddress, int customerTypeId, int accountId, boolean isDelete) {
        this.customerId = customerId;
        this.customerName = customerName;
        this.customerIdCard = customerIdCard;
        this.customerGender = customerGender;
        this.customerEmail = customerEmail;
        this.customerPhone = customerPhone;
        this.customerAddress = customerAddress;
        this.customerTypeId = customerTypeId;
        this.accountId = accountId;
        this.isDelete = isDelete;
    }

    public Customer(int customerId, String customerName, String customerIdCard, boolean gender, String customerEmail, String customerPhone, String customerAddress, int customerTypeId, int accountId) {
        this.customerId = customerId;
        this.customerName = customerName;
        this.customerIdCard = customerIdCard;
        this.customerGender = gender;
        this.customerEmail = customerEmail;
        this.customerPhone = customerPhone;
        this.customerAddress = customerAddress;
        this.customerTypeId = customerTypeId;
        this.accountId = accountId;
    }

    public Customer(String name, String idCard, boolean gender, String email, String phone, String address) {
        this.customerName = name;
        this.customerIdCard = idCard;
        this.customerGender = gender;
        this.customerEmail = email;
        this.customerPhone = phone;
        this.customerAddress = address;
    }

    public Customer(String id, String name, String idCard, boolean gender, String email, String phone, String address) {
        this.customerId = customerId;
        this.customerName = name;
        this.customerIdCard = idCard;
        this.customerGender = gender;
        this.customerEmail = email;
        this.customerPhone = phone;
        this.customerAddress = address;
    }
    //    public Customer(int customerId, String customerName, String customerIdCard, boolean customerGender,
//                    String customerEmail, String customerPhone, String customerAddress, int customerTypeId, int accountId) {
//        this.customerId = customerId;
//        this.customerName = customerName;
//        this.customerIdCard = customerIdCard;
//        this.customerGender = customerGender;
//        this.customerEmail = customerEmail;
//        this.customerPhone = customerPhone;
//        this.customerAddress = customerAddress;
//        this.customerTypeId = customerTypeId;
//        this.accountId = accountId;
//    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getCustomerIdCard() {
        return customerIdCard;
    }

    public void setCustomerIdCard(String customerIdCard) {
        this.customerIdCard = customerIdCard;
    }

    public boolean isCustomerGender() {
        return customerGender;
    }

    public void setCustomerGender(boolean customerGender) {
        this.customerGender = customerGender;
    }

    public String getCustomerEmail() {
        return customerEmail;
    }

    public void setCustomerEmail(String customerEmail) {
        this.customerEmail = customerEmail;
    }

    public String getCustomerPhone() {
        return customerPhone;
    }

    public void setCustomerPhone(String customerPhone) {
        this.customerPhone = customerPhone;
    }

    public String getCustomerAddress() {
        return customerAddress;
    }

    public void setCustomerAddress(String customerAddress) {
        this.customerAddress = customerAddress;
    }

    public int getCustomerTypeId() {
        return customerTypeId;
    }

    public void setCustomerTypeId(int customerTypeId) {
        this.customerTypeId = customerTypeId;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public boolean isDelete() {
        return isDelete;
    }

    public void setDelete(boolean delete) {
        isDelete = delete;
    }
}
