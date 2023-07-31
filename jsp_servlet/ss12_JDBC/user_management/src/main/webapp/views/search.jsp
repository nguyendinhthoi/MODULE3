<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search User</title>
</head>
<body>
<p><a href="home">Back to user list</a></p>
<form method="post">
    <label for="search">Search By Country</label>
    <input type="text" name="country" id="search" placeholder="Enter Country">
    <input type="submit" value="Search">
</form>
<c:if test="${user!=null}">
    <hr>
    <h2>Result: </h2>
    <p>${user.getName()}</p>
    <p>${user.getEmail()}</p>
    <p>${user.getCountry()}</p>
</c:if>
</body>
</html>
