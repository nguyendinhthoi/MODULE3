<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<link href="/bootstrap-5.2.3-dist/css/bootstrap.css" rel="stylesheet">
<!------ Include the above in your HEAD tag ---------->
<h2>Thêm mới Tour</h2>
<form class="form-horizontal">
    <fieldset>
        <!-- Form Name -->
        <legend>Thông tin về Tour</legend>
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="tour_name">Tên Tour</label>
            <div class="col-md-4">
                <input id="tour_name" name="name" placeholder="NHẬP TÊN TOUR" class="form-control input-md"
                       required="" type="text">
            </div>
        </div>
        <!-- Select Basic -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="t-place-name">Khu Vực</label>
            <div class="col-md-4">
                <select id="t-place-name" name="t-place-name" class="form-control">
                    <c:forEach var="place" items="${place}">
                        <option>
                                ${place.getPlaceName()}
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="price">Gía Tour</label>
            <div class="col-md-4">
                <input id="price" name="price" placeholder="NHẬP GIÁ TOUR"
                       class="form-control input-md" required="" type="number">
            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="quantity">Số lượng</label>
            <div class="col-md-4">
                <input id="quantity" name="quantity" placeholder="NHẬP SỐ LUỢNG"
                       class="form-control input-md" required="" type="number">
            </div>
        </div>

        <!-- Textarea -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="desc">Mô Tả</label>
            <div class="col-md-4">
                <textarea class="form-control" id="desc" name="desc"></textarea>
            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="s-date">Ngày Bắt Đầu</label>
            <div class="col-md-4">
                <input id="s-date" name="s-date" placeholder="CHỌN NGÀY BẮT ĐẦU"
                       class="form-control input-md" required="" type="date">
            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="e-date">Ngày Kết Thúc</label>
            <div class="col-md-4">
                <input id="e-date" name="e-date" placeholder="CHỌN NGÀY KẾT THÚC"
                       class="form-control input-md" required="" type="date">
            </div>
        </div>
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="e-name">Tên Hướng Dẫn Viên</label>
            <div class="col-md-4">
                <input id="e-name" name="e-name" placeholder="NHẬP TÊN HƯỚNG DẪN VIÊN" class="form-control input-md"
                       required="" type="text">
            </div>
        </div>
        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="s-place">Điểm Xuất Phát</label>
            <div class="col-md-4">
                <input id="s-place" name="s-place" placeholder="NHậP ĐIỂM BẮT ĐẦU" class="form-control input-md"
                       required=""
                       type="text">
            </div>
        </div>

        <!-- Text input-->
        <div class="form-group">
            <label class="col-md-4 control-label" for="e-place">Điểm Đến</label>
            <div class="col-md-4">
                <input id="e-place" name="e-place" placeholder="NHậP ĐIỂM KẾT THÚC" class="form-control input-md"
                       required=""
                       type="text">
            </div>
        </div>

        <!-- File Button -->
        <div class="form-group">
            <label class="col-md-4 control-label" for="pic">Thêm Ảnh</label>
            <div class="col-md-4">
                <input id="pic" name="pic" class="input-file" type="file">
            </div>
        </div>
        <button type="submit" class="btn btn-primary">Tạo Mới</button>
        <button onclick="window.location.href='/tourServlet'" class="btn btn-primary">Quay Lại Trang Chủ</button>

    </fieldset>
</form>
<script src="/bootstrap-5.2.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>
