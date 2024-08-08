<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>'
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>KAISHOP - Find your footwear</title>
                <link rel="shortcut icon" href="./favicon.svg" type="image/svg+xml">
                <link rel="stylesheet" href="/client/css/style.css">
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
                    integrity="sha384-M4cOlXWnx94xVV95HvTAX3LJm3tjX8k7vnb5H0iOjKk0f6DqqRYff9Z2qTmJxPcg"
                    crossorigin="anonymous">
                <!-- cnd icon  -->
                <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css">

                <!-- link css  -->
                <link
                    href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@300;400;500;600;700&family=Roboto:wght@400;500;700&display=swap"
                    rel="stylesheet">
                <link rel="preload" href="/client/images/hero-banner.png" as="image">
                <style>
                    .header {
                        background: linear-gradient(to right, #7dc499, rgb(36, 123, 36));
                        position: fixed;
                        top: 0;
                        left: 0;
                        width: 100%;
                        transition: var(--transition-1);
                        z-index: 4;
                        color: var(--text-color);
                    }

                    .container {
                        padding: 20px 0;
                        width: 90%;
                        ;
                        max-width: calc(100% - 48px);
                        margin-left: auto;
                        margin-right: auto;
                    }


                    .content {
                        display: flex;
                        align-items: center;
                        justify-content: space-between;
                    }

                    .navbar-list {
                        display: flex;
                        gap: 40px;
                    }

                    .navbar-link {
                        color: var(--text-color);
                    }

                    /* 
.navbar-item__hover:hover .dropdown-item{
   display: block;
} */


                    /* home icon     */
                    .home_icon {
                        display: flex;
                        align-items: center;
                        text-decoration: none;
                        gap: 16px;
                        margin-right: 150px;
                    }

                    #showusercart {
                        margin-left: 150px;
                        color: white;
                    }

                    .home_icon span a {
                        color: green;
                    }

                    .home-img {
                        width: 50px;
                        height: 50px;
                        object-fit: cover;
                    }


                    .nav-action-btn {
                        color: var(--text-color);
                    }

                    /* dropdown  */

                    .navbar-item {
                        position: relative;
                        padding: 10px;

                    }

                    .dropdown-item {
                        display: none;
                        position: absolute;
                        top: 33px;
                        left: -51px;
                        border-radius: 3px;
                        background: var(--primary-color);
                        color: var(--text-color);
                        text-align: center;
                        box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
                        min-width: 200px;
                    }

                    .dropdown-item .item a {
                        width: 100%;
                        color: var(--text-color);
                        padding: 10px 12px;
                    }


                    .dropdown-item .item:hover {
                        opacity: 0.8;
                        background: #9fd2b4;
                    }


                    /* action   */
                    .nav-action-list {
                        display: flex;
                        gap: 50px;
                        cursor: pointer;
                    }

                    .user-icon {
                        position: relative;
                    }


                    .user-icon::after {
                        position: absolute;
                        content: "";
                        top: 100%;
                        left: 0;
                        width: 20px;
                        background: transparent;
                        height: 14px;
                    }

                    .user-icon:hover .dropdow-item {
                        display: block;
                    }

                    .selection-bar {
                        margin-left: 50px;
                    }

                    .user-icon:hover .dropdown-item {
                        display: block;
                    }

                    .dropdown-item::before {
                        position: absolute;
                        z-index: -1;
                        left: 53px;
                        top: -5px;
                        content: "";
                        width: 10px;
                        height: 10px;
                        background: var(--primary-color);
                        rotate: -45deg;
                    }

                    .dropdown-item__top {
                        padding: 10px;
                        display: flex;
                        align-items: center;
                        gap: 20px;
                    }

                    .cart-icon {
                        position: relative;
                    }

                    .cart-icon::after {
                        position: absolute;
                        content: "${sessionScope.sum}";
                        top: -14px;
                        right: -8px;
                        width: 20px;
                        height: 20px;
                        border-radius: 50%;
                        background: red;
                        text-align: center;
                    }

                    .img-user {
                        width: 50px;
                        height: 50px;
                        border-radius: 50%;
                        object-fit: cover;
                    }
                </style>
            </head>

            <body id="top">
                <header class="header" data-header>
                    <div class="container">
                        <div class="content">
                            <article class="home_icon">
                                <a href="/" class="navbar__icon menu-icon">
                                    <img src="/images/header/icon.png" alt="" class="home-img">
                                </a>
                                <span>
                                    <a href="./" class="navbar-link">
                                        KAISHOP
                                    </a>
                                </span>
                            </article>
                            <nav id="selection-bar" class="navbar" data-navbar>

                                <ul class="navbar-list" style="color: white;">

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
                            <div class="action-container" id="showusercart">
                                <ul class="nav-action-list">
                                    <c:if test="${empty pageContext.request.userPrincipal}">
                                        <li>
                                            <a href="/login" class="nav-action-btn">
                                                Sign In
                                            </a>
                                        </li>

                                        <li>
                                            <a href="/register" class="nav-action-btn">
                                                Sign Up
                                            </a>
                                        </li>
                                    </c:if>
                                    <c:if test="${not empty pageContext.request.userPrincipal}">
                                        <li class="icon-action user-icon">
                                            <i class="fa-solid fa-user"></i>
                                            <form method="post" action="/logout">
                                                <ul class="dropdown-item" style="background-color: green;">
                                                    <article class="dropdown-item__top">
                                                        <img class="img-user"
                                                            src="/images/avatar/${sessionScope.avatar}" alt="">
                                                        <span>
                                                            <c:out value="${sessionScope.fullName}" />
                                                        </span>
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
                                                        <input type="hidden" name="${_csrf.parameterName}"
                                                            value="${_csrf.token}" />
                                                        <button type="submit" class="dropdown-item">Log out</button>
                                                    </li>
                                                </ul>
                                            </form>
                                        </li>
                                        <li class="icon-action cart-icon">
                                            <a href="/cart"> <i class="fa-solid fa-cart-shopping"></i></a>
                                        </li>
                                    </c:if>

                                </ul>
                            </div>
                        </div>
                    </div>
                </header>
                <main>
                    <article>
                        <section class="section hero" style="background-image: url('/client/images/bannershoes.jpg')">
                        </section>
                        <section class="section collection">
                            <div class="container">

                                <ul class="collection-list has-scrollbar">

                                    <li>
                                        <div class="collection-card"
                                            style="background-image: url('/images/product/NikeAir.png')">
                                            <h3 class="h4 card-title">Nike AIR</h3>

                                            <a href="#" class="btn btn-secondary">
                                                <span>Explore All</span>

                                                <ion-icon name="arrow-forward-outline" aria-hidden="true"></ion-icon>
                                            </a>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="collection-card"
                                            style="background-image: url('/images/product/NewBalanceTekela.png')">
                                            <h3 class="h4 card-title">ADIDAS</h3>

                                            <a href="#" class="btn btn-secondary">
                                                <span>Explore All</span>

                                                <ion-icon name="arrow-forward-outline" aria-hidden="true"></ion-icon>
                                            </a>
                                        </div>
                                    </li>

                                    <li>
                                        <div class="collection-card"
                                            style="background-image: url('/images/product/ReebokInstante.png')">
                                            <h3 class="h4 card-title">LOTUS</h3>

                                            <a href="#" class="btn btn-secondary">
                                                <span>Explore All</span>

                                                <ion-icon name="arrow-forward-outline" aria-hidden="true"></ion-icon>
                                            </a>
                                        </div>
                                    </li>

                                </ul>

                            </div>
                        </section>
                        <jsp:include page="../layout/feature.jsp" />
                        <section class="section product">
                            <div class="container">

                                <h2 class="h2 section-title">Bestsellers Products</h2>

                                <ul class="filter-list">

                                    <li>
                                        <button class="filter-btn  active">All</button>
                                    </li>

                                    <li>
                                        <button class="filter-btn">Nike</button>
                                    </li>

                                    <li>
                                        <button class="filter-btn">Adidas</button>
                                    </li>

                                    <li>
                                        <button class="filter-btn">Puma</button>
                                    </li>

                                    <li>
                                        <button class="filter-btn">Bata</button>
                                    </li>

                                    <li>
                                        <button class="filter-btn">Apex</button>
                                    </li>

                                </ul>

                                <ul class="product-list">
                                    <c:forEach items="${Products}" var="Product">
                                        <li class="product-item">
                                            <div class="product-card" tabindex="0">

                                                <figure class="card-banner">
                                                    <a href="/homepage/product/${Product.id}"> <img
                                                            src="/images/product/${Product.image}" width=" 312"
                                                            height="350" loading="lazy" alt="Running Sneaker Shoes"
                                                            class="image-contain"></a>
                                                    <div class="card-badge">New</div>

                                                    <ul class="card-action-list">

                                                        <li class="card-action-item">
                                                            <form action="/add-product-to-cart/${Product.id}"
                                                                method="post">
                                                                <input type="hidden" name="${_csrf.parameterName}"
                                                                    value="${_csrf.token}" />
                                                                <button class="card-action-btn"
                                                                    aria-labelledby="card-label-1">
                                                                    <ion-icon name="cart-outline"></ion-icon>
                                                                </button>
                                                                <div class="card-action-tooltip" id="card-label-1">Add
                                                                    to
                                                                    Cart</div>
                                                            </form>
                                                        </li>
                                                        <a href="/homepage/product/${Product.id}">
                                                            <li class="card-action-item">
                                                                <button class="card-action-btn"
                                                                    aria-labelledby="card-label-3">
                                                                    <ion-icon name="eye-outline"></ion-icon>
                                                                </button>

                                                                <div class="card-action-tooltip" id="card-label-3">Quick
                                                                    View</div>
                                                            </li>
                                                        </a>

                                                    </ul>
                                                </figure>

                                                <div class="card-content">

                                                    <div class="card-cat">
                                                        <a href="#" class="card-cat-link">${Product.brand}</a>

                                                    </div>

                                                    <h3 class="h3 card-title">
                                                        <a href="#">${Product.name}</a>
                                                    </h3>

                                                    <data class="card-price" value="${Product.price}">${Product.price}
                                                        $</data>

                                                </div>

                                            </div>
                                        </li>
                                    </c:forEach>
                                </ul>

                            </div>
                        </section>

                    </article>
                </main>
                <jsp:include page="../layout/footer.jsp" />
                <a href="#top" class="go-top-btn" data-go-top>
                    <ion-icon name="arrow-up-outline"></ion-icon>
                </a>
                <script src="/client/js/script.js"></script>
                <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
                <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
                <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
                    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
                    crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
                    integrity="sha384-IQsoLXlI2C2YmZ3+Az1QwIh1Lvz6HBdG1V4QW0Ndb+Yze6jqnegyhDys5Fz3Gz/Z"
                    crossorigin="anonymous"></script>
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
                    integrity="sha384-B4gt1jrGC7Jh4Ag4U1TjtT8XnLk3e9FhFMAJz5i29JJzMIeYIhNRBbl4fYunQZkP"
                    crossorigin="anonymous"></script>
            </body>

            </html>