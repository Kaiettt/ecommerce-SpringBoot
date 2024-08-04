<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>'
        <header class="header" data-header>
            <div class="container">

                <div class="overlay" data-overlay></div>
                <button class="nav-open-btn" data-nav-open-btn aria-label="Open Menu">
                    <ion-icon name="menu-outline"></ion-icon>
                </button>

                <nav class="navbar" data-navbar>

                    <button class="nav-close-btn" data-nav-close-btn aria-label="Close Menu">
                        <ion-icon name="close-outline"></ion-icon>
                    </button>

                    <ul class="navbar-list">

                        <li class="navbar-item">
                            <a href="#" class="navbar-link">Home</a>
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

                    <ul class="nav-action-list">

                        <li>
                            <button class="nav-action-btn">
                                <ion-icon name="search-outline" aria-hidden="true"></ion-icon>

                                <span class="nav-action-text">Search</span>
                            </button>
                        </li>

                        <li>
                            <a href="#" class="nav-action-btn">
                                <ion-icon name="person-outline" aria-hidden="true"></ion-icon>

                                <span class="nav-action-text">Login / Register</span>
                            </a>
                        </li>



                        <li>
                            <button class="nav-action-btn">
                                <ion-icon name="bag-outline" aria-hidden="true"></ion-icon>

                                <data class="nav-action-text" value="318.00">Basket:
                                    <strong>$318.00</strong></data>

                                <data class="nav-action-badge" value="4" aria-hidden="true">4</data>
                            </button>
                        </li>

                    </ul>

                </nav>

            </div>
        </header>