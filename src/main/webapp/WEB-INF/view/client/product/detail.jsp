<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8">
                <title>${Product.name}</title>
                <meta content="width=device-width, initial-scale=1.0" name="viewport">
                <meta content="" name="keywords">
                <meta content="" name="description">

                <!-- Google Web Fonts -->
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link
                    href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
                    rel="stylesheet">

                <!-- Icon Font Stylesheet -->
                <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
                <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
                    rel="stylesheet">

                <!-- Libraries Stylesheet -->
                <link href="/client/lib/lightbox/css/lightbox.min.css" rel="stylesheet">
                <link href="/client/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


                <!-- Customized Bootstrap Stylesheet -->
                <link href="/client/css/bootstrap.min.css" rel="stylesheet">

                <!-- Template Stylesheet -->
                <link href="/client/css/styleview.css" rel="stylesheet">\
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
                        content: "4";
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

                    .disabled {
                        cursor: not-allowed;

                    }

                    .shoes-size-container {
                        display: flex;
                        flex-direction: row;
                        justify-content: flex-start;
                        margin-bottom: 20px;
                    }

                    .size-button {
                        margin-left: 5px;
                        padding: 10px 20px;
                        border: 1px solid #ddd;
                        border-radius: 5px;
                        font-size: 18px;
                        text-align: center;
                        cursor: pointer;
                        transition: background-color 0.3s, border-color 0.3s;
                        background-color: transparent;
                        color: inherit;
                        outline: none;
                        /* Removes the default outline on focus */
                    }

                    .size-button:hover {
                        background-color: #f0f0f0;
                        border-color: #ccc;
                    }

                    .size-button:focus {
                        outline: 2px solid #aaa;
                        /* Adds a custom outline when focused */
                    }

                    .choosed-size {
                        background-color: rgb(22, 180, 22);
                        color: white;
                    }
                </style>
            </head>

            <body>

                <!-- Single Product Start -->
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
                        </div>
                    </div>
                </header>
                <div class="container-fluid py-5 mt-5">
                    <div class="container py-5">
                        <div class="row g-4 mb-5">
                            <div class="header-view">

                                <ol class="breadcrumb">
                                    <li><a href="/">Homepage / </a></li>
                                    <li style="margin-left: 5px;">Product</li>
                                </ol>
                            </div>
                            <div class="col-lg-8 col-xl-9">
                                <div class="row g-4">
                                    <div class="col-lg-6">
                                        <div class="border rounded">
                                            <a href="#">
                                                <img src="/images/product/${Product.image}" class="img-fluid rounded"
                                                    alt="Image">
                                            </a>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <h4 class="fw-bold mb-3">${Product.name}</h4>
                                        <p class="mb-3">${Product.brand}</p>
                                        <h5 class="fw-bold mb-3">
                                            ${Product.price} $
                                        </h5>
                                        <div class="d-flex mb-4">
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star text-secondary"></i>
                                            <i class="fa fa-star"></i>
                                        </div>

                                        <p class="mb-4">${Product.short_description}</p>
                                        <form action="/add-product-to-cart-detail/${Product.id}" method="post">
                                            <div class="shoes-size-container">
                                                <div
                                                    style="padding: 10px 10px; background-color: brown; color: white; font-weight: 600;">
                                                    Size
                                                </div>
                                                <button type="button" class="size-button" id="size-39">
                                                    39
                                                </button>
                                                <button type="button" class="size-button" id="size-40">
                                                    40
                                                </button>
                                                <button type="button" class="size-button" id="size-41">
                                                    41
                                                </button>
                                                <button type="button" class="size-button" id="size-42">
                                                    42
                                                </button>
                                                <input type="text" name="shoesSize" id="size-input"
                                                    class="form-control form-control-sm text-center border-0" value="39"
                                                    style="display: none;">
                                            </div>
                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                            <div class="input-group quantity mb-5" style="width: 100px;">
                                                <div class="input-group-btn">
                                                    <button type="button" id="decrease-button"
                                                        class="btn btn-sm btn-minus rounded-circle bg-light border">
                                                        <i class="fa fa-minus"></i>
                                                    </button>
                                                </div>
                                                <input type="text" name="quantity" id="quantity-input"
                                                    class="form-control form-control-sm text-center border-0" value="1">
                                                <div class="input-group-btn">
                                                    <button type="button" id="increase-button"
                                                        class="btn btn-sm btn-plus rounded-circle bg-light border">
                                                        <i class="fa fa-plus"></i>
                                                    </button>
                                                </div>
                                            </div>

                                            <button type="submit"
                                                class="btn border border-secondary rounded-pill px-3 text-primary">
                                                <i class="fa fa-shopping-bag me-2 text-primary"></i>
                                                Add to cart
                                            </button>
                                        </form>

                                    </div>
                                    <div class="col-lg-12">
                                        <nav>
                                            <div class="nav nav-tabs mb-3">
                                                <button class="nav-link active border-white border-bottom-0"
                                                    type="button" role="tab" id="nav-about-tab" data-bs-toggle="tab"
                                                    data-bs-target="#nav-about" aria-controls="nav-about"
                                                    aria-selected="true">Mô tả</button>
                                            </div>
                                        </nav>
                                        <div class="tab-content mb-5">
                                            <div class="tab-pane active" id="nav-about" role="tabpanel"
                                                aria-labelledby="nav-about-tab">
                                                <p>${Product.detail_description}</p>

                                            </div>
                                        </div>
                                    </div>

                                </div>
                            </div>
                            <div class="col-lg-4 col-xl-3">
                                <div class="row g-4 fruite">
                                    <div class="col-lg-12">
                                        <div class="mb-4">
                                            <h4>Categories</h4>
                                            <ul class="list-unstyled fruite-categorie">
                                                <li>
                                                    <div class="d-flex justify-content-between fruite-name">
                                                        <a href="#"><i
                                                                class="fas fa-apple-alt me-2"></i>${Product.brand}</a>
                                                        <span>(3)</span>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <!-- Single Product End -->



                <!-- Back to Top -->
                <a href="#" class="btn btn-primary border-3 border-primary rounded-circle back-to-top"><i
                        class="fa fa-arrow-up"></i></a>


                <!-- JavaScript Libraries -->
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
                <script src="/client/lib/easing/easing.min.js"></script>
                <script src="/client/lib/waypoints/waypoints.min.js"></script>
                <script src="/client/lib/lightbox/js/lightbox.min.js"></script>
                <script src="/client/lib/owlcarousel/owl.carousel.min.js"></script>
                <!-- Template Javascript -->
                <script src="/client/js/main.js"></script>
                <script>
                    let debutton = document.getElementById("decrease-button");
                    let ibutton = document.getElementById("increase-button");
                    let input = document.getElementById("quantity-input");

                    function handleDecrease() {
                        let quantity = parseInt(input.value);
                        if (quantity > 1) {
                            quantity--;
                            input.value = quantity;
                            debutton.classList.remove("disabled"); // Re-enable if quantity > 1
                        } else {
                            debutton.classList.add("disabled"); // Disable if quantity is 1
                        }
                    }

                    function handleIncrease() {
                        let quantity = parseInt(input.value);
                        quantity++;
                        input.value = quantity;
                        debutton.classList.remove("disabled"); // Re-enable on increase
                    }

                    // Initialize button state
                    if (parseInt(input.value) <= 1) {
                        debutton.classList.add("disabled");
                    }

                    debutton.addEventListener('click', handleDecrease);
                    ibutton.addEventListener('click', handleIncrease);


                    // Handle choose size
                    let but1 = document.getElementById("size-39");
                    let but2 = document.getElementById("size-40");
                    let but3 = document.getElementById("size-41");
                    let but4 = document.getElementById("size-42");
                    let shoesSize = document.getElementById("size-input");
                    function handleClick(index) {
                        for (let i = 39; i <= 42; i++) {
                            let but = document.getElementById("size-" + i);
                            if (but.classList.contains("choosed-size")) { // Removed the extra space
                                but.classList.remove("choosed-size");
                            }
                        }
                        let but = document.getElementById("size-" + index);
                        shoesSize.value = but.innerHTML;
                        but.classList.add("choosed-size");
                    }

                    but1.addEventListener('click', function () {
                        handleClick(39);
                    });
                    but2.addEventListener('click', function () {
                        handleClick(40);
                    });
                    but3.addEventListener('click', function () {
                        handleClick(41);
                    });
                    but4.addEventListener('click', function () {
                        handleClick(42);
                    });
                </script>
            </body>

            </html>