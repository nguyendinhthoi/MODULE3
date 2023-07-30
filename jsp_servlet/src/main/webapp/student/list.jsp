<%--
  Created by IntelliJ IDEA.
  User: LENOVO
  Date: 7/28/2023
  Time: 09:08
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
<button onclick="window.location.href='/students?action=create'" class="btn btn-primary">Thêm mới</button>
<h1>Danh sách học sinh</h1>
<table class="table table-hover">
    <thead>
    <tr>
        <th>Code</th>
        <th>Name</th>
        <th>Id card</th>
        <th>Point</th>
        <th>Rank</th>
        <th>Code Class</th>
    </tr>
    </thead>
    <tbody>
    <c:if test="${students == null}">
        <h1>Không có dữ liệu</h1>
    </c:if>
    <c:if test="${students != null}">
        <%--    for(Student student: students)--%>
        <c:forEach items="${students}" var="student">
            <tr>
                <td>${student.code}</td>
                <td>${student.nameStudent}</td>
                <td>${student.idCard}</td>
                <td>${student.point}</td>
                <td>
                    <c:if test="${student.point >8}">Good</c:if>
                    <c:if test="${student.point > 6 && student.point <= 8}">Normal</c:if>
                    <c:if test="${student.point < 6}">Bad</c:if>
                </td>
                <td>${student.codeClass}</td>
            </tr>
        </c:forEach>
    </c:if>
    </tbody>
</table>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</html>
