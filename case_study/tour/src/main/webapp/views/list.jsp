<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        img {
            width: 10%;
            height: 10%;
        }
    </style>
</head>
<body>
<a href="tourServlet?action=create">create</a>

<table>
    <tr>
        <td>Tên Tour</td>
        <td>Mô tả</td>
        <td>Giá Tour</td>
        <td>Số lượng</td>
        <td>Ngày bắt đầu</td>
        <td>Ngày kết thúc</td>
        <td>Tên hướng dẫn viên</td>
        <td>Điểm xuất phát</td>
        <td>Điểm đến</td>
        <td>Khu vực</td>
        <td>Ảnh</td>
    </tr>
    <c:forEach items="${tours}" var="tour">
        <tr>
            <td>${tour.getTourName()}</td>
            <td>${tour.getTourDesc()}</td>
            <td>${tour.getTourPrice()}</td>
            <td>${tour.getAvailableSeat()}</td>
            <td>${tour.getStartDate()}</td>
            <td>${tour.getEndDate()}</td>
            <td>${tour.getEmployeeName()}</td>
            <td>${tour.getPlaceStart()}</td>
            <td>${tour.getPlaceEnd()}</td>
            <td>${tour.getTourPlaceName()}</td>
            <td><img src="${tour.getImage()}" alt=""></td>
            <td><a href="tourServlet?action=edit&id=${tour.getTourId()}">EDIT</a></td>
            <td><a href="tourServlet?action=delele&id=${tour.getTourId()}">DELETE</a></td>
        </tr>
    </c:forEach>

</table>
</body>
</html>
