<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Thêm mới tour</title>

</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>
<div class="dashboard" id="wrapper-content">
    <div class="overview">
        <section class="vh-100 gradient-custom" style="height: 300vh !important; background-color:#DDE6ED">

            <div class="container py-5 h-100">
                <div class="row justify-content-center h-100">
                    <div class="col-12 col-lg-9 col-xl-7">
                        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
                            <div id="formCreate" class="card-body p-4 p-md-5"
                                 style="box-shadow: 0 0 10px rgba(0, 0, 0, 1); border-radius: 10px">
                                <img src="/images/simple.png"
                                     class="w-100"
                                     style="border-top-left-radius: .3rem; border-top-right-radius: .3rem; padding-bottom: 20px"
                                     alt="Sample photo">
                                <c:if test="${message != null}">
                                    <div class="alert alert-success d-flex align-items-center"
                                         role="alert" style="top: 10px">
                                        <svg class="bi flex-shrink-0 me-2" width="0" height="0"
                                             role="img" aria-label="Success:">
                                            <use xlink:href="#check-circle-fill"/>
                                        </svg>
                                        <div>
                                            <span class="error">
                                                <label>
                                                    <i class="fa-regular fa-circle-check"></i> ${message}
                                                </label>
                                                </span>
                                        </div>
                                    </div>
                                </c:if>
                                <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Thêm mới tour</h3>
                                <form method="post" action="tourServlet?action=create">
                                    <div class="row">
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <h6 class="form-label">Tên tour</h6>
                                                <input type="text" name="name" id="name"
                                                       class="form-control input-md"
                                                       placeholder="Nhập tên tour"
                                                       value="${tour.getTourName()}" required/>
                                            </div>
                                        </div>
                                        <div class="col-md-6 mb-4">

                                            <div class="form-outline">
                                                <h6 class="form-label">Khu vực</h6>
                                                <select id="t-place-id" name="t-place-id" class="form-control"
                                                        required>
                                                    <option value="" disabled selected>Hãy chọn vùng miền</option>
                                                    <c:forEach var="place" items="${place}">
                                                        <option value="${place.getTourPlaceId()}"
                                                                <c:if test="${place.getTourPlaceId() == tour.getTourPlaceId()}">selected</c:if>
                                                        >${place.getPlaceName()}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6 mb-4">

                                            <div class="form-outline">
                                                <h6 class="form-label" for="email">Giá tour</h6>
                                                <input id="price" name="price" placeholder="Nhập giá tour"
                                                       class="form-control input-md" required="" type="number"
                                                       value="${tour.getTourPrice()}">
                                            </div>

                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <h6 class="form-label">Quy mô nhóm</h6>
                                                <input id="quantity" name="quantity" placeholder="Nhập số luợng"
                                                       class="form-control input-md" required="" type="number"
                                                       value="${tour.getAvailableSeat()}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 mb-4">

                                            <div class="form-outline">
                                                <h6 class="form-label" size="15px">Ngày bắt đầu</h6>
                                                <input id="s-date" name="s-date" placeholder="Chọn ngày bắt đầu"
                                                       class="form-control input-md" required="" type="date"
                                                       value="${tour.getStartDate()}">
                                                <c:if test="${messageDB != null}">
                                                    <div class="alert alert-danger d-flex align-items-center"
                                                         role="alert" style="top: 10px">
                                                        <svg class="bi flex-shrink-0 me-2" width="0" height="0"
                                                             role="img" aria-label="Danger:">
                                                            <use xlink:href="#check-circle-fill"/>
                                                        </svg>
                                                        <div>
                                                            <span class="error">
                                                                <label>
                                                                        <i class="uil uil-ban"></i>
                                                                            ${messageDB}
                                                                </label>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </div>

                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <h6 class="form-label">Ngày kết thúc</h6>
                                                <input id="e-date" name="e-date" placeholder="Chọn ngày kết thúc"
                                                       class="form-control input-md" required="" type="date"
                                                       value="${tour.getEndDate()}">
                                                <c:if test="${messageDate != null}">
                                                    <div class="alert alert-danger d-flex align-items-center"
                                                         role="alert" style="top: 10px">
                                                        <svg class="bi flex-shrink-0 me-2" width="0" height="0"
                                                             role="img" aria-label="Danger:">
                                                            <use xlink:href="#check-circle-fill"/>
                                                        </svg>
                                                        <div>
                                                            <span class="error">
                                                                <label>
                                                                    <i class="uil uil-ban"></i> ${messageDate}
                                                                </label>
                                                            </span>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col">
                                            <div class="form-outline">
                                                <h6 class="form-label">Tên hướng dẫn viên</h6>
                                                <select id="eName" name="e-id" class="form-control" required
                                                        style="margin-bottom: 15px;">
                                                    <option value="" disabled selected>Hãy chọn hướng dẫn viên
                                                    </option>
                                                    <c:forEach var="eName" items="${nameEmployee}">
                                                        <option value="${eName.getEmployeeId()}"
                                                                <c:if test="${eName.getEmployeeId() == tour.getEmployeeId()}">selected</c:if>
                                                        >${eName.getEmployeeName()}</option>
                                                    </c:forEach>
                                                </select>
                                                <c:if test="${messageE != null}">
                                                    <div class="alert alert-danger d-flex align-items-center"
                                                         role="alert" style="top: 10px">
                                                        <svg class="bi flex-shrink-0 me-2" width="0" height="0"
                                                             role="img" aria-label="Danger:">
                                                            <use xlink:href="#check-circle-fill"/>
                                                        </svg>
                                                        <div>
                                                                <span class="error">
                                                                    <i class="uil uil-ban"></i>
                                                                    <label style="padding-left: 5px">
                                                                            ${messageE}
                                                                    </label>
                                                                </span>
                                                        </div>
                                                    </div>
                                                </c:if>
                                            </div>

                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6 mb-4">

                                            <div class="form-outline">
                                                <h6 class="form-label" size="15px">Điểm xuất phát</h6>
                                                <input id="s-place" name="s-place" placeholder="Nhập điểm bắt đầu"
                                                       class="form-control input-md"
                                                       required=""
                                                       type="text" value="${tour.getPlaceStart()}">
                                            </div>

                                        </div>
                                        <div class="col-md-6 mb-4">
                                            <div class="form-outline">
                                                <h6 class="form-label">Điểm đến</h6>
                                                <input id="e-place" name="e-place" placeholder="Nhập điểm kết thúc"
                                                       class="form-control input-md"
                                                       required=""
                                                       type="text" value="${tour.getPlaceEnd()}">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-12">

                                            <div class="form-outline">
                                                <h6 class="form-label" size="15px">Thêm ảnh</h6>
                                                <input id="pic1" name="pic1" class="input-file" type="file"
                                                       required style="margin-bottom: 15px;">
                                            </div>

                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">

                                            <div class="form-outline">
                                                <input id="pic2" name="pic2" class="input-file" type="file" value="${img1}"
                                                       required style="margin-bottom: 15px;">
                                            </div>

                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-12">

                                            <div class="form-outline">
                                                <input id="pic3" name="pic3" class="input-file" type="file"
                                                       required style="margin-bottom: 15px;">
                                            </div>

                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-12">

                                            <div class="form-outline">
                                                <h6 class="form-label" size="15px">Mô tả</h6>
                                                <textarea class="form-control" id="desc" name="desc"
                                                          placeholder="Nhập mô tả"
                                                          required>${tour.getTourDesc()}</textarea>
                                            </div>

                                        </div>
                                    </div>


                                    <div class="mt-4 pt-2">
                                        <input class="btn btn-primary btn-lg" type="submit" value="Thêm mới"/>
                                        <a class="btn btn-secondary btn-lg" href="/tourServlet">Trở về</a>
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
</body>
</html>
