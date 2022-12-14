<%-- 
    Document   : authentication-sign-up-simple
    Created on : Jun 4, 2022, 3:20:31 PM
    Author     : buikh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en" class="light-theme">

    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- loader-->
        <link href="assets/css/pace.min.css" rel="stylesheet" />
        <script src="assets/js/pace.min.js"></script>

        <!--plugins-->
        <link href="assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />

        <!-- CSS Files -->
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/bootstrap-extended.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="assets/css/icons.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">



        <title>Dashkotejsp</title>
    </head>

    <body>

        <!--start wrapper-->
        <div class="wrapper">
            <header>
                <nav class="navbar navbar-expand-lg navbar-light bg-transparent p-3">
                    <div class="container-fluid">
                        <a href="javascript:;"><img src="assets/images/logo-icon-3.png" width="140" alt="" /></a>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
                                aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mx-auto mb-2 mb-lg-0 gap-3">
                                <li class="nav-item">
                                    <a class="nav-link" href="javascript:;">Home</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="javascript:;">About Us</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="javascript:;">Team</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="javascript:;">Products</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="javascript:;">Blog</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="javascript:;">Contact</a>
                                </li>
                            </ul>
                            <form class="d-flex">
                                <a href="javascript:;" class="btn btn-sm btn-primary px-4 radius-30">Buy Now</a>
                            </form>
                        </div>
                    </div>
                </nav>
            </header>
            <div class="container">
                <div class="row">
                    <div class="col-xl-5 col-lg-6 col-md-7 mx-auto mt-5">
                        <div class="card radius-10">
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <h4>Sign Up</h4>
                                    <p>Creat New account</p>
                                </div>
                                <form action="MainController" method="post" class="form-body row g-3">
                                    <c:set var="errors" value="${requestScope.CREATEERRORS}"/>
                                    <div class="col-12">
                                        <label for="inputName" class="form-label">UserName</label>
                                        <input type="text" name="txtUsername" value="${param.txtUsername}" class="form-control" id="inputName" placeholder="(e.g. 6 - 20 chars)">
                                        <c:if test="${not empty errors.usernameLengthError}">
                                            <font color="red">
                                            ${errors.usernameLengthError}
                                            </font>
                                        </c:if>
                                        <c:if test="${not empty errors.usernameIsExisted}">
                                            <font color="red">
                                            ${errors.usernameIsExisted}
                                            </font>
                                        </c:if>
                                    </div>
                                    <div class="col-12">
                                        <label for="inputPassword" class="form-label">Password</label>
                                        <input type="password" name="txtPassword" value="" class="form-control" id="inputPassword" placeholder="(e.g. 3 - 20 chars)">
                                        <c:if test="${not empty errors.passwordLengthError}">
                                            <font color="red">
                                            ${errors.passwordLengthError}
                                            </font>
                                        </c:if>
                                    </div>
                                    <div class="col-12">
                                        <label for="inputPassword" class="form-label">Confirm Password</label>
                                        <input type="password" name="txtConfirm" value="" class="form-control" id="inputConfirm">
                                        <c:if test="${not empty errors.confirmNotMatched}">
                                            <font color="red">
                                            ${errors.confirmNotMatched}
                                            </font>
                                        </c:if>
                                    </div>
                                    <div class="col-12">
                                        <label for="inputEmail" class="form-label">FullName</label>
                                        <input type="text" name="txtFullname" value="${param.txtFullname}" class="form-control" id="inputFullName" placeholder="(e.g. 2 - 50 chars)">
                                        <c:if test="${not empty errors.fullnameLengthError}">
                                            <font color="red">
                                            ${errors.fullnameLengthError}
                                            </font>
                                        </c:if>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label">Email</label>
                                        <input type="email" name="txtEmail" value="${param.txtEmail}" class="form-control" id="inputEmail" placeholder="(e.g. 6 - 400 chars)">
                                        <c:if test="${not empty errors.emailLengthError}">
                                            <font color="red">
                                            ${errors.emailLengthError}
                                            </font>
                                        </c:if>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label">Address</label>
                                        <input type="text" name="txtAddress" value="${param.txtAddress}" class="form-control" id="inputAddress" placeholder="(e.g. 3 - 50 chars)">
                                        <c:if test="${not empty errors.addressLengthError}">
                                            <font color="red">
                                            ${errors.addressLengthError}
                                            </font>
                                        </c:if>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label">Phone</label>
                                        <input type="text" name="txtPhone" value="${param.txtPhone}" class="form-control" id="inputPhone" placeholder="(e.g. 10 chars)">
                                        <c:if test="${not empty errors.phoneLengthError}">
                                            <font color="red">
                                            ${errors.phoneLengthError}
                                            </font>
                                        </c:if>
                                    </div>
                                    <div class="col-12">
                                        <label class="form-label">Citizen Identification Number</label>
                                        <input type="text" name="txtCitizenIdetification" value="${param.txtCitizenIdetification}" class="form-control" id="inputPhone" placeholder="(e.g. 10 chars)">
                                        <c:if test="${not empty errors.citizenIdentificationLengthError}">
                                            <font color="red">
                                            ${errors.citizenIdentificationLengthError}
                                            </font>
                                        </c:if>
                                    </div>
                                    <div class="col-12 col-lg-12">
                                        <div class="d-grid">
                                            <input type="submit" value="Sign Up" name="btn" class="btn btn-primary"/>
                                        </div>
                                    </div>
                                    <div class="col-12 col-lg-12">
                                        <div class="position-relative border-bottom my-3">
                                            <div class="position-absolute seperator translate-middle-y">or continue with</div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-lg-12">
                                        <div class="social-login d-flex flex-row align-items-center justify-content-center gap-2 my-2">
                                            <a href="javascript:;" class=""><img src="assets/images/icons/facebook.png" alt=""></a>
                                            <a href="javascript:;" class=""><img src="assets/images/icons/apple-black-logo.png" alt=""></a>
                                            <a href="https://accounts.google.com/o/oauth2/auth?scope=%20profile%20email&redirect_uri=http://localhost:8080/HostelManagementSystem/LoginGoogleController&response_type=code&client_id=439305708712-m7f3ru5gmloasv1n079kjgh83run99mi.apps.googleusercontent.com&approval_prompt=force" class=""><img src="assets/images/icons/google.png" alt=""></a>
                                        </div>
                                    </div>
                                    <div class="col-12 col-lg-12 text-center">
                                        <p class="mb-0">Already have an account? <a href="index.jsp">Sign in</a></p>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <footer class="my-5">
                <div class="container">
                    <div class="d-flex align-items-center gap-4 fs-5 justify-content-center social-login-footer">
                        <a href="javascript:;">
                            <ion-icon name="logo-twitter"></ion-icon>
                        </a>
                        <a href="javascript:;">
                            <ion-icon name="logo-linkedin"></ion-icon>
                        </a>
                        <a href="javascript:;">
                            <ion-icon name="logo-github"></ion-icon>
                        </a>
                        <a href="javascript:;">
                            <ion-icon name="logo-facebook"></ion-icon>
                        </a>
                        <a href="javascript:;">
                            <ion-icon name="logo-pinterest"></ion-icon>
                        </a>
                    </div>
                    <div class="text-center">
                        <p class="my-4">Copyright ?? 2021 UI Admin by Codervent.</p>
                    </div>
                </div>
            </footer>
        </div>
        <!--end wrapper-->


    </body>

</html>
