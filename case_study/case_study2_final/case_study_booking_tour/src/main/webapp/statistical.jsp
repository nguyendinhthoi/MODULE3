<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 7/8/2023
  Time: 11:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Quản lý dịch vụ</title>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<div id=""></div>
<section class="dashboard">
  <div class="top">
    <i class="uil uil-bars sidebar-toggle"></i>

    <div class="search-box">
      <i class="uil uil-search"></i>
      <input type="text" placeholder="Search here...">
    </div>

    <img src="images/profile.jpg" alt="">
  </div>

  <div class="dash-content">
    <div class="overview">
      <div class="title">
        <i class="uil uil-tachometer-fast-alt"></i>
        <span class="text">Gần đây</span>
      </div>

      <div class="boxes">
        <div class="box box1">
          <i class="uil uil-user-check"></i>
          <span class="text">Khách hàng</span>
          <span class="number">${countCus}</span>
        </div>
        <div class="box box2">
          <i class="uil uil-user-md"></i>
          <span class="text">Nhân viên</span>
          <span class="number">${count}</span>
        </div>
        <div class="box box3">
          <i class="uil uil-map-marker"></i>
          <span class="text">Tour</span>
          <span class="number">${countTour}</span>
        </div>
      </div>
    </div>
  </div>
</section>
</body>
</html>