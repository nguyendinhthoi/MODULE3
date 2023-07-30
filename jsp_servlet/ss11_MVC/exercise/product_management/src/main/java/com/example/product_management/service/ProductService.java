package com.example.product_management.service;

import com.example.product_management.model.Product;
import com.example.product_management.repository.product.IProductRepo;
import com.example.product_management.repository.product.ProductRepo;

import java.util.List;

public class ProductService implements IProductService {
    IProductRepo productRepo = new ProductRepo();

    @Override
    public List<Product> findAll() {
        return productRepo.findAll();
    }

    @Override
    public void insertProduct(Product product) {
        productRepo.insertProduct(product);
    }

    @Override
    public Product findById(int id) {
        return productRepo.findById(id);

    }

    @Override
    public void updateProduct(int id, Product product) {
        productRepo.updateProduct(id, product);
    }

    @Override
    public void deleteProduct(int id) {
        productRepo.deleteProduct(id);
    }

    @Override
    public Product searchProduct(String name) {
        return productRepo.searchProduct(name);
    }
}
