<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Product</title>
</head>
<body>

<h1>Product details</h1>
<p>
    <a href="/controller">Back to Product List</a>
</p>
<table>
    <tr>
        <td>Name:</td>
        <td>${product.getName()}</td>
    </tr>
    <tr>
        <td>Description:</td>
        <td>${product.getDesc()}</td>
    </tr>
    <tr>
        <td>Brand:</td>
        <td>${product.getBrand()}</td>
    </tr>
    <tr>
        <td>Price:</td>
        <td>${product.getPrice()}</td>
    </tr>
</table>

</body>
</html>
