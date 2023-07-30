package com.example.product_management.controller;

import com.example.product_management.model.Product;
import com.example.product_management.service.IProductService;
import com.example.product_management.service.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/controller")
public class ProductServlet extends HttpServlet {
    IProductService productService = new ProductService();

    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            case "view":
                showViewForm(request, response);
                break;
            case "search":
                showSearchForm(request, response);
                break;
            default:
                listProduct(request, response);
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                insertProduct(request, response);
                break;
            case "edit":
                updateProduct(request, response);
                break;
            case "delete":
                deleteProduct(request, response);
                break;
            case "search":
                searchProduct(request, response);
            default:
                break;
        }
    }


    private void listProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.findAll();
        request.setAttribute("products", productList);
        try {
            request.getRequestDispatcher("/views/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/views/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void insertProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = (int) (Math.random() * 1000);
        String name = request.getParameter("name");
        String desc = request.getParameter("desc");
        String brand = request.getParameter("brand");
        double price = Double.parseDouble(request.getParameter("price"));
        Product product = new Product(id, name, desc, brand, price);
        productService.insertProduct(product);

        request.setAttribute("message", "New product was created");
        try {
            request.getRequestDispatcher("/views/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        try {
            if (product == null) {
                request.getRequestDispatcher("/views/error.jsp").forward(request, response);
            } else {
                request.setAttribute("product", product);
                request.getRequestDispatcher("/views/edit.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String desc = request.getParameter("desc");
        String brand = request.getParameter("brand");
        double price = Double.parseDouble(request.getParameter("price"));

        Product product = productService.findById(id);

        try {
            if (product == null) {
                request.getRequestDispatcher("/views/error.jsp").forward(request, response);
            } else {
                product.setName(name);
                product.setDesc(desc);
                product.setBrand(brand);
                product.setPrice(price);
                productService.updateProduct(id, product);

                request.setAttribute("product", product);
                request.setAttribute("message", "Product was updated");
                request.getRequestDispatcher("/views/edit.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);
        try {
            if (product == null) {
                request.getRequestDispatcher("/views/error.jsp").forward(request, response);
            } else {
                request.setAttribute("product", product);
                request.getRequestDispatcher("/views/delete.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);

        try {
            if (product == null) {
                request.getRequestDispatcher("/views/error.jsp").forward(request, response);
            } else {
                productService.deleteProduct(id);
                response.sendRedirect("/controller");
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showViewForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);

        try {
            if (product == null) {
                request.getRequestDispatcher("/views/error.jsp").forward(request, response);
            } else {
                request.setAttribute("product", product);
                request.getRequestDispatcher("/views/view.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showSearchForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/views/search.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void searchProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("search");
        Product product = productService.searchProduct(name);

        try {
            if (product == null) {
                request.getRequestDispatcher("/views/error.jsp").forward(request, response);
            } else {
                request.setAttribute("product", product);
                request.getRequestDispatcher("/views/search.jsp").forward(request, response);
            }
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}



