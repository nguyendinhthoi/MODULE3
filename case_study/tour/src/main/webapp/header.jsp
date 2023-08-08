<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <!-- BOOTSTRAP -->
    <link rel="stylesheet" href="/bootstrap-5.2.3-dist/css/bootstrap.css">

    <!-- ICON -->
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">

    <!-- FONT -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400;500;600;700&display=swap"
          rel="stylesheet">

    <!-- DASHBOARD -->
    <link rel="stylesheet" href="/css/style.css">

    <style>
        nav {
            background-color: #27374D;
        }

    </style>

    <!-- DATA TALE -->
    <link rel="stylesheet" href="//cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

</head>
<body>
<div id="side-bar">
    <nav>
        <div class="logo-name">
            <div class="logo-image">
                <img width="50%" src="images/logo.png" style="padding-right: 5px">
            </div>
            <span class="logo-name" style="font-size:30px ;color: white ">Simple </span>
        </div>

        <div class="menu-items">
            <ul class="nav-links">
                <li><a href="statistical.jsp">
                    <i class="uil uil-chart" style="color:white;"></i>
                    <span class="link-name" style="color:white;">Thống kê</span>
                </a></li>
                <li><a href="#">
                    <i class="uil uil-user" style="color:white;"></i>
                    <span class="link-name" style="color:white;">Tài khoản</span>
                </a></li>
                <li><a href="/employeeServlet">
                    <i class="uil uil-user-md" style="color:white;"></i>
                    <span class="link-name" style="color:white;">Nhân viên</span>
                </a></li>
                <li><a href="#">
                    <i class="uil uil-user-check" style="color:white;"></i>
                    <span class="link-name" style="color:white;">Khách hàng</span>
                </a></li>
                <li><a href="#">
                    <i class="uil uil-map-marker" style="color:white;"></i>
                    <span class="link-name" style="color:white;">Tour</span>
                </a></li>
            </ul>

            <ul class="logout-mode">
                <li><a href="#">
                    <i class="uil uil-signout" style="color:white;"></i>
                    <span class="link-name" style="color:white;">Logout</span>
                </a></li>
            </ul>
        </div>
    </nav>
</div>

<!-- IONICONS JS -->

<!-- BOOTSTRAP JS -->
<script src="/bootstrap-5.2.3-dist/js/bootstrap.bundle.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
        crossorigin="anonymous"></script>

<!-- DATA TABLE -->
<script src="//cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

<!-- DASHBOARD JS -->
<script src="/js/script.js"></script>
</body>
</html>