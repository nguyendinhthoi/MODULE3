<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2/8/2023
  Time: 5:11 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đăng kí tài khoản</title>
    <link rel="stylesheet" href="/bootstrap-5.2.3-dist/css/bootstrap.css">
</head>
<body>
<section class="vh-100" style="background-color:white;">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col col-xl-10">
                <div class="card" style="border-radius: 1rem;">
                    <div class="row g-0">
                        <div class="col-md-6 col-lg-5 d-none d-md-block">
                            <img src="https://i.pinimg.com/564x/58/4e/48/584e488642a0d49dfa869dfc87360734.jpg"
                                 alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem; min-height: 100%" />
                        </div>
                        <div class="col-md-6 col-lg-7 d-flex align-items-center" style="background-color: #bcdff3">
                            <div class="card-body p-4 p-lg-5 text-black">

                                <form method="post">

                                    <div class="d-flex align-items-center mb-3 pb-1" style="margin-left:30%">
                                        <i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
                                        <span class="h1 fw-bold mb-0" >Đăng ký</span>
                                    </div>

                                    <p class="text-bg-danger" style="text-align: center">${alert}</p>
                                    <p class="text-bg-danger" style="text-align: center">${message}</p>
                                    <p class="text-bg-danger" style="text-align: center">${error}</p>
                                    <p class="text-bg-danger" style="text-align: center">${error1}</p>
                                    <p class="text-bg-primary" style="text-align: center; background-color: #0d6efd">${success}</p>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="form2Example17">Tên đăng nhập</label>
                                        <input name="user" type="text" id="form2Example17" class="form-control form-control-lg" value="${user}" placeholder="Nhập vào đây.." required/>
                                    </div>

                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="form2Example27">Mật khẩu</label>
                                        <input name="password" type="password" id="form2Example27" class="form-control form-control-lg"  placeholder="Nhập vào đây.." required/>
                                    </div>
                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="form2Example37">Xác nhận mật khẩu</label>
                                        <input name="repeat-password" type="password" id="form2Example37" class="form-control form-control-lg" placeholder="Nhập vào đây.." required />
                                    </div>

                                    <div class="form-outline mb-4">
                                        <label class="form-label" for="form2Example17">Email</label>
                                        <input name="email" type="email" id="form2Example47" class="form-control form-control-lg" value="${email}" placeholder="Nhập vào đây.." required/>
                                    </div>

                                    <div class="pt-1 mb-4">
                                        <button class="btn btn-dark btn-lg btn-block" type="submit">Đăng ký</button>
                                    </div>

                                    <a class="small text-muted" href="/account?action=reset">Quên mật khẩu?</a>
                                    <p class="mb-5 pb-lg-2" style="color: #393f81;">Bạn đã có tài khoản? <a href="/account?action=login" style="color: #393f81;">Đăng nhập ngay.</a></p>
                                    <a href="/account?action=home" class="small text-muted">Quay về trang chủ.</a>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<script src="/bootstrap-5.2.3-dist/js/bootstrap.bundle.js"></script>
</body>
</html>
