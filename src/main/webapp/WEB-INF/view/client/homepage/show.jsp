<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>'
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta http-equiv="X-UA-Compatible" content="IE=edge">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>KAISHOP - Find your footware</title>
                <link rel="shortcut icon" href="./favicon.svg" type="image/svg+xml">
                <link rel="stylesheet" href="/client/css/style.css">
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@300;400;500;600;700&family=Roboto:wght@400;500;700&display=swap"
                    rel="stylesheet">
                <link rel="preload" href="/client/images/hero-banner.png" as="image">
            </head>

            <body id="top">
                <jsp:include page="../layout/header.jsp" />
                <main>
                    <article>
                        <section class="section hero" style="background-image: url('/client/images/banner-shoes.jpg')">
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
                                                            <button class="card-action-btn"
                                                                aria-labelledby="card-label-1">
                                                                <ion-icon name="cart-outline"></ion-icon>
                                                            </button>

                                                            <div class="card-action-tooltip" id="card-label-1">Add to
                                                                Cart</div>
                                                        </li>

                                                        <li class="card-action-item">
                                                            <button class="card-action-btn"
                                                                aria-labelledby="card-label-2">
                                                                <ion-icon name="heart-outline"></ion-icon>
                                                            </button>

                                                            <div class="card-action-tooltip" id="card-label-2">Add to
                                                                Whishlist
                                                            </div>
                                                        </li>

                                                        <li class="card-action-item">
                                                            <button class="card-action-btn"
                                                                aria-labelledby="card-label-3">
                                                                <ion-icon name="eye-outline"></ion-icon>
                                                            </button>

                                                            <div class="card-action-tooltip" id="card-label-3">Quick
                                                                View</div>
                                                        </li>
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

            </body>

            </html>