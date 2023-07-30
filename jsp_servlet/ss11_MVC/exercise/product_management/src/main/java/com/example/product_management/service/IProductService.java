package com.example.product_management.service;

import com.example.product_management.model.Product;

import java.util.List;

public interface IProductService {

    List<Product> findAll();

    void insertProduct(Product product);

    Product findById(int id);

    void updateProduct(int id, Product product);

    void deleteProduct(int id);

    Product searchProduct(String name);
}
