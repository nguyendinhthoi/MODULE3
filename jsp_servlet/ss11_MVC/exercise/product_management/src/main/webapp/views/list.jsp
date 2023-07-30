<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product List</title>
    <link rel="stylesheet" href="/bootstrap-5.1.3-dist/css/bootstrap.css">
</head>
<body>

<h1>Products</h1>

<p>
    <a href="/controller?action=create">Create New Product</a>
</p>

<p>
    <a href="/controller?action=search">Search Product</a>
</p>

<table class="table table-hover">
    <thead>
    <tr>
        <td>Name</td>
        <td>Description</td>
        <td>Brand</td>
        <td>Price</td>
        <td>Edit</td>
        <td>Delete</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="product" items="${products}">
        <tr>
            <td><a href="/controller?action=view&id=${product.getId()}">${product.getName()}</a></td>
            <td>${product.getDesc()}</td>
            <td>${product.getBrand()}</td>
            <td>${product.getPrice()}</td>
            <td><a href="/controller?action=edit&id=${product.getId()}">Edit</a></td>
            <td><a href="/controller?action=delete&id=${product.getId()}">Delete</a></td>
        </tr>
    </c:forEach>
    </tbody>
</table>


<script src="/bootstrap-5.1.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>
