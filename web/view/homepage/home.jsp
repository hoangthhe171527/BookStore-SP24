<%-- 
    Author     : 4USER-FPT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html>


    <!-- Mirrored from htmldemo.net/koparion/koparion/shop.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 23 Feb 2024 17:30:51 GMT -->
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

    <body class="shop">
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
            <!-- shop-main-area-start -->
            <div class="shop-main-area mb-70">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-3 col-md-12 col-12 order-lg-1 order-2 mt-sm-50 mt-xs-40">
                            <div class="shop-left">
                                <div class="section-title-5 mb-30">
                                    <h2>Shopping Options</h2>
                                </div>
                                <div class="left-title mb-20">
                                    <h4>Category</h4>
                                </div>
                                <div class="left-menu mb-30">
                                    <ul>
                                    <c:forEach items="${listCategory}" var="cate">
                                        <li><a href="home?search=category&categoryId=${cate.id}">${cate.name}</a></li>
                                        </c:forEach>
                                </ul>
                            </div>

                            <div class="left-title mb-20">
                                <h4>Price</h4>
                            </div>
                            <div class="left-menu mb-30">
                                <ul>
                                    <li><a href="home?search=price&minPrice=0&maxPrice=9.99">$0.00-$9.99<span></span></a></li>
                                    <li><a href="home?search=price&minPrice=30.00&maxPrice=39.99">$30.00-$39.99<span></span></a></li>
                                    <li><a href="home?search=price&minPrice=40.00&maxPrice=49.99">$40.00-$49.99<span></span></a></li>
                                    <li><a href="home?search=price&minPrice=50.00&maxPrice=59.99">$50.00-$59.99<span></span></a></li>
                                    <li><a href="home?search=price&minPrice=70.00&maxPrice=1000.00">$70.00-and above<span></span></a></li>
                                </ul>
                            </div>

                            <div class="left-title mb-20">
                                <h4>Random</h4>
                            </div>
                            <div class="random-area mb-30">
                                <div class="product-active-2 owl-carousel">
                                    <div class="product-total-2">
                                        <div class="single-most-product bd mb-18">
                                            <div class="most-product-img">
                                                <a href="#"><img src="${pageContext.request.contextPath}/img/product/1.jpg" alt="book" /></a>
                                            </div>
                                            <div class="most-product-content">
                                                <div class="product-rating">
                                                    <ul>
                                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                        <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                    </ul>
                                                </div>
                                                <h4><a href="#">Endeavor Daytrip</a></h4>
                                                <div class="product-price">
                                                    <ul>
                                                        <li>$30.00</li>
                                                        <li class="old-price">$33.00</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="single-most-product bd mb-18">
                                        <div class="most-product-img">
                                            <a href="#"><img src="${pageContext.request.contextPath}/img/product/1.jpg" alt="book" /></a>
                                        </div>
                                        <div class="most-product-content">
                                            <div class="product-rating">
                                                <ul>
                                                    <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                    <li><a href="#"><i class="fa fa-star"></i></a></li>
                                                </ul>
                                            </div>
                                            <h4><a href="#">Endeavor Daytrip</a></h4>
                                            <div class="product-price">
                                                <ul>
                                                    <li>$30.00</li>
                                                    <li class="old-price">$33.00</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="banner-area mb-30">
                                <div class="banner-img-2">
                                    <a href="#"><img src="${pageContext.request.contextPath}/img/banner/31.jpg" alt="banner" /></a>
                                </div>
                            </div>
                            <div class="left-title-2 mb-30">
                                <h2>Compare Products</h2>
                                <p>You have no items to compare.</p>
                            </div>
                            <div class="left-title-2">
                                <h2>My Wish List</h2>
                                <p>You have no items in your wish list.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-12 col-12 order-lg-2 order-1">
                        <!-- banner -->
                        <div class="category-image mb-30">
                            <a href="#"><img src="${pageContext.request.contextPath}/img/banner/banner-2.png" alt="banner" /></a>
                        </div>
                        <div class="section-title-5 mb-30">
                            <h2>Book</h2>
                        </div>
                        <div class="toolbar mb-30">
                            <div class="shop-tab">
                                <div class="tab-3">
                                    <ul class="nav">
                                        <li><a class="active" href="#th" data-bs-toggle="tab"><i class="fa fa-th-large"></i>Grid</a></li>
                                    </ul>
                                </div>
                            </div>
                            
                            <div class="toolbar-sorter">
                                <span>Sort By</span>
                                <select id="sorter" class="sorter-options" data-role="sorter">
                                    <option selected="selected" value="name"> Product Name </option>
                                    <option value="price"> Price </option>
                                </select>
                                <a href="#"><i class="fa fa-arrow-up"></i></a>
                            </div>
                        </div>
                        <!-- tab-area-start -->
                        <div class="tab-content">
                            <div class="tab-pane fade show active" id="th">
                                <div class="row">
                                    <c:forEach items="${listProduct}" var="p">
                                        <div class="col-xl-3 col-lg-4 col-md-6 col-sm-6">
                                            <!-- single-product-start -->
                                            <div class="product-wrapper mb-40">
                                                <div class="product-img" >
                                                    <a href="product-details?id=${p.id}" >
                                                        <img src="${p.image}" style="display: inline-block; width: 192px; height: 192px;" alt="book" class="primary" />
                                                    </a>

                                                    <div class="quick-view">
                                                        <a class="action-view" href="#" data-bs-target="#productModal" data-bs-toggle="modal" title="Quick View">
                                                            <i class="fa fa-search-plus"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                                <div class="product-details text-center">
                                                    <h4><a href="#">${p.name}</a></h4>
                                                    <div class="product-price">
                                                        <ul>
                                                            <li>${p.price}$</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="product-link">
                                                    <div class="product-button">
                                                        <a href="#" title="Add to cart"><i class="fa fa-shopping-cart"></i>Add to cart</a>
                                                    </div>
                                                    <div class="add-to-link">
                                                        <ul>
                                                            <li><a href="product-details.html" title="Details"><i class="fa fa-external-link"></i></a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- single-product-end -->
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <!-- tab-area-end -->
                        <!-- pagination-area-start -->
                        <div class="pagination-area mt-50">
                            <div class="page-number">
                                <ul>
                                    <c:forEach begin="1" end="${pageControl.totalPage}" var="pageNumber">
                                        <!--<li><a href="#" class="active">1</a></li>-->
                                        <li><a href="${pageControl.urlPattern}page=${pageNumber}">${pageNumber}</a></li>
                                        </c:forEach>
                                    <li><a href="#" class="angle"><i class="fa fa-angle-right"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- pagination-area-end -->
                    </div>
                </div>
            </div>
        </div>
        <!-- shop-main-area-end -->
        <!-- footer-area-start -->
        <jsp:include page="../common/homepage/footer.jsp"></jsp:include>
            <!-- footer-area-end -->
            <!-- Modal -->
            <div class="modal fade" id="productModal" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">x</span></button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-5 col-sm-5 col-xs-12">
                                    <div class="modal-tab">
                                        <div class="product-details-large tab-content">
                                            <div class="tab-pane active" id="image-1">
                                                <img src="${pageContext.request.contextPath}/img/product/quickview-l4.jpg" alt="" />
                                        </div>
                                        <div class="tab-pane" id="image-2">
                                            <img src="${pageContext.request.contextPath}/img/product/quickview-l2.jpg" alt="" />
                                        </div>
                                        <div class="tab-pane" id="image-3">
                                            <img src="${pageContext.request.contextPath}/img/product/quickview-l3.jpg" alt="" />
                                        </div>
                                        <div class="tab-pane" id="image-4">
                                            <img src="${pageContext.request.contextPath}/img/product/quickview-l5.jpg" alt="" />
                                        </div>
                                    </div>
                                    <div class="product-details-small quickview-active owl-carousel">
                                        <a class="active" href="#image-1"><img src="${pageContext.request.contextPath}/img/product/quickview-s4.jpg" alt="" /></a>
                                        <a href="#image-2"><img src="${pageContext.request.contextPath}/img/product/quickview-s2.jpg" alt="" /></a>
                                        <a href="#image-3"><img src="${pageContext.request.contextPath}/img/product/quickview-s3.jpg" alt="" /></a>
                                        <a href="#image-4"><img src="${pageContext.request.contextPath}/img/product/quickview-s5.jpg" alt="" /></a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-7 col-sm-7 col-xs-12">
                                <div class="modal-pro-content">
                                    <h3>Chaz Kangeroo Hoodie3</h3>
                                    <div class="price">
                                        <span>$70.00</span>
                                    </div>
                                    <p>Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet.</p>
                                    <div class="quick-view-select">
                                        <div class="select-option-part">
                                            <label>Size*</label>
                                            <select class="select">
                                                <option value="">S</option>
                                                <option value="">M</option>
                                                <option value="">L</option>
                                            </select>
                                        </div>
                                        <div class="quickview-color-wrap">
                                            <label>Color*</label>
                                            <div class="quickview-color">
                                                <ul>
                                                    <li class="blue">b</li>
                                                    <li class="red">r</li>
                                                    <li class="pink">p</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <form action="#">
                                        <input type="number" value="1" />
                                        <button>Add to cart</button>
                                    </form>
                                    <span><i class="fa fa-check"></i> In stock</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal end -->






        <!-- all js here -->
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


    <!-- Mirrored from htmldemo.net/koparion/koparion/shop.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 23 Feb 2024 17:30:52 GMT -->
</html>