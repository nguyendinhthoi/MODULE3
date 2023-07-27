<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Management</title>
    <style>
        img {
            height: 40px;
            width: 40px;
        }

        table {
            border: 1px solid black;
            text-align: center;
        }
    </style>
</head>
<body>


<table>
    <h2>
        Customers List
    </h2>
    <tr>
        <td>Name</td>
        <td>Date of birth</td>
        <td>Address</td>
        <td>Picture</td>
    </tr>
    <c:forEach items="${customersList}" var="customer">
        <tr>
            <td><c:out value="${customer.name}"/></td>
            <td><c:out value="${customer.date}"/></td>
            <td><c:out value="${customer.address}"/></td>
            <td><img src="${customer.picture}" alt="picture's Woman"></td>
        </tr>
    </c:forEach>
</table>


</body>
</html>