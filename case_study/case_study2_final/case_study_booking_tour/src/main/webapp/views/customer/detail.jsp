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
            <ul class="nav-links" hidden="hidden">
                <li><a href="statistical.jsp">
                    <i class="uil uil-chart" style="color:white;"></i>
                    <span class="link-name" style="color:white;" hidden="hidden">Thống kê</span>
                </a></li>
                <li><a href="/account">
                    <i class="uil uil-user" style="color:white;"></i>
                    <span class="link-name" style="color:white;" hidden="hidden">Tài khoản</span>
                </a></li>
                <li><a href="/employeeServlet">
                    <i class="uil uil-user-md" style="color:white;"></i>
                    <span class="link-name" style="color:white;" hidden="hidden">Nhân viên</span>
                </a></li>
                <li><a href="/CustomerServlet">
                    <i class="uil uil-user-check" style="color:white;"></i>
                    <span class="link-name" style="color:white;" hidden="hidden">Khách hàng</span>
                </a></li>
                <li><a href="#">
                    <i class="uil uil-map-marker" style="color:white;"></i>
                    <span class="link-name" style="color:white;" hidden="hidden">Tour</span>
                </a></li>
            </ul>

            <ul class="logout-mode" hidden="hidden">
                <li><a href="#">
                    <i class="uil uil-signout" style="color:white;"></i>
                    <span class="link-name" style="color:white;" hidden="hidden">Logout</span>
                </a></li>
            </ul>
        </div>
    </nav>
</div>

<div class="dashboard">
    <div class="overview">
        <section class="vh-100 gradient-custom">
            <div class="container py-5 h-100">
                <div class="row justify-content-center h-100"
                     style="height: 200vh !important;background-color: #DDE6ED">
                    <div class="col-12 col-lg-9 col-xl-7">
                        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                            <div class="card-body p-4 p-md-5"
                                 style="box-shadow: 0 0 10px rgba(0, 0, 0, 1); border-radius: 10px">
                                <img src="/images/simple.png"
                                     class="w-100"
                                     style="border-top-left-radius: .3rem; border-top-right-radius: .3rem; padding-bottom: 20px"
                                     alt="Sample photo">
                                <c:if test="${message != null}">
                                    <div class="alert alert-success d-flex align-items-center" role="alert">
                                        <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img"
                                             aria-label="Success:">
                                            <use xlink:href="#check-circle-fill"/>
                                        </svg>
                                        <div>
                                            <i class="fa-regular fa-circle-check"></i>
                                            <span class="message">
                                                    ${message}
                                            </span>
                                        </div>
                                    </div>
                                </c:if>
                                <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">
                                    Thông tin khách hàng</h3>
                                <form action="/CustomerServlet?action=editCustomer&Id=${customer.customerId}"
                                      method="post">
                                    <div class="row">
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <h6 class="form-label" for="name">Họ và tên</h6>
                                                <input type="text" name="Name" id="name"
                                                       class="form-control form-control-lg active"
                                                       value="${customer.customerName}" required
                                                       readonly/>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <h6 class="form-label" for="IdCard">CMND/CCCD</h6>
                                                <input type="text" name="IdCard" id="IdCard"
                                                       class="form-control form-control-lg active"
                                                       value="${customer.customerIdCard}" required
                                                       readonly/>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <h6 class="form-label" for="phone">Số điện thoại</h6>
                                            <div class="form-outline">
                                                <input type="text" name="phone" id="phone"
                                                       class="form-control form-control-lg active"
                                                       value="${customer.customerPhone}" required
                                                       readonly/>
                                                <c:if test="${error != null}">
                                                    <div class="alert alert-danger d-flex align-items-center"
                                                         role="alert">
                                                        <svg class="bi flex-shrink-0 me-2" width="0" height="0"
                                                             role="img" aria-label="Danger:">
                                                            <use xlink:href="#check-circle-fill"/>
                                                        </svg>
                                                        <div>
                                                                <span class="error">
                                                                     <label><i class="uil uil-ban"></i> ${error}</label>
                                                                </span>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <h6 class="form-label" for="phone">Địa chỉ</h6>
                                            <div class="form-outline">

                                                <textarea readonly name="address" id="address" cols="30"
                                                          rows="3">${customer.customerAddress}</textarea>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 mb-4">
                                                <h6 class="form-label" for="email">Email</h6>
                                                <div class="form-outline">
                                                    <input type="email" name="email" id="email"
                                                           class="form-control form-control-lg active"
                                                           value="${customer.customerEmail}" size="15px" required
                                                           readonly/>
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-4">

                                                <div class="form-outline" id="selectGender" readonly="">
                                                    <h6 class="form-label">Giới tính</h6>
                                                    <br>
                                                    <c:if test="${customer.customerGender == true}">
                                                        <input value="${1}" name="gender" type="radio" required
                                                               checked disabled>
                                                        <label>Nam</label>
                                                        <input value="${0}"
                                                               name="gender" type="radio" required disabled>
                                                        <label>Nữ</label>
                                                    </c:if>
                                                </div>
                                            </div>
                                            <div hidden>
                                                <input type="text" name="typeId" value="${customer.customerTypeId}">
                                                <input type="text" name="accountId" value="${customer.accountId}">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col">
                                                <div class="mt-4 pt-2">
                                                    <a class="btn btn-secondary btn-lg" href="/">Trở về</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>


<script src="/bootstrap-5.2.3-dist/js/bootstrap.bundle.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
        crossorigin="anonymous"></script>

<!-- DATA TABLE -->
<script src="//cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

<!-- DASHBOARD JS -->
<script src="/js/script.js"></script>
</body>
</html>
