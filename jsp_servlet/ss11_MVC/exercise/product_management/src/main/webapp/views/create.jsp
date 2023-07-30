<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Product</title>
    <link rel="stylesheet" href="/bootstrap-5.1.3-dist/css/bootstrap.css">
    <style>
        .message {
            color: green;
        }
    </style>

</head>
<body>
<h1 class="text-capitalize">Create new Product</h1>

<p>
    <c:if test="${message != null}">
        <span class="message">${message}</span>
    </c:if>
</p>

<p><a href="/controller">Back to Product List</a></p>

<form method="post">
    <fieldset>
        <legend>Product Information</legend>
        <table class="table-light">
            <tr>
                <td><label for="name">Name: </label></td>
                <td><input type="text" name="name" id="name" placeholder="Input Name of Product"></td>
            </tr>
            <tr>
                <td><label for="desc">Description: </label></td>
                <td><input type="text" name="desc" id="desc" placeholder="Input Description of Product"></td>
            </tr>
            <tr>
                <td><label for="brand">Brand: </label></td>
                <td><input type="text" name="brand" id="brand" placeholder="Input Brand of Product"></td>
            </tr>
            <tr>
                <td><label for="price">Price: </label></td>
                <td><input type="text" name="price" id="price" placeholder="Input Price of Product"><td>
            </tr>
            <tr>
                <td></td>
                <td><input type="submit" value="Create Product"></td>
            </tr>
        </table>
    </fieldset>
</form>


<script src="/bootstrap-5.1.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>
