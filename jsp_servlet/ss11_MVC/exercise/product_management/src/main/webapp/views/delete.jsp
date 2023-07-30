<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Product</title>
</head>
<body>
<form method="post">
    <h3>Are you sure?</h3>
    <fieldset>
        <legend>Product Information</legend>
        <table>
            <tr>
                <td>Name :</td>
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
            <tr>
                <td><input type="submit" value="Delete Product"></td>
                <td><a href="/controller">Back to Product List</a></td>
            </tr>
        </table>
    </fieldset>

</form>
</body>
</html>
