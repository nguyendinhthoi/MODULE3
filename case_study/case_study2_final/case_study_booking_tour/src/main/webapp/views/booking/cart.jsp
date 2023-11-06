<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 7/31/2023
  Time: 5:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Booking Tour</title>
    <link rel="stylesheet" href="font.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css"
          integrity="sha384-DyZ88mC6Up2uqS4h/KRgHuoeGwBcD4Ng9SiP4dIRy0EXTlnuz47vAwmeGwVChigm" crossorigin="anonymous"/>
</head>
<body style="background-color: #f5f5f5">
<%--<div class="container">--%>
<%--    <header class="d-flex flex-wrap justify-content-center py-3 mb-4 border-bottom">--%>
<%--        <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-dark text-decoration-none">--%>
<%--            <svg class="bi me-2" width="40" height="32">--%>
<%--                <use xlink:href="#bootstrap"></use>--%>
<%--            </svg>--%>
<%--            <span class="fs-4" style=" font-family: 'Lobster';font-size: 70px;color: #ff5b00 ">Simple </span>--%>
<%--        </a>--%>
<%--        <input type="text" placeholder=" Search..." style="border-radius: 35px;width: 200px;background-color: #f5f5f5">--%>
<%--        <ul class="nav nav-pills">--%>
<%--            <li class="nav-item"><a href="/RoleServlet" class="nav-link" style="color: #222222">Trang Chủ</a></li>--%>
<%--            <li class="nav-item"><a href="/tourServlet" class="nav-link" style="color: #222222">Tour</a></li>--%>
<%--            <li class="nav-item"><a href="#" class="nav-link" style="color: #222222">Liên Hệ</a></li>--%>
<%--            <li>--%>
<%--                <div class="dropdown text-end" style="margin-left: 35px">--%>
<%--                    <a href="#" class="d-block link-body-emphasis text-decoration-none dropdown-toggle"--%>
<%--                       data-bs-toggle="dropdown" aria-expanded="false" style="color: #222222">--%>
<%--                        <img src="https://github.com/mdo.png" alt="mdo" width="32" height="32" class="rounded-circle">--%>
<%--                        Nguyễn Văn A--%>
<%--                    </a>--%>
<%--                    <ul class="dropdown-menu text-small">--%>
<%--                        <li><a class="dropdown-item" href="#">New project...</a></li>--%>
<%--                        <li><a class="dropdown-item" href="#">Settings</a></li>--%>
<%--                        <li><a class="dropdown-item" href="#">Profile</a></li>--%>
<%--                        <li>--%>
<%--                            <hr class="dropdown-divider">--%>
<%--                        </li>--%>
<%--                        <li><a class="dropdown-item" href="#">Sign out</a></li>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </li>--%>
<%--        </ul>--%>
<%--    </header>--%>
<%--</div>--%>
<jsp:include page="/home/header.jsp"></jsp:include>
<%--------------------------------------------------------------------------------------------------------------%>
<div class="row g-5" style="width: 90%;margin-left: 5%;margin-right: 5%;margin-top: 5%">
    <div class="col-md-8">
        <c:forEach var="bookings" items="${bookings}">
            <div>
                <table style="width:858px;height: 192.8px;margin: 30px;background-color: white;border-radius: 20px">
                    <tr>
                        <td colspan="1" style="width: 66px"></td>
                        <td colspan="2" style="width: 132px"><img
                                src="../anh/${bookings.img[0]}"
                                style="width: 88px;height: 88px;border-radius: 5px"></td>
                        <td colspan="7" style="width: 462px">
                            <h5 name="tourname">${bookings.tourName}</h5>
                            <p>Tour ghép</p>
                        </td>
                        <td colspan="1" style="width: 66px">
                            <a href="/BookingServlet?action=deletequantitycart&id=${bookings.tourId}&quantity=${bookings.quantity} ">
                                <button type="submit"
                                        style="width: 28px;height: 28px;border-radius: 5px;align-items: center;border: none">
                                    <i class="fas fa-minus"></i></button>
                            </a>
                        </td>
                        <td colspan="1" style="width: 66px" name="quantity">${bookings.quantity}</td>
                        <td colspan="1" style="width: 66px">
                            <a href="/BookingServlet?action=checkquantity&id=${bookings.tourId}&quantity=${bookings.quantity}">
                                <button type="submit"
                                        style="width: 28px;height: 28px;border-radius: 5px;align-items: center;border: none">
                                    <i class="fas fa-plus"></i></button>
                            </a>
                        </td>
<%--                        <td colspan="1" style="width: 66px">--%>
<%--                            <button type="button"--%>
<%--                                    style="width: 28px;height: 28px;border-radius: 5px;align-items: center;border: none"--%>
<%--                                    onclick="changeQuantity('deletequantitycart', ${bookings.tourId}, ${bookings.quantity})">--%>
<%--                                <i class="fas fa-minus"></i>--%>
<%--                            </button>--%>
<%--                        </td>--%>
<%--                        <td colspan="1" style="width: 66px" id="quantityCell">${bookings.quantity}</td>--%>
<%--                        <td colspan="1" style="width: 66px">--%>
<%--                            <button type="button"--%>
<%--                                    style="width: 28px;height: 28px;border-radius: 5px;align-items: center;border: none"--%>
<%--                                    onclick="changeQuantity('checkquantity', ${bookings.tourId}, ${bookings.quantity})">--%>
<%--                                <i class="fas fa-plus"></i>--%>
<%--                            </button>--%>
<%--                        </td>--%>

                    </tr>
                    <tr>
                        <td colspan="1"></td>
                        <td colspan="2">
<%--                            <a style="color: black"--%>
<%--                                           href="/BookingServlet?action=deletecart&id=${bookings.tourId}">Xóa</a>--%>
                        </td>
                        <td colspan="8"></td>
                        <td colspan="2">đ${bookings.tourPrice}
                        </td>
                    </tr>
                </table>
            </div>
        </c:forEach>
    </div>
    <div class="col-md-4">
        <div style="width: 270px;height: 191.6px;background-color: white;border-radius: 20px;margin: 30px;position: absolute">
            <div style="padding: 15px">
                <p>Tổng Cộng</p>
                <h3  >đ
<%--                    <div id="sum">--%>
                        ${sum}
<%--                    </div>--%>
                </h3>
<%--                <a href="/PaymentServlet?amount=${sum}&customerid=2">--%>
<%--                    <button type="submit"--%>
<%--                            style="background-color: #ff5b00;color: white;text-align: center;--%>
<%--                            width: 230px;height: 45.6px;margin-top: 15px;border-radius: 10px;border:none;font-size: 20px">--%>
<%--                        Thanh Toán--%>
<%--                    </button>--%>
<%--                </a>--%>
                <a href="/BookingServlet?action=form&customerid=1&idacc=${sessionScope.account.id}">
                    <button type="submit"
                            style="background-color: #ff5b00;color: white;text-align: center;
                            width: 230px;height: 45.6px;margin-top: 15px;border-radius: 10px;border:none;font-size: 20px">
                        Thanh Toán
                    </button>
                </a>
            </div>
        </div>
    </div>
</div>
</div>
<jsp:include page="/home/footer.jsp"></jsp:include>
<% String check = (String) request.getAttribute("check"); %>
<% String checkQuantity = (String) request.getAttribute("checkQuantity"); %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<script>
    var checkQuantity = <%=checkQuantity%>;
    var check =<%=check%>;
    console.log(checkQuantity)
    // function changeQuantity(action, tourId, quantity) {
    //     var url = "/BookingServlet?action=" + action + "&id=" + tourId + "&quantity=" + quantity;
    //     sendAjaxRequest(url, function (response) {
    //         // Cập nhật nội dung trang dựa trên dữ liệu trả về từ Servlet
    //         var quantityCell = document.getElementById("quantityCell");
    //         var sum = document.getElementById("sum");
    //
    //         if (action === "checkquantity") {
    //             checkQuantity = "false";
    //             var cleanedInput = parseInt(sum.textContent.replace(/,/g,''));
    //             console.log(cleanedInput)
    //             var int = parseInt(quantityCell.textContent);
    //             console.log(int)
    //             var currentSum = cleanedInput + (cleanedInput / int);
    //             console.log(currentSum);
    //             sum.innerText = formatNumber(currentSum); // Định dạng lại số nguyên thành chuỗi có dấu phẩy
    //             console.log(sum.innerText)
    //             quantityCell.innerText = parseInt(quantityCell.textContent) + 1;
    //         } else if (action === "deletequantitycart") {
    //             var cleanedInput = parseInt(sum.textContent.replace(/,/g,''));
    //             console.log(cleanedInput)
    //             var int = parseInt(quantityCell.textContent);
    //             console.log(int)
    //             var currentSum = cleanedInput - (cleanedInput / int);
    //             console.log(currentSum);
    //             sum.innerText = formatNumber(currentSum);
    //             console.log(sum.innerText)
    //             quantityCell.innerText = parseInt(quantityCell.textContent) - 1;
    //         }
    //     });
    // }
    if (check) {
        console.log(123)
        swal({
            title: "Xác Nhận Tour Thành Công!",
            text: "Cảm ơn quý khách sử dụng dịch vụ chúng tôi!",
            icon: "success",
            button: "OK!",
        });
    }
    if (!checkQuantity) {
        console.log(123)
        swal({
            icon: 'error',
            title: 'Lỗi',
            text: 'Số lượng khách tối da!',
            footer: '<a href="">Why do I have this issue?</a>'
        });
    }
    // Hàm gửi yêu cầu AJAX
    // function sendAjaxRequest(url, callback) {
    //     var xhr = new XMLHttpRequest();
    //     xhr.open("GET", url, true);
    //     xhr.onreadystatechange = function () {
    //         if (xhr.readyState === 4 && xhr.status === 200) {
    //             callback(xhr.responseText);
    //         }
    //     };
    //     xhr.send();
    // }

    // Sự kiện khi người dùng nhấp vào nút "Thêm" hoặc "Giảm"
    // function changeQuantity(action, tourId, quantity) {
    //     var url = "/BookingServlet?action=" + action + "&id=" + tourId + "&quantity=" + quantity;
    //     sendAjaxRequest(url, function (response) {
    //         // Cập nhật nội dung trang dựa trên dữ liệu trả về từ Servlet
    //         var quantityCell = document.getElementById("quantityCell");
    //         var sum = document.getElementById("sum");
    //         var cleanedInput = sum.replace(/,/g, '');
    //         console.log(true);
    //         if (action === "checkquantity") {
    //             quantityCell.innerText = parseInt(quantityCell.textContent) + 1 + "";
    //             sum.innerText = parseInt(cleanedInput.textContent) + (parseInt(cleanedInput.textContent)/parseInt(quantityCell.textContent)) + "";
    //         } else if (action === "deletequantitycart") {
    //             quantityCell.innerText = parseInt(quantityCell.textContent) - 1 + "";
    //         }
    //     });
    // }


    // Hàm định dạng số nguyên thành chuỗi có dấu phẩy
    // function formatNumber(number) {
    //     return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    // }


</script>

</body>
</html>
