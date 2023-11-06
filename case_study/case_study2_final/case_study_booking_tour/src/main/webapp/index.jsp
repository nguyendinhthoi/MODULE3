<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Simple Booking</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link href='https://fonts.googleapis.com/css?family=Lobster' rel='stylesheet'>
    <link href='https://fonts.googleapis.com/css?family=Lugrasimo' rel='stylesheet'>
    <style>


        <%--        /*    ----------------------------------------------*/--%>
        .carousel .input-group {
            padding-top: 280px;
            padding-left: 150px;
            position: absolute;
            z-index: 2;
        }

        ​
        .carousel .intro span {
            color: rgba(255, 255, 255, 1);
            font-size: 20px;
            font-family: Arial;
        }

        ​
        .carousel .form-control {
            font-size: 1.5rem;
        }

        a {
            text-decoration: none;
            color: black !important;
        }
    </style>
</head>
<body>
<jsp:include page="/home/header.jsp"/>
<!------------------------------------------------------------->
<div id="carousel">
    <div id="carouselExampleControl" class="carousel slide" data-bs-ride="carousel" style="text-align: center">
        <div class="intro" style="padding-top: 160px;
            padding-left: 150px;
            position: absolute;
            z-index: 2;">
            <span style="  color: rgba(255, 255, 255, 1);
            font-size: 20px;
            font-family: Arial;">
                <div class="introhead" style="  color: rgba(255, 255, 255, 1);
            font-size: 50px;
            text-align: left;">THẾ GIỚI TRỌN NIỀM VUI</div>
                <div class="introinfo">Từ chuyến phượt "ngẫu hứng" đến những cuộc phiêu lưu, khám phá công thức niềm vui của riêng bạn.</div>
​
            </span>
        </div>
        <div class="input-group mb-3" style="width: 60%">
            <input type="text" class="form-control" style="border-radius: 10px;z-index: 5" placeholder="Search"
                   aria-label="Recipient's username" aria-describedby="button-addon2">
            <button class="btn btn-secondary" type="button" id="button-addon2" style="border-radius: 10px;border: #ff5c00 solid 0.5px ;background-color:#ff5c00;margin-left: -75px;
    margin-top: 2px;margin-bottom: 2px;z-index: 10;height: 40px">Search
            </button>
        </div>
        <div class="carousel-inner" style="height: 500px; z-index: 1;">
            <div class="carousel-item active">
                <img src="https://res.klook.com/image/upload/fl_lossy.progressive,q_90/c_fill,,w_2560,/v1670577678/banner/tvhfgpkiapfldzoaj8ll.webp"
                     class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://res.klook.com/image/upload/fl_lossy.progressive,q_90/c_fill,,w_2560,/v1670577664/banner/rtw7fgqatgoc1vpcpamb.webp"
                     class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
                data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
                data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>
<!------------------------------------------------------------->
<div style="margin-left: 170px;margin-bottom: 50px">
    <h2 style="margin-bottom: 50px">Vì sao bạn nên chọn chúng tôi</h2>
    <div class="card" style="width: 18rem;border: none;margin-right: 20px;display: inline-block">
        <img src="https://res.klook.com/image/upload/fl_lossy.progressive,q_85/c_fill,w_112,h_112/v1663655841/ued/platform/Discover_the_possibilities.webp"
             class="card-img-top" alt="..." style="width: 70px;height: 70px;margin-left: 15px">
        <div class="card-body">
            <h4>Nhiều sự lựa chọn</h4>
            <p class="card-text">Tìm kiếm niềm vui của bạn với gần nửa triệu điểm tham quan, khách sạn và hơn thế
                nữa.</p>
        </div>
    </div>
    <div class="card" style="width: 18rem;border: none;margin-right: 20px;display: inline-block">
        <img src="https://res.klook.com/image/upload/fl_lossy.progressive,q_85/c_fill,w_112,h_112/v1663655837/ued/platform/Enjoy_deals_delights.webp"
             class="card-img-top" alt="..." style="width: 70px;height: 70px;margin-left: 15px">
        <div class="card-body">
            <h4>Ưu đã giá tốt </h4>
            <p class="card-text">Dịch vụ hàng đầu. Giá tốt. Và nhận Klook credit để được giảm giá cho đơn hàng tiếp
                theo.</p>
        </div>
    </div>
    <div class="card" style="width: 18rem;border: none;margin-right: 20px;display: inline-block">
        <img src="https://res.klook.com/image/upload/fl_lossy.progressive,q_85/c_fill,w_112,h_112/v1663655837/ued/platform/Exploring_made_easy.webp"
             class="card-img-top" alt="..." style="width: 70px;height: 70px;margin-left: 15px">
        <div class="card-body">
            <h4>Dễ dàng khám phá</h4>
            <p class="card-text">Đặt hàng phút chót, bỏ qua hàng chờ và được miễn phí hủy để tận hưởng trọn vẹn.</p>
        </div>
    </div>
    <div class="card" style="width: 18rem;border: none;margin-right: 20px;display: inline-block">
        <img src="https://res.klook.com/image/upload/fl_lossy.progressive,q_85/c_fill,w_112,h_112/v1663655837/ued/platform/Travel_you_can_trust.webp"
             class="card-img-top" alt="..." style="width: 70px;height: 70px;margin-left: 15px">
        <div class="card-body">
            <h4>Đáng tin cậy</h4>
            <p class="card-text">Đọc đánh giá chân thực và được hỗ trợ tận tình. Chúng tôi sẽ phục vụ bạn từng
                bước.</p>
        </div>
    </div>
</div>
<%--<!----------------------------------------------------------------------------------------------------------------------------------------------->--%>
<h2 style="margin-bottom: 50px;margin-left: 170px;margin-top: 50px">Những tour du lịch thú vị</h2>
<div id="carouselExampleControls" class="carousel carousel-dark slide" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active">
            <div class="card-wrapper container-sm d-flex  justify-content-around" style="margin-left:70px ">
                <div class="row row-cols-1 row-cols-md-3 g-4">
                    <a href="tourServlet?action=view&id=1">
                        <div class="col" style="width:274px;margin-right: 30px">
                            <div class="col">
                                <div class="card h-100" style="width: 273px">
                                    <img src="/images/carosel/sapa.jpg"
                                         class="card-img-top"
                                         alt="..." style="width: 273px;height: 161px">
                                    <div class="card-body" style="height: 184px">
                                        <h5 class="card-title">Tour Sapa phiêu lưu</h5>
                                        <p class="card-text">Khám phá vẻ đẹp của Sapa và những cảnh quan tuyệt đẹp,
                                            cùng với những cuộc phiêu lưu và trải nghiệm đầy thú vị.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a href="tourServlet?action=view&id=2">
                        <div class="col" style="width:274px;margin-right: 30px">
                            <div class="col">
                                <div class="card h-100" style="width: 273px">
                                    <img src="/images/carosel/halong.jpg"
                                         class="card-img-top"
                                         alt="..." style="width: 273px;height: 161px">
                                    <div class="card-body" style="height: 184px">
                                        <h5 class="card-title">Khám phá Hạ Long</h5>
                                        <p class="card-text">Khám phá vẻ đẹp thiên nhiên tuyệt đẹp của Vịnh Hạ Long
                                            và các hòn đảo đáng ngưỡng mộ.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a href="tourServlet?action=view&id=3">
                        <div class="col" style="width: 274px;margin-right: 30px">
                            <div class="col">
                                <div class="card h-100" style="width: 273px">
                                    <img src="/images/carosel/ninhbinh.jpg"
                                         class="card-img-top"
                                         alt="..." style="width: 273px;height: 161px">
                                    <div class="card-body" style="height: 184px">
                                        <h5 class="card-title">Tham quan Ninh Bình</h5>
                                        <p class="card-text">Tham quan cảnh quan đẹp như tranh vẽ của Ninh Bình
                                            với các hang động, thung lũng và ngôi chùa lịch sử.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="card-wrapper container-sm d-flex  justify-content-around" style="margin-left:70px ">
                <div class="row row-cols-1 row-cols-md-3 g-4">
                    <a href="tourServlet?action=view&id=4">
                        <div class="col" style="width: 274px">
                            <div class="col">
                                <div class="card h-100" style="width: 273px">
                                    <img src="/images/carosel/quanhbinh.jpg"
                                         class="card-img-top"
                                         alt="..." style="width: 273px;height: 161px">
                                    <div class="card-body" style="height: 184px">
                                        <h5 class="card-title">Phiêu lưu Quảng Bình</h5>
                                        <p class="card-text">Khám phá những hang động và cảnh quan tuyệt đẹp của Quảng
                                            Bình,
                                            thưởng thức cảnh quan thiên nhiên hoang sơ và các hoạt động phiêu lưu hấp
                                            dẫn.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a href="tourServlet?action=view&id=8">
                        <div class="col" style="width: 274px;margin-right: 30px">
                            <div class="col">
                                <div class="card h-100" style="width: 273px">
                                    <img src="/images/carosel/dalat.jpg"
                                         class="card-img-top"
                                         alt="..." style="width: 273px;height: 161px">
                                    <div class="card-body" style="height: 184px">
                                        <h5 class="card-title">Hành trình Đà Lạt</h5>
                                        <p class="card-text">Trải nghiệm khí hậu mát mẻ và vẻ đẹp thiên nhiên của Đà
                                            Lạt,
                                            khám phá những điểm du lịch nổi tiếng và thưởng thức ẩm thực độc đáo.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a href="tourServlet?action=view&id=9">
                        <div class="col" style="width: 274px;margin-right: 30px">
                            <div class="col">
                                <div class="card h-100" style="width: 273px">
                                    <img src="/images/carosel/phuquoc.jpg"
                                         class="card-img-top"
                                         alt="..." style="width: 273px;height: 161px">
                                    <div class="card-body" style="height: 184px">
                                        <h5 class="card-title">Khám phá Kỳ quan thiên nhiên Phú Quốc</h5>
                                        <p class="card-text">Phú Quốc - Ngọc đảo thiên nhiên với bãi biển trắng,
                                            rừng nguyên sinh và hải sản tươi ngon. Trải nghiệm độc đáo chờ bạn!</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <div class="carousel-item">
            <div class="card-wrapper container-sm d-flex  justify-content-around" style="margin-left:70px ">
                <div class="row row-cols-1 row-cols-md-3 g-4">
                    <a href="tourServlet?action=view&id=5">
                        <div class="col" style="width:274px;margin-right: 30px">
                            <div class="col">
                                <div class="card h-100" style="width: 273px">
                                    <img src="/images/carosel/hue.jpg"
                                         class="card-img-top"
                                         alt="..." style="width: 273px;height: 161px">
                                    <div class="card-body" style="height: 184px">
                                        <h5 class="card-title">Tour lịch sử Huế</h5>
                                        <p class="card-text">Khám phá thành phố cổ Huế và lịch sử phong phú của nó,
                                            đồng thời tham quan các di tích lịch sử và kiến trúc độc đáo.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a href="tourServlet?action=view&id=6">
                        <div class="col" style="width:274px;margin-right: 30px">
                            <div class="col">
                                <div class="card h-100" style="width: 273px">
                                    <img src="/images/carosel/danang.jpg"
                                         class="card-img-top"
                                         alt="..." style="width: 273px;height: 161px">
                                    <div class="card-body" style="height: 184px">
                                        <h5 class="card-title">Khám phá Đà Nẵng</h5>
                                        <p class="card-text">Khám phá sự quyến rũ của thành phố Đà Nẵng và những bãi
                                            biển
                                            đẹp, cùng với các hoạt động vui chơi thú vị.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>
                    <a href="tourServlet?action=view&id=7">
                        <div class="col" style="width: 274px;margin-right: 30px">
                            <div class="col">
                                <div class="card h-100" style="width: 273px">
                                    <img src="/images/carosel/quynhon.jpg"
                                         class="card-img-top"
                                         alt="..." style="width: 273px;height: 161px">
                                    <div class="card-body" style="height: 184px">
                                        <h5 class="card-title">Nghỉ dưỡng Quy Nhơn</h5>
                                        <p class="card-text">Thư giãn tại những bãi biển yên bình của Quy Nhơn và thưởng
                                            thức hải sản tươi ngon, trải nghiệm các hoạt động ngoài trời thú vị.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </a>

                </div>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls"
                data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls"
                data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>
<!------------------------------------------------------------------------------------------------------------------->

<!------------------------------------------------------------------------------------------------------------------->
<jsp:include page="/home/footer.jsp"/>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
</body>
</html>