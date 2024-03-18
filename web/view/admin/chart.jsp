<%-- 
    Author     : 4USER-FPT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin - Dashboard</title>

        <!-- Custom fonts for this template-->
        <link href="${pageContext.request.contextPath}/vendor-admin/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Page level plugin CSS-->
        <link href="${pageContext.request.contextPath}/vendor-admin/datatables/dataTables.bootstrap4.css" rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="${pageContext.request.contextPath}/css/sb-admin.css" rel="stylesheet">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/colReorder-bootstrap4.css">

        <style>
            .error{
                color:red;
            }
        </style>

    </head>

    <body id="page-top">

        <!--Navbar-->
        <jsp:include page="../common/admin/navbar.jsp"></jsp:include>

            <div id="wrapper">

                <!-- Sidebar -->
            <jsp:include page="../common/admin/sideBar.jsp"></jsp:include>

                <div id="content-wrapper">

                    <div class="container-fluid">

                        <!-- Breadcrumbs-->
                        <!-- Breadcrumbs-->
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item">
                                <a href="#">Dashboard</a>
                            </li>
                            <li class="breadcrumb-item active">Charts</li>
                        </ol>

                        <!-- Icon Cards-->
                        <!-- Icon Cards-->
                        <div class="row">

                            <!-- Icon Cards-->

                            <div class="col-xl-4 col-sm-6 mb-3">
                                <div class="card text-white bg-primary o-hidden h-100">
                                    <div class="card-body">
                                        <div class="card-body-icon">
                                            <i class="fas fa-fw fa-comments"></i>
                                        </div>
                                        <h3 class="mr-5">Thể loại bán chạy</h3>
                                    </div>
                                    <a class="card-footer text-white clearfix small z-1" href="#">
                                    <c:forEach items="${bestSeller}" var="c">
                                        <h5 class="float-left">${c.name} - doanh thu: ${c.getTOTAL_AMOUNT()}$</h5>
                                    </c:forEach>
                                    <span class="float-right">
                                        <i class="fas fa-angle-right"></i>
                                    </span>
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-4 col-sm-6 mb-3">
                            <div class="card text-white bg-danger o-hidden h-100">
                                <div class="card-body">
                                    <div class="card-body-icon">
                                        <i class="fas fa-fw fa-life-ring"></i>
                                    </div>
                                    <h3 class="mr-5">Tổng doanh thu</h3>
                                </div>
                                <a class="card-footer text-white clearfix small z-1" href="#">
                                    <c:forEach items="${total}" var="m">
                                        <h5 class="float-left">Doanh thu: ${m.getTOTAL_REVENUE()}$</h5>
                                    </c:forEach>
                                    <span class="float-right">
                                        <i class="fas fa-angle-right"></i>
                                    </span>
                                </a>
                            </div>
                        </div>











                    </div>


                    <!-- Icon Cards-->





                    <!-- Area Chart Example-->
                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-chart-area"></i>
                            Area Chart Example</div>
                        <div class="card-body">
                            <canvas id="myAreaChart" width="100%" height="30"></canvas>
                        </div>
                        <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
                    </div>

                    <div class="card mb-3">
                        <div class="card-header">
                            <i class="fas fa-table"></i>
                            Product Sold
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Total Sold</th>
                                            <th>Total Amount Sold</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${totalProduct}" var="c">
                                        <tr>
                                            <td>${c.name}</td>
                                            <td>${c.getTOTAL_SOLD()}</td>
                                            <td>${c.getTOTAL_AMOUNT_SOLD()}$</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>


                        <!-- /.container-fluid -->
                    </div>

                </div>
                <!-- /.container-fluid -->

                <!-- Sticky Footer -->
                <jsp:include page="../common/admin/footer.jsp"></jsp:include>

                </div>
                <!-- /.content-wrapper -->

            </div>
            <!-- /#wrapper -->

            <!-- Scroll to Top Button-->
            <a class="scroll-to-top rounded" href="#page-top">
                <i class="fas fa-angle-up"></i>
            </a>

            <!-- Logout Modal-->
        <jsp:include page="../common/admin/logoutModal.jsp"></jsp:include>
        <jsp:include page="addProductModal.jsp"></jsp:include>
        <jsp:include page="deleteProductModal.jsp"></jsp:include>
        <jsp:include page="editProductModal.jsp"></jsp:include>
            <!-- Bootstrap core JavaScript-->
            <script src="${pageContext.request.contextPath}/vendor-admin/jquery/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor-admin/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="${pageContext.request.contextPath}/vendor-admin/jquery-easing/jquery.easing.min.js"></script>

        <!-- Page level plugin JavaScript-->
        <script src="${pageContext.request.contextPath}/vendor-admin/chart.js/Chart.min.js"></script>
        <script src="${pageContext.request.contextPath}/vendor-admin/datatables/jquery.dataTables.js"></script>
        <script src="${pageContext.request.contextPath}/vendor-admin/datatables/dataTables.bootstrap4.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="${pageContext.request.contextPath}/js/admin/sb-admin.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/admin/colReorder-bootstrap4-min.js"></script>
        <script src="${pageContext.request.contextPath}/js/admin/colReorder-dataTables-min.js"></script>

        <!-- Demo scripts for this page-->
        <script src="${pageContext.request.contextPath}/js/admin/demo/datatables-demo.js"></script>
        <script>// Set new default font family and font color to mimic Bootstrap's default styling
                                                                Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
                                                                Chart.defaults.global.defaultFontColor = '#292b2c';
                                                                console.log('${requestScope.model[0].name}')
                                                                const valuesX = [];
                                                                const valuesY = [];
            <c:forEach items="${model}" var="item">
                                                                valuesX.push('${item.name}');
            </c:forEach>
            <c:forEach items="${model}" var="item">
                                                                valuesY.push(${item.TOTAL_AMOUNT});
            </c:forEach>
                                                                // Area Chart Example
                                                                var ctx = document.getElementById("myAreaChart");
                                                                var myLineChart = new Chart(ctx, {
                                                                    type: 'line',
                                                                    data: {
                                                                        labels: valuesX,
                                                                        datasets: [{
                                                                                label: "Amount",
                                                                                lineTension: 0.3,
                                                                                backgroundColor: "rgba(2,117,216,0.2)",
                                                                                borderColor: "rgba(2,117,216,1)",
                                                                                pointRadius: 5,
                                                                                pointBackgroundColor: "rgba(2,117,216,1)",
                                                                                pointBorderColor: "rgba(255,255,255,0.8)",
                                                                                pointHoverRadius: 5,
                                                                                pointHoverBackgroundColor: "rgba(2,117,216,1)",
                                                                                pointHitRadius: 50,
                                                                                pointBorderWidth: 2,
                                                                                data: valuesY,
                                                                            }],
                                                                    },
                                                                    options: {
                                                                        scales: {
                                                                            xAxes: [{
                                                                                    time: {
                                                                                        unit: 'date'
                                                                                    },
                                                                                    gridLines: {
                                                                                        display: false
                                                                                    },
                                                                                    ticks: {
                                                                                        maxTicksLimit: 7
                                                                                    }
                                                                                }],
                                                                            yAxes: [{
                                                                                    ticks: {
                                                                                        min: 0,
                                                                                        max: 1500,
                                                                                        maxTicksLimit: 5
                                                                                    },
                                                                                    gridLines: {
                                                                                        color: "rgba(0, 0, 0, .125)",
                                                                                    }
                                                                                }],
                                                                        },
                                                                        legend: {
                                                                            display: false
                                                                        }
                                                                    }
                                                                });
        </script>
        <script src="${pageContext.request.contextPath}/js/admin/colReorder-dataTables-min.js"></script>
        <script src="${pageContext.request.contextPath}/js/admin/colReorder-bootstrap4-min.js"></script>


    </body>

</html>