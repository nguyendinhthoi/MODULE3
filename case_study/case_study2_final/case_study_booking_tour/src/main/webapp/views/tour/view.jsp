<!--
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
-->
<!--
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tour</title>
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
<jsp:include page="/home/header.jsp"></jsp:include>
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
                    <th>Quy mô nhóm:</th>
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
        <div class="col-9"></div>
        <div class="col-3">
            <div class="row">
                <div class="col">
                    <fmt:setLocale value="vi_VN"/>
                    <c:set var="price" value="${tour.getTourPrice()}"/>
                    <td class="data-list">
                        <h3 style="color: red;font-size: 20px;">
                            <fmt:formatNumber value="${price}" type="currency" currencySymbol="₫"/>
                            / 1 người
                        </h3>
                    </td>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <c:if test="${sessionScope.account.id!=null}">
                    <a href="/BookingServlet?action=list&ida=${sessionScope.account.id}&id=${tour.getTourId()}&checkQuantity=0">
                        <button style="width: 150px; height: 40px" class="button-5" type="submit">
                            <h5>Đặt ngay</h5>
                        </button>
                    </a>
                    </c:if>

                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="/home/footer.jsp"></jsp:include>
<%--<!--<jsp:include page="footer.jsp"/>-->--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>

</body>
</html>