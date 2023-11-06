<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/3/2023
  Time: 6:02 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="/bootstrap-5.2.3-dist/css/bootstrap.css" rel="stylesheet">
    <style>
        .message {
            color: green;
        }
    </style>
</head>
<body>
<h2 style="text-align: center">Sửa thông tin Tour</h2>

<c:if test="${message != null}">
    <span class="message">${message}</span>
</c:if>
<div class="container">
    <form class="form-control" method="post">
        <fieldset>
            <legend>Thông tin Tour</legend>
            <table class="table table-hover table-bordered">
                <tr>
                    <td>
                        <label class="form-label" for="tour_name">Tên Tour</label>
                    </td>
                    <td>
                        <input id="tour_name" name="name" placeholder="NHẬP TÊN TOUR" class="form-control input-md "
                               required="" type="text" value="${tour.getTourName()}">
                    </td>
                </tr>
                <!-- Select Basic -->
                <tr>
                    <td>
                        <label class="form-label" for="t-place-name">Khu Vực</label>
                    </td>
                    <td>
                        <select id="t-place-name" name="t-place-id" class="form-control">
                            <c:forEach var="place" items="${place}">
                                <option value="${place.getTourPlaceId()}"
                                        <c:if test="${place.getTourPlaceId() == tour.getTourPlaceId()}">selected</c:if>
                                >${place.getPlaceName()}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <!-- Text input-->
                <tr>
                    <td>
                        <label class="form-lable" for="price">Giá Tour</label>
                    </td>
                    <td>
                        <input id="price" name="price" placeholder="NHẬP GIÁ TOUR"
                               class="form-control input-md" required="" type="number" value="${tour.getTourPrice()}">
                    </td>
                </tr>
                <!-- Text input-->
                <tr>
                    <td>
                        <label class="form-lable" for="quantity">Số lượng</label></td>
                    <td>
                        <input id="quantity" name="quantity" placeholder="NHẬP SỐ LUỢNG"
                               class="form-control input-md" required="" type="number"
                               value="${tour.getAvailableSeat()}">
                    </td>
                </tr>
                <!-- Textarea -->
                <tr>
                    <td>
                        <label class="form-lable" for="desc">Mô Tả</label>
                    </td>
                    <td>
                        <textarea class="form-control" id="desc" name="desc">${tour.getTourDesc()}</textarea>
                    </td>
                </tr>
                <!-- Text input-->
                <tr>
                    <td>
                        <label class="form-lable" for="s-date">Ngày Bắt Đầu</label>
                    </td>
                    <td>
                        <input id="s-date" name="s-date" placeholder="CHỌN NGÀY BẮT ĐẦU"
                               class="form-control input-md" required="" type="date" value="${tour.getStartDate()}">
                    </td>
                </tr>
                <!-- Text input-->
                <tr>
                    <td>
                        <label class="form-lable" for="e-date">Ngày Kết Thúc</label>
                    </td>
                    <td>
                        <input id="e-date" name="e-date" placeholder="CHỌN NGÀY KẾT THÚC"
                               class="form-control input-md" required="" type="date" value="${tour.getEndDate()}">
                    </td>
                </tr>
                <!-- Text input-->
                <tr>
                    <td>
                        <label class="form-label" for="eName">Tên Hướng Dẫn Viên</label>
                    </td>
                    <td>
                        <select id="eName" name="e-id" class="form-control">
                            <option value="" disabled selected>Hãy chọn Hướng Dẫn Viên</option>
                            <c:forEach var="eName" items="${nameEmployee}">
                                <option value="${eName.getEmployeeId()}"
                                        <c:if test="${eName.getEmployeeId() == tour.getEmployeeId()}">selected</c:if>
                                >${eName.getEmployeeName()}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>

                <!-- Text input-->
                <tr>
                    <td>
                        <label class="form-lable" for="s-place">Điểm Xuất Phát</label>
                    </td>
                    <td>
                        <input id="s-place" name="s-place" placeholder="NHậP ĐIỂM BẮT ĐẦU" class="form-control input-md"
                               required=""
                               type="text" value="${tour.getPlaceStart()}">
                    </td>
                </tr>
                <!-- Text input-->
                <tr>
                    <td>
                        <label class="form-label" for="e-place">Điểm Đến</label>
                    </td>
                    <td>
                        <input id="e-place" name="e-place" placeholder="NHậP ĐIỂM KẾT THÚC"
                               class="form-control input-md"
                               required=""
                               type="text" value="${tour.getPlaceEnd()}">
                    </td>
                </tr>
                <!-- File Button -->
                <tr>
                    <td rowspan="4">
                        <label class="form-label" for="pic1">Thêm Ảnh</label>
                        <c:forEach items="${listImage}" var="listImage">
                            <img width="20%" src="../anh/${listImage}" alt="">
                        </c:forEach>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input id="pic1" name="pic1" class="input-file" type="file">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input id="pic2" name="pic2" class="input-file" type="file">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input id="pic3" name="pic3" class="input-file" type="file">
                    </td>
                </tr>
                <tr>
                    <td>
                        <button type="submit" class="btn btn-primary" name="submit">
                            Xác nhận
                        </button>
                        <a role="button" class="btn btn-primary" href="/tourServlet">Quay lại trang chủ</a>
                    </td>
                </tr>
            </table>
        </fieldset>
    </form>
</div>
<script src="/bootstrap-5.2.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>
