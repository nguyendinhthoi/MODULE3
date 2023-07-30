package com.example.product_management.repository.product;

import com.example.product_management.model.Product;

import java.util.List;

public interface IProductRepo {
    List<Product> findAll();

    void insertProduct(Product product);

    void updateProduct(int id, Product product);

    Product findById(int id);

    void deleteProduct(int id);

    Product searchProduct(String name);
}
