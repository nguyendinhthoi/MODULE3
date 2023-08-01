package com.example.product_management.repository.product;

import com.example.product_management.model.Product;
import com.example.product_management.repository.database.Base;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ProductRepo implements IProductRepo {

    public static final String INSERT = "INSERT INTO `product_management`.`product` (`product_name`, `product_description` , `product_brand`, `product_price`) VALUES (?,?,?,?);";
    public static final String SELECT_ALL = "SELECT * FROM product;";
    private static final String SELECT_BY_ID = "select * from product where product_id = ?";

    public static final String DELETE = "DELETE FROM product WHERE product_id = ?;";
    public static final String UPDATE = "UPDATE product SET product_name = ?" +
            " , product_description = ?" +
            " , product_brand = ?" +
            ", product_price = ?" +
            " WHERE product_id = ?; ";
    public static final String SEARCH = "SELECT * FROM product WHERE product_name = ?;";

    @Override
    public List<Product> findAll() {
        List<Product> productList = new ArrayList<>();
        Connection connection = Base.getConnection();

        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("product_id");
                String name = resultSet.getString("product_name");
                String desc = resultSet.getString("product_description");
                String brand = resultSet.getString("product_brand");
                double price = resultSet.getDouble("product_price");

                productList.add(new Product(id, name, desc, brand, price));
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return productList;
    }


    @Override
    public void insertProduct(Product product) {
        Connection connection = Base.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setString(2, product.getDesc());
            preparedStatement.setString(3, product.getBrand());
            preparedStatement.setDouble(4, product.getPrice());

            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void updateProduct(int id, Product product) {
        Connection connection = Base.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1, product.getName());
            preparedStatement.setString(2, product.getDesc());
            preparedStatement.setString(3, product.getBrand());
            preparedStatement.setDouble(4, product.getPrice());
            preparedStatement.setInt(5, id);

            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Product findById(int id) {

        Connection connection = Base.getConnection();
        Product product = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_BY_ID);
            preparedStatement.setInt(1, id);

            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("product_name");
                String desc = resultSet.getString("product_description");
                String brand = resultSet.getString("product_brand");
                double price = resultSet.getDouble("product_price");
                product = new Product(name, desc, brand, price);
            }
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return product;
    }

    @Override
    public void deleteProduct(int id) {
        Connection connection = Base.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);

            preparedStatement.executeUpdate();
            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public Product searchProduct(String name) {
        Connection connection = Base.getConnection();
        Product product = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1, name);


            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("product_id");
                String nameSearch = resultSet.getString("product_name");
                String descSearch = resultSet.getString("product_description");
                String brandSearch = resultSet.getString("product_brand");
                double priceSearch = resultSet.getDouble("product_price");

                product = new Product(id, nameSearch, descSearch, brandSearch, priceSearch);
            }


            connection.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return product;
    }
}
