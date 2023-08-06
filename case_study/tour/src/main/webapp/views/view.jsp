<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View</title>
</head>
<body>
<table class="table">
    <tr>
        <td>Mô tả</td>
        <td>Điểm xuất phát</td>
        <td>Điểm đến</td>
        <td>Khu vực</td>
        <td>Khu vực</td>
    </tr>
    <tr>
        <td>${tour.getTourDesc()}</td>
        <td>${tour.getPlaceStart()}</td>
        <td>${tour.getPlaceEnd()}</td>
        <td>${tour.getTourPlaceName()}</td>
        <c:forEach var="image" items="${listImage}">
           <td> <img style="width: 20%" src="../anh/${image}" alt=""></td>
        </c:forEach>
    </tr>
    <a role="button" class="btn btn-primary" href="/tourServlet">Quay lại trang chủ</a>
</table>
</body>
</html>
