<!--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
-->
<!--<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href='https://fonts.googleapis.com/css?family=Lobster' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Lugrasimo' rel='stylesheet'>
    <style>
        @media (max-width: 700px) {
            #infoTour {
                width: 100%;
            }

            #infoTour div {
                margin: 0 10px
            }
        }

        .carousel .intro span {
            color: rgba(255, 255, 255, 1);
            font-size: 20px;
            font-family: Arial;
        }

        header {
            position: fixed;
            top: 0;
            botop: 0;
            left: 0;
            right: 0;
            z-index: 9999;
            background-color: white;
        }

        ​
        .carousel .intro span {
            color: rgba(255, 255, 255, 1);
            font-size: 20px;
            font-family: Arial;
        }

        @media only screen and (max-width: 480px) {
            img {
                width: 50%;
            }
        }

        /* CSS */
        .button-5 {
            align-items: center;
            background-clip: padding-box;
            background-color: #fa6400;
            border: 1px solid transparent;
            border-radius: .25rem;
            box-shadow: rgba(0, 0, 0, 0.02) 0 1px 3px 0;
            box-sizing: border-box;
            color: #fff;
            cursor: pointer;
            display: inline-flex;
            font-family: system-ui, -apple-system, system-ui, "Helvetica Neue", Helvetica, Arial, sans-serif;
            font-size: 16px;
            font-weight: 600;
            justify-content: center;
            line-height: 1.25;
            margin: 0;
            min-height: 3rem;
            padding: calc(.875rem - 1px) calc(1.5rem - 1px);
            position: relative;
            text-decoration: none;
            transition: all 250ms;
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
            vertical-align: baseline;
            width: auto;
        }

        .button-5:hover,
        .button-5:focus {
            background-color: #fb8332;
            box-shadow: rgba(0, 0, 0, 0.1) 0 4px 12px;
        }

        .button-5:hover {
            transform: translateY(-1px);
        }

        .button-5:active {
            background-color: #c85000;
            box-shadow: rgba(0, 0, 0, .06) 0 2px 4px;
            transform: translateY(0);
        }
    </style>
</head>
<body>
<header>
    <div class="col-md-12" style="position: fixed;padding-top: 0">
        <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">
            <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">
                <svg class="bi me-2" width="40" height="32">
                    <use xlink:href="#bootstrap"></use>
                </svg>
                <span class="fs-4" style=" font-family: 'Lobster';font-size: 70px;color: #ff5b00 ">Simple </span>
            </a>
            <input type="text" placeholder=" Search..."
                   style="border-radius: 35px;width: 200px;background-color: #f5f5f5">
            <ul class="nav nav-pills">
                <li class="nav-item"><a href="/RoleServlet" class="nav-link" style="color: #222222">Trang Chủ</a>
                </li>
                <li class="nav-item"><a href="/tourServlet" class="nav-link" style="color: #222222">Tour</a></li>
                <li class="nav-item"><a href="#" class="nav-link" style="color: #222222">Liên Hệ</a></li>
                <li class="nav-item"><a href="#" class="nav-link" style="color: #222222">Đăng kí</a></li>
                <li class="nav-item"><a href="#" class="nav-link" style="margin-top: -15px">
                    <button style="background-color: #ff5b00;border-radius: 35px;border: none;height: 40px;text-align: center;width: 100px;color: white;padding-top: 0px;padding-bottom: 0px ">
                        Đăng nhập
                    </button>
                </a></li>
            </ul>
        </header>
    </div>
</header>

<div class="container">
    <div id="infoTour" class="row" style="margin-top: 90px">
        <div class="col">
            <table class="table">
                <tr>
                    <td colspan="2">
                        <div class="row">
                            <div class="col-6" style="height: 800px">
                                <img src="anh/${image1}" height="100%" width="100%">
                            </div>
                            <div class="col-6" style="height: 800px">
                                <div class="row" style="height: auto">
                                    <div class="col" style="height: 390px;">
                                        <img src="anh/${image2}" width="100%" height="100%">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col" style="height: 10px;">
                                    </div>
                                </div>
                                <div class="row" style="height:10px "></div>
                                <div class="row" style="height: auto">
                                    <div class="col" style="height: 390px">
                                        <img src="anh/${image3}" width="100%" height="100%">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>Mô tả:</th>
                    <td>
                        ${tour.getTourDesc()}
                    </td>
                </tr>
                <tr>
                    <th>Tên Tour:</th>
                    <td>${tour.getTourName()}</td>
                </tr>
                <tr>
                    <th>Hướng dẫn viên:</th>
                    <td>${tour.getEmployeeName()}</td>
                </tr>
                <tr>
                    <th>Số lượng:</th>
                    <td>${tour.getAvailableSeat()}</td>
                </tr>
                <tr>
                    <th>Ngày bắt đầu:</th>
                    <td>${tour.getStartDate()}</td>
                </tr>
                <tr>
                    <th>Ngày kết thúc:</th>
                    <td>${tour.getEndDate()}</td>
                </tr>
                <tr>
                    <th>Điểm xuất phát:</th>
                    <td>${tour.getPlaceStart()}</td>
                </tr>
                <tr>
                    <th>Điểm kết thúc:</th>
                    <td>${tour.getPlaceEnd()}</td>
                </tr>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-10"></div>
        <div class="col-2">
            <div class="row">
                <div class="col">
                    <fmt:setLocale value="vi_VN"/>
                    <c:set var="price" value="${tour.getTourPrice()}"/>
                    <td class="data-list">
                        <h3 style="color: red;font-size: 30px;">
                            <fmt:formatNumber value="${price}" type="currency" currencySymbol="₫"/>
                        </h3>
                    </td>

                </div>
            </div>
            <div class="row">
                <div class="col">
                    <a href="">
                        <button style="width: 150px; height: 40px" class="button-5" type="submit">
                            <h5>Đặt ngay</h5>
                        </button>
                    </a>

                </div>
            </div>
        </div>
    </div>
</div>

<hr style="margin-bottom: 0px;color: grey">
<footer class="bg-light" style="margin-bottom: 0;position: relative;background-color: #ffffff">
    <div class="col-md-12">
        <div class="row" style="width: 100%">
            <div class="col-lg-3 my-5">
                <h5>LIÊN HỆ</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2"><h6 style="display: inline-block">Simple :</h6>
                        đem đến cho bạn sự tiện lợi để khám phá các trải nghiệm mới mẻ mọi lúc, mọi nơi .
                    </li>
                    <li class="nav-item mb-2">Địa chỉ: Số 123 Đường Phan Chu Trinh,
                        Quận 10,
                        TP.HCM
                    </li>
                    <li class="nav-item mb-2">ĐT: 0123456789</li>
                    <li class="nav-item mb-2">ĐT: : 0987654321</li>
                    <li class="nav-item mb-2">Email: contact@demo.com</li>
                </ul>
            </div>

            <div class="col-lg-3 my-5">
                <h5>TOUR</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary"
                                                 style="color: #222222">Tour Miền Bắc</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary"
                                                 style="color: #222222">Tour Miền Nam</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary"
                                                 style="color: #222222">Tour Miền Nam</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary"
                                                 style="color: #222222">Du lịch Huế</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary"
                                                 style="color: #222222">Du lịch Hạ Long</a></li>
                </ul>
            </div>

            <div class="col-lg-3 my-5">
                <h5>Điều khoản sử dụng</h5>
                <ul class="nav flex-column">
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary"
                                                 style="color: #222222">Điều khoản sử dụng</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary"
                                                 style="color: #222222">Chính sách bảo mật của Simple</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary"
                                                 style="color: #222222">Chính sách Cookie</a></li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary"
                                                 style="color: #222222">Chương trình thưởng phát hiện lỗi phần
                        mềm</a>
                    </li>
                    <li class="nav-item mb-2"><a href="#" class="nav-link p-0 text-body-secondary"
                                                 style="color: #222222">Chính sách và quy định</a></li>
                </ul>
            </div>

            <div class="col-lg-3 my-5">
                <form>
                    <h5>Subscribe to our newsletter</h5>
                    <p>Monthly digest of what's new and exciting from us.</p>
                    <div class="d-flex flex-column flex-sm-row w-100 gap-2">
                        <label for="newsletter1" class="visually-hidden">Email address</label>
                        <input id="newsletter1" type="text" class="form-control" placeholder="Email address"
                               style="width: 200px;background-color: #f5f5f5">
                        <button class="btn btn-primary" type="button"
                                style="background-color: #ff5b00;border: none">
                            Subscribe
                        </button>
                    </div>
                </form>
            </div>
        </div>
        <div class="d-flex flex-column flex-sm-row justify-content-between py-4 my-4 border-top">
            <p>© 2023 Company, Inc. All rights reserved.</p>
            <ul class="list-unstyled d-flex">
                <li class="ms-3"><a class="link-body-emphasis" href="#">
                    <svg class="bi" width="24" height="24">
                        <use xlink:href="#twitter"></use>
                    </svg>
                </a></li>
                <li class="ms-3"><a class="link-body-emphasis" href="#">
                    <svg class="bi" width="24" height="24">
                        <use xlink:href="#instagram"></use>
                    </svg>
                </a></li>
                <li class="ms-3"><a class="link-body-emphasis" href="#">
                    <svg class="bi" width="24" height="24">
                        <use xlink:href="#facebook"></use>
                    </svg>
                </a></li>
            </ul>
        </div>
    </div>
</footer>
<%--<!--<jsp:include page="footer.jsp"/>-->--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>

</body>
</html>