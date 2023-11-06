<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 8/8/2023
  Time: 11:21 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Điền thông tin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body style="background-color: #f5f5f5">
<jsp:include page="/home/header.jsp"></jsp:include>
<!--<img src="../tai_lieu_anh/Screenshot 2023-08-03 114957.png" height="126" width="100%"/>-->
<div class="row g-5" style="width: 85%;margin-right: 7.5%;margin-left: 7.5%;margin-top: 20px">
    <div class="col-md-8" style="background-color: white;border-radius: 10px">
        <h4 style="color: #ff5b00;padding-top: 10px;padding-left: 20px">Điền thông tin</h4>
        <hr>
        <div>
            <h2 style="color: #ff5b00;display: inline-block">|</h2>
            <h5 style="display: inline-block">Thông tin đơn hàng</h5>
        </div>
        <div style="width: 743px;height: 137px;border-radius: 10px;border: #e3dddd solid 1px;margin: 15px">
            <table>
                <tr>
                    <td><img style="width: 88px;height: 88px;border-radius: 10px;margin: 20px"
                             src="../anh/${image[0]}"></td>
                    <td>
                        <h5>${tourname} </h5>
                        <p>Tour ghép </p>
                    </td>
                </tr>
            </table>
        </div>
        <div>
            <h2 style="color: #ff5b00;display: inline-block">|</h2>
            <h5 style="display: inline-block">Thông tin liên hệ</h5>
        </div>
        <p style="margin-left: 18px;color: grey">Chúng tôi sẽ thông báo mọi thay đổi về đơn hàng cho bạn</p>
        <h6 style="margin-left: 25px">Thông tin người đại diện</h6>
        <form>
            <div class="row mb-4">
                <div class="col">
                    <div class="form-outline">
                        <input placeholder="Họ và tên" type="text" id="form6Example1" class="form-control"/>
                    </div>
                </div>
            </div>
            <div class="form-outline mb-4">
                <input placeholder="Địa chỉ" type="text" id="form6Example4" class="form-control"/>
            </div>
            <div class="form-outline mb-4">
                <input placeholder="Email" type="email" id="form6Example5" class="form-control"/>
            </div>
            <div class="form-outline mb-4">
                <input placeholder="Số điện thoại" type="number" id="form6Example6" class="form-control"/>
            </div>
        </form>
    </div>

    <div class="col-md-4">
        <div style="width: 300px;height: 370px;background-color: white;border-radius: 20px;margin: 30px">
            <div style="padding: 15px">
                <h5 style="color: #ff5b00">Tóm tắt chuyến đi</h5>
                <div style="width: 270px;height: 90px;margin-top: 10px;margin-bottom: 10px">
                    <table>
                        <tr>
                            <td><img style="width: 65px;height: 62px;border-radius: 10px;margin: 5px"
                                     src="../anh/${image[0]}"></td>
                            <td>
                                <h5>${tourname}</h5>
                                <p>Tour ghép </p>
                            </td>
                        </tr>
                    </table>
                </div>
                <p style="display: inline-block;padding-right: 20%">Ngày Khởi Hành</p>
                <h6 style="display: inline-block;color: #ff5b00">${startdate}</h6>
                <p style="display: inline-block;padding-right: 20%">Ngày Kết Thúc</p>
                <h6 style="display: inline-block;color: #ff5b00">${enddate}</h6>
                <p style="display: inline-block;padding-right: 20%">Hành Khách</p>
                <h6 style="display: inline-block;color: #ff5b00">${quantity} x ${price}</h6>
                <h4 style="display: inline-block;padding-right: 10%">Tổng Cộng</h4>
                <h5 style="display: inline-block;color: #ff5b00">${sum}</h5>
                <a href="/PaymentServlet?amount=${sum}&customerid=2">
                    <button type="submit"
                            style="background-color: #ff5b00;color: white;text-align: center;
                            width: 260px;height: 45.6px;margin-top: 15px;border-radius: 10px;border:none;font-size: 20px">
                        Thanh Toán
                    </button>
                </a>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/home/footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>
