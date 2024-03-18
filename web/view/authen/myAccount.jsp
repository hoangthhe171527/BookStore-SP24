<%-- 
    Document   : myAccount
    Created on : Mar 12, 2024, 3:40:47 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>HonagBook</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">

        <!-- all css here -->
        <!-- bootstrap v3.3.6 css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <!-- animate css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animate.css">
        <!-- meanmenu css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/meanmenu.min.css">
        <!-- owl.carousel css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/owl.carousel.css">
        <!-- font-awesome css -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css"
              integrity="sha512-+L4yy6FRcDGbXJ9mPG8MT/3UCDzwR9gPeyFNMCtInsol++5m3bk2bXWKdZjvybmohrAsn3Ua5x8gfLnbE1YkOg=="
              crossorigin="anonymous"
              referrerpolicy="no-referrer" />
        <!-- flexslider.css-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flexslider.css">
        <!-- chosen.min.css-->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/chosen.min.css">
        <!-- style css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
        <!-- responsive css -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">

    </head>
    <body>
        <!-- header-area-start -->
        <header>
            <!-- header-top-area-start -->
            <jsp:include page="../common/homepage/header-top-area.jsp"></jsp:include>
                <!-- header-top-area-end -->
                <!-- header-mid-area-start -->
            <jsp:include page="../common/homepage/header-mid-area.jsp"></jsp:include>
                <!-- header-mid-area-end -->
                <!-- main-menu-area-start -->
            <jsp:include page="../common/homepage/main-menu-area.jsp"></jsp:include>
                <!-- main-menu-area-end -->
                <!-- mobile-menu-area-start -->
            <jsp:include page="../common/homepage/mobile-menu-area.jsp"></jsp:include>
                <!-- mobile-menu-area-end -->
            </header>
            <!-- header-area-end -->
            <!-- breadcrumbs-area-start -->
        <jsp:include page="../common/homepage/breadcrumbs-area.jsp"></jsp:include>
            <!-- breadcrumbs-area-end -->
            <!-- Myaccount start -->
            <div class="my-account-wrapper mb-70">
                <div class="container">
                    <div class="section-bg-color">
                        <div class="row">
                            <div class="col-lg-12">
                                <!-- My Account Page Start -->
                                <div class="myaccount-page-wrapper">
                                    <!-- My Account Tab Menu Start -->
                                    <div class="row">
                                        <div class="col-lg-3 col-md-4">
                                            <div class="myaccount-tab-menu nav" role="tablist">
                                            <c:if test="${account.roleId == 1}">
                                                <a href="#dashboad" id="dashboardTab" class="active" data-bs-toggle="tab"><i class="fa fa-dashboard"></i>
                                                    Control</a>

                                            </c:if>

                                            <a href="#orders" data-bs-toggle="tab"><i class="fa fa-cart-arrow-down"></i>
                                                Orders</a>
                                            <a href="#address-edit" data-bs-toggle="tab"><i class="fa fa-map-marker"></i>
                                                address</a>
                                            <a href="#account-info" data-bs-toggle="tab"><i class="fa fa-user"></i> Account
                                                Details</a>
                                            <a href="login.html"><i class="fa fa-sign-out"></i> Logout</a>
                                        </div>
                                    </div>
                                    <!-- My Account Tab Menu End -->

                                    <!-- My Account Tab Content Start -->
                                    <div class="col-lg-9 col-md-8">
                                        <div class="tab-content" id="myaccountContent">
                                            <!-- Single Tab Content Start -->
                                            <c:if test="${account.roleId == 1}">
                                                <div class="tab-pane fade show active" id="dashboad" role="tabpanel">
                                                    <div class="myaccount-content">
                                                        <button id="dashboardButton" class="btn btn-primary">Dashboard Control</button>
                                                    </div>
                                                    <div class="myaccount-content">
                                                        <button id="accountButton" class="btn btn-primary">Account control</button>
                                                    </div>
                                                </div>
                                            </c:if>


                                            <!-- Single Tab Content End -->

                                            <!-- Single Tab Content Start -->
                                            
                                                <div class="tab-pane fade" id="orders" role="tabpanel">
                                                    <div class="myaccount-content">
                                                        <h5>Orders</h5>
                                                        <!-- Thêm một button để chuyển hướng -->
                                                        <button id="viewOrdersButton" class="btn btn-primary">View Orders</button>
                                                    </div>
                                                </div>
                                            

                                            <!-- Single Tab Content End -->



                                            <!-- Single Tab Content Start -->
                                            <div class="tab-pane fade" id="payment-method" role="tabpanel">
                                                <div class="myaccount-content">
                                                    <h5>Payment Method</h5>
                                                    <p class="saved-message">You Can't Saved Your Payment Method yet.</p>
                                                </div>
                                            </div>
                                            <!-- Single Tab Content End -->

                                            <!-- Single Tab Content Start -->
                                            <div class="tab-pane fade" id="address-edit" role="tabpanel">
                                                <div class="myaccount-content">
                                                    <h5>Honag Store Address</h5>
                                                    <address>
                                                        <p><strong>Tran Huy Hoang</strong></p>
                                                        <p>1234 Giao Thuy - Nam Dinh <br>
                                                            Viet Nam</p>
                                                        <p>Mobile: (+84) 342 885 234</p>
                                                    </address>
                                                    <a href="#" class="btn btn-sqr"><i class="fa fa-edit"></i>
                                                        Edit Address</a>
                                                </div>
                                            </div>
                                            <!-- Single Tab Content End -->

                                            <!-- Single Tab Content Start -->
                                            <form action="change-infomation" method="POST">
                                                <div class="tab-pane fade" id="account-info" role="tabpanel">
                                                    <div class="myaccount-content">
                                                        <h5>Account Details</h5>
                                                        <div class="account-details-form">


                                                            <div class="row">

                                                                <div class="single-input-item">
                                                                    <label for="id" class="required">
                                                                        ID</label>
                                                                    <input type="text" id="id" name="id" placeholder="Id" value="${account.id}" />
                                                                </div>

                                                                <div class="col-lg-6">
                                                                    <div class="single-input-item">
                                                                        <label for="first-name" class="required">
                                                                            Name</label>
                                                                        <input type="text" id="name" name="name" placeholder="Name" value="${account.username}" />
                                                                    </div>
                                                                </div>
                                                                <div class="single-input-item">
                                                                    <label for="email" class="required">Email</label>
                                                                    <input type="email" id="email" name="email" placeholder="Email" value="${account.email}"/>
                                                                </div>
                                                            </div>
                                                            <div class="single-input-item">
                                                                <label for="address" class="required">Address</label>
                                                                <input type="text" id="address" name="address" placeholder="Address" value="${account.address}"/>
                                                            </div>

                                                            <fieldset>
                                                                <legend>Password change</legend>

                                                                <div class="row">
                                                                    <div class="col-lg-6">
                                                                        <div class="single-input-item">
                                                                            <label for="new-pwd" class="required">New
                                                                                Password</label>
                                                                            <input type="password" id="new-pwd" name="newpassword" placeholder="New Password" />
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </fieldset>
                                                            <div class="single-input-item">
                                                                <button class="btn btn-sqr">Save Changes</button>
                                                            </div>
                                                            <span style="color:blue">${successMessage}</span>

                                                        </div>
                                                    </div>
                                                </div> <!-- Single Tab Content End -->
                                            </form>
                                        </div>
                                    </div> <!-- My Account Tab Content End -->
                                </div>
                            </div> <!-- My Account Page End -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--My account end -->

        <!-- footer-area-start -->
        <jsp:include page="../common/homepage/footer.jsp"></jsp:include>
            <!-- footer-area-end -->







            <!-- all js here -->

            <script>
                document.getElementById('viewOrdersButton').addEventListener('click', function () {
                    window.location.href = '${pageContext.request.contextPath}/dashboard'; // Thay đổi URL tới trang order
                });
        </script>





        <script>
            document.getElementById('accountButton').addEventListener('click', function () {
                window.location.href = '${pageContext.request.contextPath}/admin/acc-control'; // Thay đổi URL tới trang dashboard
            });
        </script>

        <script>
            document.getElementById('dashboardButton').addEventListener('click', function () {
                window.location.href = '${pageContext.request.contextPath}/admin/dashboard'; // Thay đổi URL tới trang dashboard
            });
        </script>

        <!-- jquery latest version -->
        <script src="${pageContext.request.contextPath}/js/vendor/jquery-1.12.4.min.js"></script>
        <!-- modernizr css -->
        <script src="${pageContext.request.contextPath}/js/vendor/modernizr-2.8.3.min.js"></script>

        <!-- bootstrap js -->
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <!-- owl.carousel js -->
        <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
        <!-- meanmenu js -->
        <script src="${pageContext.request.contextPath}/js/jquery.meanmenu.js"></script>
        <!-- wow js -->
        <script src="${pageContext.request.contextPath}/js/wow.min.js"></script>
        <!-- jquery.parallax-1.1.3.js -->
        <script src="${pageContext.request.contextPath}/js/jquery.parallax-1.1.3.js"></script>
        <!-- jquery.countdown.min.js -->
        <script src="${pageContext.request.contextPath}/js/jquery.countdown.min.js"></script>
        <!-- jquery.flexslider.js -->
        <script src="${pageContext.request.contextPath}/js/jquery.flexslider.js"></script>
        <!-- chosen.jquery.min.js -->
        <script src="${pageContext.request.contextPath}/js/chosen.jquery.min.js"></script>
        <!-- jquery.counterup.min.js -->
        <script src="${pageContext.request.contextPath}/js/jquery.counterup.min.js"></script>
        <!-- waypoints.min.js -->
        <script src="${pageContext.request.contextPath}/js/waypoints.min.js"></script>
        <!-- plugins js -->
        <script src="${pageContext.request.contextPath}/js/plugins.js"></script>
        <!-- main js -->
        <script src="${pageContext.request.contextPath}/js/main.js"></script>
    </body>
</html>
