<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <meta name="theme-color" content="#06aa5e">
                <meta name="msapplication-navbutton-color" content="#06aa5e">
                <meta name="apple-mobile-web-app-capable" content="yes">
                <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
                <title>Sign up | Basket ™</title>
                <link rel="shortcut icon" href="/signup/images/favicon.png" type="image/x-icon">
                <link rel="stylesheet" href="/signup/css/styles.css">
                <script src="/signup/js/script.js" defer></script>
            </head>

            <body>
                <main class="card-container slideUp-animation">
                    <div class="image-container">
                        <h1 class="company">KAISHOP <sup>&trade;</sup></h1>
                        <img src="/signup/images/signUp.svg" class="illustration" alt="">
                        <a href="#btm" class="mobile-btm-nav">
                            <img src="/signup/images/dbl-arrow.png" alt="">
                        </a>
                    </div>
                    <div class="form-container slideRight-animation">
                        <h1 class="form-header">
                            Login
                        </h1>
                        <form method="post" action="/login">
                            <c:if test="${param.error != null}">
                                <div class="my-2" style="color: red;">Invalid email or password.
                                </div>
                            </c:if>
                            <div class="input-container">
                                <label>Email adress</label>
                                <input class="form-control" type="email" placeholder="name@example.com"
                                    name="username" />

                            </div>
                            <div class="input-container">
                                <label class="form-label">Password:</label>
                                <input type="password" class="form-control" name="password" />
                            </div>
                            <div>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                            </div>
                            <div class="col-12 mb-5">
                                <button type="submit" class="btn btn-success">Login</button>
                            </div>
                        </form>
                    </div>
                </main>
            </body>

            </html>