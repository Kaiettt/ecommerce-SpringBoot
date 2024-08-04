<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
                    <link rel="shortcut icon" href="/assets/images/favicon.png" type="image/x-icon">
                    <link rel="stylesheet" href="/assets/css/styles_main.css">
                    <style>
                        #message-password {
                            font-size: 5px;
                            margin-top: 5px;
                            font-weight: 600;
                        }

                        .password-weak {
                            color: crimson;
                            font-size: 12px;
                            font-weight: 600;

                        }

                        .password-medium {
                            color: orange;
                            font-size: 12px;
                            font-weight: 600;

                        }

                        .password-strong {
                            color: green;
                            font-size: 12px;
                            font-weight: 600;

                        }
                    </style>
                </head>

                <body>
                    <main class="card-container slideUp-animation">
                        <div class="image-container">
                            <h1 class="company">KAISHOP <sup>&trade;</sup></h1>
                            <img src="/assets/images/signUp.svg" class="illustration" alt="">
                            <p class="quote">Sign up today to get exciting offers..!</p>
                            <a href="#btm" class="mobile-btm-nav">
                                <img src="/assets/images/dbl-arrow.png" alt="">
                            </a>
                        </div>
                        <form:form method="post" enctype="multipart/form-data" action="/register"
                            modelAttribute="registerUser" class="row">

                            <div class="form-container slideRight-animation">
                                <h1 class="form-header">Get started</h1>
                                <c:set var="errorconfirmPassword">
                                    <form:errors path="confirmPassword" cssClass="invalid-feedback" />
                                </c:set>
                                <c:set var="errorPassword">
                                    <form:errors path="password" cssClass="invalid-feedback" />
                                </c:set>

                                <div class="input-container">
                                    <c:set var="errorFirstName">
                                        <form:errors path="firstName" cssClass="invalid-feedback" />
                                    </c:set>
                                    <label class="form-label" for="firstName">First Name:</label>
                                    <form:input id="firstName" placeholder="FirstName" type="text"
                                        class="form-control ${not empty errorFirstName   ?'is-invalid':''}  "
                                        path="firstName" name="firstName" />
                                    ${errorFirstName}
                                </div>

                                <div class="input-container">
                                    <c:set var="errorLastName">
                                        <form:errors path="lastName" cssClass="invalid-feedback" />
                                    </c:set>
                                    <label class="form-label" for="lastName">Last Name:</label>
                                    <form:input id="lastName" placeholder="LastName" type="text"
                                        class="form-control ${not empty errorLastName   ?'is-invalid':''}  "
                                        path="lastName" name="lastName" />
                                    ${errorLastName}
                                </div>

                                <div class="input-container">
                                    <c:set var="errorEmail">
                                        <form:errors path="email" cssClass="invalid-feedback" />
                                    </c:set>
                                    <label class="form-label" for="email">Email:</label>
                                    <form:input id="email" placeholder="Email" type="email"
                                        class="form-control ${not empty errorEmail   ?'is-invalid':''}  " path="email"
                                        name="email" />
                                    ${errorEmail}
                                </div>

                                <div class="input-container">
                                    <label class="form-label" for="password">Password:</label>
                                    <div class="hidepassword">
                                        <form:input id="password" placeholder="Password" type="password"
                                            class="form-control  " name="password" path="password" />
                                        <img src="/assets/images/eye-close.png" alt="Toggle Password Visibility"
                                            style="height: 15px; width: 15px;" id="img-show1">

                                    </div>
                                    <p id="message_password"></p>
                                </div>

                                <div class="input-container">
                                    <label class="form-label" for="confirmPassword">Confirm Password:</label>
                                    <form:input id="confirmPassword" placeholder="ConfirmPassword" type="password"
                                        class="form-control ${not empty errorconfirmPassword   ?'is-invalid':''}"
                                        path="confirmPassword" name="confirmPassword" />
                                    ${errorconfirmPassword}
                                </div>
                                <div class="col-12 mb-5">
                                    <button type="submit" class="btn btn-success">Create</button>
                                </div>
                            </div>
                        </form:form>
                    </main>

                    <script>
                        const passwordInput = document.getElementById('password');
                        const messagePass = document.getElementById('message_password');
                        if (passwordInput.value.length > 0) {
                            updatePasswordStrength();
                        }

                        // Function to check if the password is strong
                        const checkStrong = (password) => {
                            const isLongEnough = password.length >= 12;
                            const hasLowercase = /[a-z]/.test(password);
                            const hasUppercase = /[A-Z]/.test(password);
                            const hasNumbers = /[0-9]/.test(password);
                            const hasSpecialChars = /[\W_]/.test(password);
                            return isLongEnough && hasLowercase && hasUppercase && hasNumbers && hasSpecialChars;
                        };

                        // Function to check if the password is medium
                        const checkMedium = (password) => {
                            const isLongEnough = password.length >= 8;
                            const hasLowercase = /[a-z]/.test(password);
                            const hasUppercase = /[A-Z]/.test(password);
                            const hasNumbers = /[0-9]/.test(password);
                            const hasSpecialChars = /[\W_]/.test(password);
                            const typesCount = [hasLowercase, hasUppercase, hasNumbers, hasSpecialChars].filter(Boolean).length;
                            return isLongEnough && typesCount >= 2;
                        };

                        // Function to check if the password is weak
                        const checkWeak = (password) => {
                            const isShort = password.length < 8;
                            const hasOnlyLowercase = /^[a-z]+$/.test(password);
                            const hasOnlyUppercase = /^[A-Z]+$/.test(password);
                            const hasOnlyNumbers = /^[0-9]+$/.test(password);
                            const hasOnlySpecialChars = /^[\W_]+$/.test(password);
                            return isShort || hasOnlyLowercase || hasOnlyUppercase || hasOnlyNumbers || hasOnlySpecialChars;
                        };

                        // Function to update the password strength message
                        function updatePasswordStrength() {
                            const password = passwordInput.value;

                            if (password.length > 0) {
                                messagePass.classList.remove('password-weak', 'password-medium', 'password-strong');

                                if (checkStrong(password)) {
                                    messagePass.classList.add('password-strong');
                                    messagePass.textContent = 'Strong';
                                } else if (checkMedium(password)) {
                                    messagePass.classList.add('password-medium');
                                    messagePass.textContent = 'Medium';
                                } else if (checkWeak(password)) {
                                    messagePass.classList.add('password-weak');
                                    messagePass.textContent = 'Too Weak';
                                } else {
                                    messagePass.textContent = '';
                                }
                            } else {
                                messagePass.textContent = '';
                            }
                        };

                        // Attach event listener to the password input field
                        passwordInput.addEventListener('input', updatePasswordStrength);
                        let img_show1 = document.getElementById("img-show1");
                        img_show1.addEventListener('click', function () {
                            if (passwordInput.type === "password") {
                                passwordInput.type = "text";
                                img_show1.src = "/assets/images/eye-open.png";
                            }
                            else if (passwordInput.type === "text") {
                                passwordInput.type = "password";
                                img_show1.src = "/assets/images/eye-close.png";
                            }
                        });
                    </script>

                </body>

                </html>