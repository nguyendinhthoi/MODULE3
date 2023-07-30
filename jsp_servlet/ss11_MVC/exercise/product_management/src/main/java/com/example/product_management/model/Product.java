package com.example.product_management.model;

public class Product {
    private int id;
    private String name;
    private String desc;
    private String brand;
    private double price;

    public Product() {
    }

    public Product(String name, String desc, String brand, double price) {
        this.name = name;
        this.desc = desc;
        this.brand = brand;
        this.price = price;
    }

    public Product(int id, String name, String desc, String brand, double price) {
        this.id = id;
        this.name = name;
        this.desc = desc;
        this.brand = brand;
        this.price = price;
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

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", desc='" + desc + '\'' +
                ", brand='" + brand + '\'' +
                ", price=" + price +
                '}';
    }
}
