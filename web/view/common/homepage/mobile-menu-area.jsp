<%-- 
    Document   : mobile-menu-area
    Created on : Feb 25, 2024, 3:01:24 PM
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="mobile-menu-area d-lg-none d-block fix">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="mobile-menu">
                    <nav id="mobile-menu-active">
                        <ul id="nav">
                            <li class="active"><a href="${pageContext.request.contextPath}/home">Home<i class="fa fa-angle-down"></i></a>

                            </li>
                            <li><a href="product-details.html">Book<i class="fa fa-angle-down"></i></a>

                                <div class="mega-menu">
                                    <c:forEach items="${listCategory}" var="cate">
                                        <span>
                                            <a href="home?search=category&categoryId=${cate.id}" class="title">${cate.name}</a>
                                            <c:forEach items="${listCateDetail}" var="d">
                                                <c:if test="${cate.id == d.categoryId}">
                                                    <a href="home?search=categoryDetails&categoryDetailsId=${d.id}">${d.name}</a>
                                                </c:if>
                                            </c:forEach>
                                        </span>
                                    </c:forEach>

                                </div>

                            </li>
                            <li><a href="product-details.html">Audio books</a>
                                <ul>
                                    <li><a href="shop.html">Tops & Tees</a></li>
                                    <li><a href="shop.html">Sweaters</a></li>
                                    <li><a href="shop.html">Hoodies</a></li>
                                    <li><a href="shop.html">Jackets & Coats</a></li>
                                    <li><a href="shop.html">Long Sleeve</a></li>
                                    <li><a href="shop.html">Short Sleeve</a></li>
                                    <li><a href="shop.html">Polo Short Sleeve</a></li>
                                    <li><a href="shop.html">Sleeveless</a></li>
                                    <li><a href="shop.html">Sweaters</a></li>
                                    <li><a href="shop.html">Hoodies</a></li>
                                    <li><a href="shop.html">Wedges</a></li>
                                    <li><a href="shop.html">Vests</a></li>
                                    <li><a href="shop.html">Polo Short Sleeve</a></li>
                                    <li><a href="shop.html">Sleeveless</a></li>
                                    <li><a href="shop.html">Graphic T-Shirts</a></li>
                                    <li><a href="shop.html">Hoodies</a></li>
                                </ul>
                            </li>
                            <li><a href="product-details.html">children’s books</a>
                                <ul>
                                    <li><a href="shop.html">Shirts</a></li>
                                    <li><a href="shop.html">Florals</a></li>
                                    <li><a href="shop.html">Crochet</a></li>
                                    <li><a href="shop.html">Stripes</a></li>
                                    <li><a href="shop.html">Shorts</a></li>
                                    <li><a href="shop.html">Dresses</a></li>
                                    <li><a href="shop.html">Trousers</a></li>
                                    <li><a href="shop.html">Jeans</a></li>
                                    <li><a href="shop.html">Heeled sandals</a></li>
                                    <li><a href="shop.html">Flat sandals</a></li>
                                    <li><a href="shop.html">Wedges</a></li>
                                    <li><a href="shop.html">Ankle boots</a></li>
                                </ul>
                            </li>
                            <li><a href="#">blog</a>
                                <ul>
                                    <li><a href="blog.html">Blog</a></li>
                                    <li><a href="blog-details.html">blog-details</a></li>
                                </ul>
                            </li>
                            <li><a href="product-details.html">Page</a>
                                <ul>
                                    <li><a href="shop.html">shop</a></li>
                                    <li><a href="shop-list.html">shop list view</a></li>
                                    <li><a href="product-details.html">product-details</a></li>
                                    <li><a href="product-details-affiliate.html">product-affiliate</a></li>
                                    <li><a href="blog.html">blog</a></li>
                                    <li><a href="blog-details.html">blog-details</a></li>
                                    <li><a href="contact.html">contact</a></li>
                                    <li><a href="about.html">about</a></li>
                                    <li><a href="login.html">login</a></li>
                                    <li><a href="register.html">register</a></li>
                                    <li><a href="my-account.html">my-account</a></li>
                                    <li><a href="cart.html">cart</a></li>
                                    <li><a href="compare.html">compare</a></li>
                                    <li><a href="checkout.html">checkout</a></li>
                                    <li><a href="wishlist.html">wishlist</a></li>
                                    <li><a href="404.html">404 Page</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
