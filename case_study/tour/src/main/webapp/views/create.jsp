<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="/bootstrap-5.2.3-dist/css/bootstrap.css" rel="stylesheet">
    <style>
        .message {
            color: green;
        }

        .messageE, .messageDate, .messageDB {
            color: red;
        }
    </style>
</head>
<body>
<!------ Include the above in your HEAD tag ---------->
<h2 style="text-align: center">Thêm mới Tour</h2>
<c:if test="${message != null}">
    <span class="message">${message}</span>
</c:if>
<c:if test="${messageE != null}">
    <span class="messageE">${messageE}</span>
</c:if>
<c:if test="${messageDate != null}">
    <span class="messageDate">${messageDate}</span>
</c:if>
<c:if test="${messageDB != null}">
    <span class="messageDB">${messageDB}</span>
</c:if>
<div class="container">
    <form class="form-control" method="post">
        <fieldset>
            <legend>Thông tin tour</legend>
            <table class="table table-hover table-bordered">
                <tr>
                    <td>
                        <label class="form-label" for="tour_name">Tên tour</label>
                    </td>
                    <td>
                        <input id="tour_name" name="name" placeholder="NHẬP TÊN TOUR" class="form-control input-md"
                               required="" type="text" value="${tour.getTourName()}">
                    </td>
                </tr>
                <!-- Select Basic -->
                <tr>
                    <td>
                        <label class=" form-label" for="t-place-id">Khu vực</label>
                    </td>
                    <td>
                        <select id="t-place-id" name="t-place-id" class="form-control" required>
                            <option value="" disabled selected>Hãy chọn vùng miền</option>
                            <c:forEach var="place" items="${place}">
                                <option value="${place.getTourPlaceId()}">
                                        ${place.getPlaceName()}
                                </option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <!-- Text input-->
                <tr>
                    <td>
                        <label class="form-lable" for="price">Giá tour</label>
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
                <%--                <!-- Text input-->--%>
                <tr>
                    <td>
                        <label class="form-lable" for="s-date">Ngày bắt đầu</label>
                    </td>
                    <td>
                        <input id="s-date" name="s-date" placeholder="CHỌN NGÀY BẮT ĐẦU"
                               class="form-control input-md" required="" type="date" value="${tour.getStartDate()}">
                    </td>
                </tr>
                <!-- Text input-->
                <tr>
                    <td>
                        <label class="form-lable" for="e-date">Ngày kết thúc</label>
                    </td>
                    <td>
                        <input id="e-date" name="e-date" placeholder="CHỌN NGÀY KẾT THÚC"
                               class="form-control input-md" required="" type="date" value="${tour.getEndDate()}">
                    </td>
                </tr>

                <!-- Text input-->
                <tr>
                    <td>
                        <label class="form-label" for="eName">Tên hướng dẫn viên</label>
                    </td>
                    <td>
                        <select id="eName" name="e-id" class="form-control" required>
                            <option value="" disabled selected>Hãy chọn hướng dẫn viên</option>
                            <c:forEach var="eName" items="${nameEmployee}">
                                <option value="${eName.getEmployeeId()}">
                                        ${eName.getEmployeeName()}
                                </option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>

                <!-- Text input-->
                <tr>
                    <td>
                        <label class="form-lable" for="s-place">Điểm xuất phát</label>
                    </td>
                    <td>
                        <input id="s-place" name="s-place" placeholder="NHậP ĐIỂM BẮT ĐẦU" class="form-control input-md"
                               required=""
                               type="text" value="${tour.getPlaceStart()}">
                    </td>
                </tr>
                <%--                <!-- Text input-->--%>
                <tr>
                    <td>
                        <label class="form-label" for="e-place">Điểm đến</label>
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
                        <label class="form-label" for="pic1">Thêm ảnh</label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input id="pic1" name="pic1" class="input-file" type="file" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input id="pic2" name="pic2" class="input-file" type="file" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input id="pic3" name="pic3" class="input-file" type="file" required>
                    </td>
                </tr>
                <!-- Textarea -->
                <tr>
                    <td>
                        <label class="form-lable" for="desc">Mô tả</label>
                    </td>
                    <td>
                        <textarea class="form-control" id="desc" name="desc" placeholder="NHẬP MÔ TẢ"
                                  required>${tour.getTourDesc()}</textarea>
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
