<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>'
        <header class="header" data-header>
            <div class="container">
                <div class="content">
                    <article class="home_icon">
                        <a href="./" class="navbar__icon menu-icon">
                            <img src="/images/header/icon.png" alt="" class="home-img">
                        </a>
                        <span>
                            <a href="./" class="navbar-link">
                                KAISHOP
                            </a>
                        </span>
                    </article>

                    <nav class="navbar" data-navbar>

                        <ul class="navbar-list">

                            <li class="navbar-item navbar-item__hover">
                                <a href="#" class="navbar-link">Home</a>
                                <!-- <ul class="dropdown-item">
                                <li class="item">
                                    <a href="#">
                                        item1
                                    </a>
                                </li>
                                <li class="item">
                                    <a href="#">
                                        item2
                                    </a>
                                </li>
                                <li class="item">
                                    <a href="#">
                                        item3
                                    </a>
                                </li>
                            </ul> -->
                            </li>

                            <li class="navbar-item">
                                <a href="#" class="navbar-link">About</a>
                            </li>

                            <li class="navbar-item">
                                <a href="#" class="navbar-link">Products</a>
                            </li>

                            <li class="navbar-item">
                                <a href="#" class="navbar-link">Shop</a>
                            </li>

                            <li class="navbar-item">
                                <a href="#" class="navbar-link">Blog</a>
                            </li>

                            <li class="navbar-item">
                                <a href="#" class="navbar-link">Contact</a>
                            </li>

                        </ul>
                    </nav>

                    <div class="action-container">
                        <ul class="nav-action-list">
                            <!-- <li>
                            <a href="#" class="nav-action-btn">
                               Sign In
                            </a>
                        </li>
    
                        <li>
                            <a href="#" class="nav-action-btn">
                               Sign Up
                            </a>
                        </li> -->

                            <li class="icon-action user-icon">
                                <i class="fa-solid fa-user"></i>
                                <ul class="dropdown-item">
                                    <article class="dropdown-item__top">
                                        <img class="img-user"
                                            src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTyKpQUy8JP90MAZxFjU0P9bPqkUWL35fd8Ag&s"
                                            alt="">
                                        <span>Name user</span>
                                    </article>
                                    <li class="item">
                                        <a href="#">
                                            Account
                                        </a>
                                    </li>
                                    <li class="item">
                                        <a href="#">
                                            Order History
                                        </a>
                                    </li>
                                    <li class="item">
                                        <form method="post" action="/logout">
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <button class="dropdown-item">Logout</button>
                                        </form>
                                    </li>
                                </ul>
                            </li>
                            <li class="icon-action cart-icon">
                                <i class="fa-solid fa-cart-shopping"></i>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </header>