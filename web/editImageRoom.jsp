<%-- 
    Document   : Staff
    Created on : May 30, 2022, 10:32:42 PM
    Author     : buikh
--%>

<%@page import="form.UserError"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="form.UserDisplayForm"%>
<!doctype html>
<html lang="en" class="semi-dark">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- loader-->
        <link href="assets/css/pace.min.css" rel="stylesheet" />
        <script src="assets/js/pace.min.js"></script>

        <!--plugins-->
        <link href="assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
        <link href="assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
        <link href="assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet" />

        <!-- CSS Files -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/bootstrap-extended.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/icons.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-Kfk   fwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" /> 


        <!--Theme Styles-->
        <link href="assets/css/dark-theme.css" rel="stylesheet" />
        <link href="assets/css/semi-dark.css" rel="stylesheet" />
        <link href="assets/css/header-colors.css" rel="stylesheet" />

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Courgette&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"/>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>



        <title>Edit Image Room Page</title>
        <style>
            .error{
                color: red;
            }
            .success{
                color: green;
            }
        </style>
    </head>

    <body>
        <!--start wrapper-->
        <div class="wrapper">
            <c:set var="User" value="${sessionScope.USER}"/>
            <!--start sidebar -->
            <aside class="sidebar-wrapper" data-simplebar="true">
                <div class="sidebar-header">
<font color="yellow">
                    <div>
                        <h6 style="font-family: 'Courgette', cursive;">Welcome ${USER.name} (STAFF)</h6>
                    </div></font>
                    <div class="toggle-icon ms-auto">
                        <ion-icon name="menu-sharp"></ion-icon>
                    </div>
                </div>
                <!--navigation-->
                <ul class="metismenu" id="menu">
                    <li>
                        <a href="javascript:;" class="has-arrow">
                            <div class="parent-icon">
                                <ion-icon name="home-sharp"></ion-icon>
                            </div>
                            <div class="menu-title">Management</div>
                        </a>
                        <ul>
                            <li> <a href="staff.jsp">
                                    <ion-icon name="ellipse-outline"></ion-icon>Staff Management
                                </a>
                            </li>
                            <li>
                                <a href="customer.jsp">
                                    <ion-icon name="ellipse-outline"></ion-icon>Customer Management
                                </a>
                            </li>
                            <li>
                                <a href="managementRoom.jsp">
                                    <ion-icon name="ellipse-outline"></ion-icon>Room Management
                                </a>
                            </li>
                            <li>
                                <a href="MainController?btn=ViewBooking">
                                    <ion-icon name="ellipse-outline"></ion-icon>Booking Management
                                </a>
                            </li>
                            <li>
                                <a href="regulationManagement.jsp">
                                    <ion-icon name="ellipse-outline"></ion-icon>Regulation Management
                                </a>
                            </li>
                            <li>
                                <a href="viewfeedback.jsp">
                                    <ion-icon name="ellipse-outline"></ion-icon>Feedback Management
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="pages-staff-profile.jsp">
                            <div class="parent-icon"><ion-icon name="person-circle-sharp"></ion-icon>
                            </div>
                            <div class="menu-title">Staff Profile</div>
                        </a>
                    </li>
                    <li>
                        <a href="pages-edit-staff-profile.jsp">
                            <div class="parent-icon"><ion-icon name="create-sharp"></ion-icon>
                            </div>
<div class="menu-title">Edit Profile</div>
                        </a>
                    </li>

                </ul>
                <!--end navigation-->
            </aside>
            <!--end sidebar -->

            <!--start top header-->
            <header class="top-header">
                <nav class="navbar navbar-expand gap-3">
                    <form action="MainController" method="get">
                        EXTRA IMAGE </br>
                        ROOM   ${param.txtRoomId}
                        <input type="hidden" name="txtRoomId" value="${param.txtRoomId}" />
                        <input type="hidden" name="btn" value="Display Image Room" />
                    </form>

                    <div class="top-navbar-right ms-auto">

                        <ul class="navbar-nav align-items-center">
                            <li class="nav-item mobile-search-button">
                                <a class="nav-link" href="javascript:;">
                                    <div class="">
                                        <ion-icon name="search-sharp"></ion-icon>
                                    </div>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link dark-mode-icon" href="javascript:;">
                                    <div class="mode-icon">
                                        <ion-icon name="moon-sharp"></ion-icon>
                                    </div>
                                </a>
                            </li>
                            <li class="nav-item dropdown dropdown-large">
                                <a class="nav-link dropdown-toggle dropdown-toggle-nocaret" href="javascript:;" data-bs-toggle="dropdown">
                                    <div class="position-relative">
                                        <span class="notify-badge">8</span>
                                        <ion-icon name="notifications-sharp"></ion-icon>
                                    </div>
                                </a>
                                <div class="dropdown-menu dropdown-menu-end">
                                    <a href="javascript:;">
                                        <div class="msg-header">
                                            <p class="msg-header-title">Notifications</p>
                                            <p class="msg-header-clear ms-auto">Marks all as read</p>
                                        </div>
                                    </a>
                                    <div class="header-notifications-list">
                                        <a class="dropdown-item" href="javascript:;">
                                            <div class="d-flex align-items-center">
                                                <div class="notify text-primary">
<ion-icon name="cart-outline"></ion-icon>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <h6 class="msg-name">New Orders <span class="msg-time float-end">2 min
                                                            ago</span></h6>
                                                    <p class="msg-info">You have recived new orders</p>
                                                </div>
                                            </div>
                                        </a>
                                        <a class="dropdown-item" href="javascript:;">
                                            <div class="d-flex align-items-center">
                                                <div class="notify text-danger">
                                                    <ion-icon name="person-outline"></ion-icon>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <h6 class="msg-name">New Staffs<span class="msg-time float-end">14 Sec
                                                            ago</span></h6>
                                                    <p class="msg-info">5 new user registered</p>
                                                </div>
                                            </div>
                                        </a>
                                        <a class="dropdown-item" href="javascript:;">
                                            <div class="d-flex align-items-center">
                                                <div class="notify text-success">
                                                    <ion-icon name="document-outline"></ion-icon>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <h6 class="msg-name">24 PDF File<span class="msg-time float-end">19 min
                                                            ago</span></h6>
                                                    <p class="msg-info">The pdf files generated</p>
                                                </div>
                                            </div>
                                        </a>

                                        <a class="dropdown-item" href="javascript:;">
                                            <div class="d-flex align-items-center">
                                                <div class="notify text-info">
                                                    <ion-icon name="checkmark-done-outline"></ion-icon>
                                                </div>
                                                <div class="flex-grow-1">
<h6 class="msg-name">New Product Approved <span class="msg-time float-end">2 hrs ago</span></h6>
                                                    <p class="msg-info">Your new product has approved</p>
                                                </div>
                                            </div>
                                        </a>
                                        <a class="dropdown-item" href="javascript:;">
                                            <div class="d-flex align-items-center">
                                                <div class="notify text-warning">
                                                    <ion-icon name="send-outline"></ion-icon>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <h6 class="msg-name">Time Response <span class="msg-time float-end">28 min
                                                            ago</span></h6>
                                                    <p class="msg-info">5.1 min avarage time response</p>
                                                </div>
                                            </div>
                                        </a>
                                        <a class="dropdown-item" href="javascript:;">
                                            <div class="d-flex align-items-center">
                                                <div class="notify text-danger">
                                                    <ion-icon name="chatbox-ellipses-outline"></ion-icon>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <h6 class="msg-name">New Comments <span class="msg-time float-end">4 hrs
                                                            ago</span></h6>
                                                    <p class="msg-info">New Staff comments recived</p>
                                                </div>
                                            </div>
                                        </a>
                                        <a class="dropdown-item" href="javascript:;">
                                            <div class="d-flex align-items-center">
                                                <div class="notify text-primary">
                                                    <ion-icon name="albums-outline"></ion-icon>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <h6 class="msg-name">New 24 authors<span class="msg-time float-end">1 day
                                                            ago</span></h6>
<p class="msg-info">24 new authors joined last week</p>
                                                </div>
                                            </div>
                                        </a>
                                        <a class="dropdown-item" href="javascript:;">
                                            <div class="d-flex align-items-center">
                                                <div class="notify text-success">
                                                    <ion-icon name="shield-outline"></ion-icon>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <h6 class="msg-name">Your item is shipped <span class="msg-time float-end">5 hrs
                                                            ago</span></h6>
                                                    <p class="msg-info">Successfully shipped your item</p>
                                                </div>
                                            </div>
                                        </a>
                                        <a class="dropdown-item" href="javascript:;">
                                            <div class="d-flex align-items-center">
                                                <div class="notify text-warning">
                                                    <ion-icon name="cafe-outline"></ion-icon>
                                                </div>
                                                <div class="flex-grow-1">
                                                    <h6 class="msg-name">Defense Alerts <span class="msg-time float-end">2 weeks
                                                            ago</span></h6>
                                                    <p class="msg-info">45% less alerts last 4 weeks</p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <a href="javascript:;">
                                        <div class="text-center msg-footer">View All Notifications</div>
                                    </a>
                                </div>
                            </li>
                            <li class="nav-item dropdown dropdown-user-setting">
                                <a class="nav-link dropdown-toggle dropdown-toggle-nocaret" href="javascript:;" data-bs-toggle="dropdown">
                                    <div class="user-setting">
                                        <img src="${User.img}" class="user-img" alt="">
                                    </div>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end">
                                    <li>
<a class="dropdown-item" href="javascript:;">
                                            <div class="d-flex flex-row align-items-center gap-2">
                                                <img src="${User.img}" alt="" class="rounded-circle" width="54" height="54">
                                                <div class="">
                                                    <h6 class="mb-0 dropdown-user-name">${User.name}</h6>
                                                    <small class="mb-0 dropdown-user-designation text-secondary">${User.address}</small>
                                                </div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="pages-user1-profile.jsp">
                                            <div class="d-flex align-items-center">
                                                <div class="">
                                                    <ion-icon name="person-outline"></ion-icon>
                                                </div>
                                                <div class="ms-3"><span>Profile</span></div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="javascript:;">
                                            <div class="d-flex align-items-center">
                                                <div class="">
                                                    <ion-icon name="settings-outline"></ion-icon>
                                                </div>
                                                <div class="ms-3"><span>Setting</span></div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="javascript:;">
                                            <div class="d-flex align-items-center">
                                                <div class="">
                                                    <ion-icon name="speedometer-outline"></ion-icon>
                                                </div>
                                                <div class="ms-3"><span>Room Management</span></div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
<a class="dropdown-item" href="javascript:;">
                                            <div class="d-flex align-items-center">
                                                <div class="">
                                                    <ion-icon name="wallet-outline"></ion-icon>
                                                </div>
                                                <div class="ms-3"><span>Earnings</span></div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="javascript:;">
                                            <div class="d-flex align-items-center">
                                                <div class="">
                                                    <ion-icon name="cloud-download-outline"></ion-icon>
                                                </div>
                                                <div class="ms-3"><span>Downloads</span></div>
                                            </div>
                                        </a>
                                    </li>
                                    <li>
                                        <hr class="dropdown-divider">
                                    </li>
                                    <li>
                                        <a class="dropdown-item" href="MainController?btn=Logout">
                                            <div class="d-flex align-items-center">
                                                <div class="">
                                                    <ion-icon name="log-out-outline"></ion-icon>
                                                </div>
                                                <div class="ms-3"><span name="btn">Logout</span></div>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </li>

                        </ul>

                    </div>
                </nav>
            </header>
            <!--end top header-->


            <!-- start page content wrapper-->
            <div class="page-content-wrapper">
                <!-- start page content-->
                <div class="page-content">

                    <!--start breadcrumb-->
                    <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
                        <h6 class="mb-0 text-uppercase">Management</h6>
                        <div class="ps-3">
                            <nav aria-label="breadcrumb">
                                <ol class="breadcrumb mb-0 p-0 align-items-center">
                                    <li class="breadcrumb-item"><a href="javascript:;">
<ion-icon name="home-outline"></ion-icon>
                                        </a>
                                    </li>
                                    <li class="breadcrumb-item active" aria-current="page">Room Management</li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                    <!--end breadcrumb-->
                    <div class="card radius-10 w-100">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <h6 class="mb-0">View Room</h6>
                            </div>
                            <div class="table-responsive mt-2">
                                <c:if test = "${not empty requestScope.GET_IMAGE_ROOM}">
                                    <table id="example" class="table align-middle" style="width:100%">
                                        <thead class="table-secondary">
                                            <tr>
                                                <th>Extra Image</th>
                                                <th>Save</th>
                                                <th>&nbsp;</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="dto" items="${requestScope.GET_IMAGE_ROOM}" >
                                                <tr>
                                            <form action="MainController" method="get">
                                                <td>
                                                    <img style="width: 370.75px; height: 247.36px;" src="images/${dto.imageTmp}" class="card-img-top" alt="...">
                                                    <input type="hidden" name="txtImageOld" value="${dto.imageTmp}" />
                                                    <input type="file" name="txtImage" value="${dto.imageTmp}" />
                                                </td>
                                                <td>
                                                    <input type="hidden" name="txtRoomId1" value="${param.txtRoomId}" />
                                                    <input type="hidden" name="txtId" value="${dto.id}" />
                                                    <input type="submit" class="btn btn-dark px-5" value="Save Image" name="btn" />
                                                </td>
                                                <td>
                                                    <input type="hidden" name="txtRoomIdTmp" value="${param.txtRoomId}" />
                                                    <input type="hidden" name="txtIdTmp" value="${dto.id}" />
<input type="submit" class="btn btn-dark px-5" value="Delete Image" name="btn" />
                                                </td>
                                            </form>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </c:if>
                                <c:if test = "${ empty requestScope.GET_IMAGE_ROOM}">Dont have extra photo , please add new photo</c:if>  </br>
                                    <form action="MainController" method="get">
                                        <input type="hidden" name="txtRoomId2" value="${param.txtRoomId}" />
                                    <input type="file" style="padding-left: 6px;"class="btn btn-dark px-5" name="txtImageExtra" value="">
                                    <input type="submit" class="btn btn-dark px-5" name="btn" value="Add New Image" />
                                </form>
                                    </br>
                                <a href="MainController?txtSearchValue=&btn=SEARCH+ROOM" data-bs-toggle="tooltip" data-bs-placement="bottom" title="" data-bs-original-title="Return"  class="btn btn-primary"><i class="fa fa-arrow-circle-left" style="font-size:36px"></i></a>

                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <!--end page content wrapper-->
            <!--start footer-->
            <footer class="footer">
                <div class="footer-text">
                    Copyright ?? 2021. All right reserved.
                </div>
            </footer>
            <!--end footer-->


            <!--Start Back To Top Button-->
            <a href="javaScript:;" class="back-to-top">
                <ion-icon name="arrow-up-outline"></ion-icon>
            </a>
            <!--End Back To Top Button-->

            <!--start switcher-->
            <div class="switcher-body">
                <button class="btn btn-primary btn-switcher shadow-sm" type="button" data-bs-toggle="offcanvas"
                        data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling">
                    <ion-icon name="color-palette-sharp" class="me-0"></ion-icon>
                </button>
                <div class="offcanvas offcanvas-end shadow border-start-0 p-2" data-bs-scroll="true" data-bs-backdrop="false"
                     tabindex="-1" id="offcanvasScrolling">
                    <div class="offcanvas-header border-bottom">
                        <h5 class="offcanvas-title" id="offcanvasScrollingLabel">Theme Customizer</h5>
                        <button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"></button>
                    </div>
                    <div class="offcanvas-body">
<h6 class="mb-0">Theme Variation</h6>
                        <hr>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="LightTheme" value="option1">
                            <label class="form-check-label" for="LightTheme">Light</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="DarkTheme" value="option2">
                            <label class="form-check-label" for="DarkTheme">Dark</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="SemiDark" value="option3"
                                   checked>
                            <label class="form-check-label" for="SemiDark">Semi Dark</label>
                        </div>
                        <hr />
                        <h6 class="mb-0">Header Colors</h6>
                        <hr />
                        <div class="header-colors-indigators">
                            <div class="row row-cols-auto g-3">
                                <div class="col">
                                    <div class="indigator headercolor1" id="headercolor1"></div>
                                </div>
                                <div class="col">
                                    <div class="indigator headercolor2" id="headercolor2"></div>
                                </div>
                                <div class="col">
                                    <div class="indigator headercolor3" id="headercolor3"></div>
                                </div>
                                <div class="col">
                                    <div class="indigator headercolor4" id="headercolor4"></div>
                                </div>
                                <div class="col">
                                    <div class="indigator headercolor5" id="headercolor5"></div>
                                </div>
                                <div class="col">
                                    <div class="indigator headercolor6" id="headercolor6"></div>
                                </div>
                                <div class="col">
                                    <div class="indigator headercolor7" id="headercolor7"></div>
                                </div>
                                <div class="col">
                                    <div class="indigator headercolor8" id="headercolor8"></div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <!--end switcher-->
<!--start overlay-->
            <div class="overlay nav-toggle-icon"></div>
            <!--end overlay-->

        </div>
        <!--end wrapper-->



        <!-- JS Files-->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/plugins/simplebar/js/simplebar.min.js"></script>
        <script src="assets/plugins/metismenu/js/metisMenu.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
        <!--plugins-->
        <script src="assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
        <script src="assets/plugins/apexcharts-bundle/js/apexcharts.min.js"></script>
        <script src="assets/plugins/chartjs/chart.min.js"></script>
        <script src="assets/js/index.js"></script>
        <!-- Main JS-->
        <script src="assets/js/main.js"></script>
        <script src="assets/plugins/datatable/js/jquery.dataTables.min.js"></script>
        <script src="assets/plugins/datatable/js/dataTables.bootstrap5.min.js"></script>
        <script src="assets/js/table-datatable.js"></script>

        <!--        <script>
                    function ConfirmDelete(){
                        return confirm("Are you sure you want to delete?");
                    }
                </script>-->

        <script>
            function showOrHideDiv() {
                var show = document.getElementById("showOrHide");
                if (show.style.display === "block") {
                    show.style.display = "none";
                } else {
                    show.style.display = "block";
                }
            }
            function ConfirmDelete() {
                return confirm("Are you sure you want to delete?");
            }
        </script>
    </body>

</html>