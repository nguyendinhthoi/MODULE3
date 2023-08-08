<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="/bootstrap-5.2.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="//cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="/views/list.css">
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
<div class="container-fluid">
    <div class="content row">
        <table id="table" class="table table-hover table-striped table-bordered">
            <thead class="thead col-12 col-sm-6 col-md-3 col-xl-auto">
            <tr>
                <td>
                    Tên Tour
                    <a role="button" class="btn" href="tourServlet?action=create">
                        <i class="fa-solid fa-plus fa-spin fa-lg" title="Thêm mới" style="color: #0f3371;"></i>
                    </a>
                </td>
                <td>Giá Tour</td>
                <td>Số lượng</td>
                <td>Ngày bắt đầu</td>
                <td>Ngày kết thúc</td>
                <td>Tên hướng dẫn viên</td>
                <td>Chi tiết</td>
                <td>Sửa</td>
                <td>
                    Xoá
                </td>
            </tr>
            </thead>
            <tbody class=" col-12 col-sm-6 col-md-3 col-xl-auto">
            <c:forEach items="${tours}" var="tour">
                <tr>
                    <td>${tour.getTourName()}</td>
                    <fmt:setLocale value="vi_VN"/>
                    <c:set var="price" value="${tour.getTourPrice()}"/>
                    <td>
                        <fmt:formatNumber value="${price}" type="currency" currencySymbol="₫"/>
                    </td>
                    <td>${tour.getAvailableSeat()}</td>
                    <c:set var="dateString" value="${tour.getStartDate()}"/>
                    <fmt:parseDate value="${dateString}" var="date" pattern="yyyy-MM-dd"/>
                    <td>
                        <fmt:formatDate value="${date}" pattern="dd/MM/yyyy"/>
                    </td>
                    <c:set var="dateString1" value="${tour.getEndDate()}"/>
                    <fmt:parseDate value="${dateString1}" var="date1" pattern="yyyy-MM-dd"/>
                    <td>
                        <fmt:formatDate value="${date1}" pattern="dd/MM/yyyy"/>
                    </td>
                    <td>${tour.getEmployeeName()}</td>
                    <td>
                        <a role="button" class="btn" href="tourServlet?action=view&id=${tour.getTourId()}">
                            <i class="fa-solid fa-info fa-beat" title="Xem chi tiết" style="color: #0f3371;"></i>
                        </a>
                    </td>
                    <td>
                        <a role="button" class="btn" href="tourServlet?action=edit&id=${tour.getTourId()}">
                            <i class="fa-solid fa-pen-to-square fa-beat" title="Sửa thông tin"
                               style="color: #0f3371;"></i>
                        </a>
                    </td>
                    <td>
                        <button type="button" class="btn"
                                onclick="showModal('${tour.getTourId()}','${tour.getTourName()}')">
                            <i class="fa-solid fa-trash fa-beat" title="Xoá Tour" style="color: #ea060a;"></i>
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <form action="/tourServlet?action=delete" method="post">
        <div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">XOÁ</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <input type="hidden" name="code" id="code">
                    <div class="modal-body">
                        Bạn có muốn xóa Tour <b><span id="name"></span></b> không?
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                        <button type="submit" class="btn btn-primary">Xác nhận</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>

<script src="/bootstrap-5.2.3-dist/js/bootstrap.bundle.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.js" integrity="sha256-JlqSTELeR4TLqP0OG9dxM7yDPqX1ox/HfgiSLBj8+kM="
        crossorigin="anonymous"></script>
<script src="//cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
<script>
    new DataTable('#table');

    function showModal(id, name) {
        document.getElementById("name").innerHTML = name;
        document.getElementById("code").value = id;
        $("#deleteModal").modal("show");
    }

</script>
</body>
</html>
