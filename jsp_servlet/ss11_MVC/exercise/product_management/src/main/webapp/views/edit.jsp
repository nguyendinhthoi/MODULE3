<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Edit Product</title>
    <style>
        .message {
            color: green;
        }
    </style>
</head>
<body>
<h1>Update Product</h1>

<p>
    <c:if test="${message != null}">
        <span class="message">${message}</span>
    </c:if>
</p>

<p><a href="/controller">Back to Product List</a></p>


<form method="post">
    <fieldset>
        <legend>Product Information</legend>
        <table>
            <tr>
                <td><label for="name">Name: </label></td>
                <td><input type="text" name="name" id="name" value="${product.getName()}"></td>
            </tr>
            <tr>
                <td><label for="desc">Discription: </label></td>
                <td><input type="text" name="desc" id="desc" value="${product.getDesc()}"></td>
            </tr>
            <tr>
                <td><label for="brand">Brand: </label></td>
                <td><input type="text" name="brand" id="brand" value="${product.getBrand()}"></td>
            </tr>
            <tr>
                <td><label for="price">Price: </label></td>
                <td><input type="text" name="price" id="price" value="${product.getPrice()}"></td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Update Product"></td>
            </tr>
        </table>
    </fieldset>
</form>
</body>
</html>
