<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Product</title>
    <link rel="stylesheet" href="/bootstrap-5.1.3-dist/css/bootstrap.css">
</head>
<body>
<h1>Search Product</h1>
<form method="post">
    <span><label for="search" style="color: #0dcaf0">Search by name:</label></span>
    <input type="text" name="search" id="search" placeholder="Input Name here">
    <input type="submit" value="Search">
</form>
<p><a href="/controller">Back to Product List</a></p>
<c:if test="${product != null}">
    <hr>
    <h1>Result: </h1>
    <table class="table table-hover table-bordered table-responsive table-light" >
        <tr>
            <td><label for="name">Name:</label></td>
            <td id="name">${product.getName()}</td>
        </tr>
        <tr>
            <td><label for="desc">Description:</label></td>
            <td id="desc">${product.getDesc()}</td>
        </tr>
        <tr>
            <td><label for="brand">Brand:</label></td>
            <td id="brand">${product.getBrand()}</td>
        </tr>
        <tr>
            <td><label for="price">Price:</label></td>
            <td id="price">${product.getPrice()}</td>
        </tr>
    </table>
</c:if>
<script src="/bootstrap-5.1.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>
