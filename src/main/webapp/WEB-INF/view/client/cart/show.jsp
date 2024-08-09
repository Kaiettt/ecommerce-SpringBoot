<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>'
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width, initial-scale=1.0">
                    <title>Cart</title>

                    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
                    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap-theme.min.css"
                        rel="stylesheet">
                    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
                    <style>
                        .button-quantity {
                            outline: none;
                            border: none;
                            padding: 10px 17px;
                            border-radius: 20px;
                            background-color: #80b548;

                            color: white;

                            font-size: 10px;

                            cursor: pointer;
                            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                            border-radius: 50%;
                            transition: background-color 0.3s ease, transform 0.2s ease;
                        }

                        .button-section {
                            margin-left: 105px;
                        }

                        .button-quantity:hover {
                            background-color: #9bbb79;
                            transform: scale(1.05);
                        }

                        .button-quantity:active {
                            background-color: #84b058;
                            /* Màu nền khi bấm giữ */
                            transform: scale(0.95);
                            /* Giảm kích thước khi bấm giữ */

                        }

                        .button-quantity:focus {
                            outline: none;
                            /* Loại bỏ viền đen khi phần tử được chọn */
                        }

                        .disabled {
                            opacity: 0.6;
                            cursor: not-allowed;
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

                        .custom-button {
                            margin-left: 10px;
                            margin-top: 10px;
                            display: inline-flex;
                            align-items: center;
                            padding: 8px 16px;
                            border: 2px solid #ff3b3b;
                            border-radius: 8px;
                            background-color: #fff;
                            color: #ff3b3b;
                            font-size: 16px;
                            font-weight: bold;
                            cursor: pointer;
                            text-decoration: none;
                            transition: background-color 0.3s, color 0.3s;

                        }

                        .custom-button:hover {
                            background-color: #ff3b3b;
                            color: #fff;
                        }

                        .custom-button i {
                            margin-right: 8px;
                            /* Space between icon and text */
                            font-size: 20px;
                        }

                        .choosed-size {
                            background-color: rgb(22, 180, 22);
                            color: white;
                        }
                    </style>
                </head>

                <body>
                    <section class="h-100 h-custom" style="background-color: #eee;">
                        <div class="container py-5 h-100">
                            <div class="row d-flex justify-content-center align-items-center h-100">
                                <div class="col">
                                    <div class="card">
                                        <div class="card-body p-4">
                                            <div class="row">
                                                <div class="col-lg-7">
                                                    <h5 class="mb-3"><a href="/" class="text-body"><i
                                                                class="fas fa-long-arrow-alt-left me-2"></i>Continue
                                                            shopping</a></h5>
                                                    <hr>

                                                    <div class="d-flex justify-content-between align-items-center mb-4">
                                                        <div>
                                                            <p class="mb-1">Shopping cart</p>
                                                            <input id="sizelist" type="text" value="${sizelist}"
                                                                style="display: none;">
                                                            <p class="mb-0">You have ${sizelist} items in your
                                                                cart
                                                            </p>
                                                        </div>
                                                        <div>
                                                            <p class="mb-0"><span class="text-muted">Sort by:</span> <a
                                                                    href="#!" class="text-body">price <i
                                                                        class="fas fa-angle-down mt-1"></i></a>
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <c:if test="${empty cartDetails}">
                                                        No item in Cart
                                                    </c:if>
                                                    <c:if test="${not empty cartDetails}">
                                                        <c:forEach items="${cartDetails}" var="cartDetail"
                                                            varStatus="loop">
                                                            <div class="card mb-3">
                                                                <div class="card-body" style="padding: 20px;">
                                                                    <div class="d-flex justify-content-between">
                                                                        <div class="d-flex flex-row align-items-center">
                                                                            <div>
                                                                                <img src="/images/product/${cartDetail.product.image}"
                                                                                    class="img-fluid rounded-3"
                                                                                    alt="Shopping item"
                                                                                    style="width: 100px;">
                                                                            </div>
                                                                            <div class="ms-3" style="margin-left: 5px;">
                                                                                <h5>${cartDetail.product.name}</h5>
                                                                                <p class="small mb-0">
                                                                                    ${cartDetail.product.brand},
                                                                                    ${cartDetail.product.material}</p>
                                                                            </div>
                                                                        </div>
                                                                        <div class="d-flex flex-row align-items-center">
                                                                            <div style="width: 80px;">
                                                                                <h5 class="mb-0"
                                                                                    id="cartDetailPrice-${loop.index}"
                                                                                    style=" white-space: nowrap;">
                                                                                    ${cartDetail.price} $</h5>
                                                                                <p id="productPrice-${loop.index}"
                                                                                    style="display: none;">
                                                                                    ${cartDetail.product.price}</p>
                                                                            </div>
                                                                            <form method="post"
                                                                                action="/delete-cart-product/${cartDetail.id}">
                                                                                <input type="hidden"
                                                                                    name="${_csrf.parameterName}"
                                                                                    value="${_csrf.token}" />
                                                                                <button class="custom-button">
                                                                                    <i class="material-icons">delete</i>
                                                                                </button>
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                    <div style="background-color: white; width: 50px;">
                                                                        <div
                                                                            class="d-flex justify-content-between flex-1">
                                                                            <div
                                                                                style="padding: 10px 10px; background-color: brown; color: white; font-weight: 600;">
                                                                                Size
                                                                            </div>
                                                                            <button class="size-button"
                                                                                id="size-39-${loop.index}">
                                                                                39
                                                                            </button>
                                                                            <button class="size-button"
                                                                                id="size-40-${loop.index}">
                                                                                40
                                                                            </button>
                                                                            <button class="size-button"
                                                                                id="size-41-${loop.index}">
                                                                                41
                                                                            </button>
                                                                            <button class="size-button"
                                                                                id="size-42-${loop.index}">
                                                                                42
                                                                            </button>
                                                                            <input type="text" name="shoesSize"
                                                                                id="size-input-${loop.index}"
                                                                                class="form-control form-control-sm text-center border-0"
                                                                                value="${cartDetail.size}"
                                                                                style="display: none;">
                                                                            <div
                                                                                class="d-flex flex-row align-items-center button-section">
                                                                                <button
                                                                                    id="button-decrease-${loop.index}"
                                                                                    class=" mr-1 button-quantity">-</button>
                                                                                <input id="input-quantity-${loop.index}"
                                                                                    value=" ${cartDetail.quantity}"
                                                                                    type="text"
                                                                                    style="width: 50px; text-align: center; padding-right: 10px;">
                                                                                <button
                                                                                    id="button-increase-${loop.index}"
                                                                                    class="ml-1 button-quantity">+</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </c:if>

                                                </div>
                                                <div class="col-lg-5">

                                                    <div class="card bg-primary text-white rounded-3">
                                                        <div class="card-body">
                                                            <div
                                                                class="d-flex justify-content-between align-items-center mb-4">
                                                                <h5 class="mb-0">Customer Information</h5>
                                                                <img src="/images/avatar/${sessionScope.avatar}"
                                                                    class="img-fluid rounded-3"
                                                                    style="width: 80px; border-radius: 50%;"
                                                                    alt="Avatar">
                                                            </div>


                                                            <a href="#!" type="submit" class="text-white"><i
                                                                    class="fab fa-cc-mastercard fa-2x me-2"></i></a>
                                                            <a href="#!" type="submit" class="text-white"><i
                                                                    class="fab fa-cc-visa fa-2x me-2"></i></a>
                                                            <a href="#!" type="submit" class="text-white"><i
                                                                    class="fab fa-cc-amex fa-2x me-2"></i></a>
                                                            <a href="#!" type="submit" class="text-white"><i
                                                                    class="fab fa-cc-paypal fa-2x"></i></a>

                                                            <form class="mt-4">
                                                                <div data-mdb-input-init
                                                                    class="form-outline form-white mb-4">
                                                                    <input type="text" id="typeName"
                                                                        class="form-control form-control-lg" siez="17"
                                                                        placeholder="" />
                                                                    <label class="form-label" for="typeText">Full
                                                                        Name</label>
                                                                </div>

                                                                <div data-mdb-input-init
                                                                    class="form-outline form-white mb-4">
                                                                    <input type="text" id="typeText"
                                                                        class="form-control form-control-lg" siez="17"
                                                                        placeholder="+84" minlength="19"
                                                                        maxlength="19" />
                                                                    <label class="form-label" for="typeText">Phone
                                                                        Number</label>
                                                                </div>
                                                                <div data-mdb-input-init
                                                                    class="form-outline form-white mb-4">
                                                                    <input type="text" id="typeText"
                                                                        class="form-control form-control-lg" siez="17"
                                                                        minlength="19" maxlength="19" />
                                                                    <label class="form-label"
                                                                        for="typeText">Address</label>
                                                                </div>
                                                            </form>

                                                            <hr class="my-4">

                                                            <div class="d-flex justify-content-between">
                                                                <p class="mb-2">Subtotal</p>
                                                                <p class="mb-2" id="checkout-price">${checkoutPrice}$
                                                                </p>
                                                            </div>

                                                            <div class="d-flex justify-content-between">
                                                                <p class="mb-2">Shipping</p>
                                                                <p class="mb-2">$10.00</p>
                                                            </div>

                                                            <div class="d-flex justify-content-between mb-4">
                                                                <p class="mb-2">Total(Incl. taxes)</p>
                                                                <p class="mb-2" id="checkout-price-final">
                                                                    ${checkoutPrice + 10}$</p>

                                                            </div>

                                                            <button type="button" data-mdb-button-init
                                                                data-mdb-ripple-init
                                                                class="btn btn-info btn-block btn-lg">
                                                                <div class="d-flex justify-content-between">
                                                                    <span>$4818.00</span>
                                                                    <span>Checkout <i
                                                                            class="fas fa-long-arrow-alt-right ms-2"></i></span>
                                                                </div>
                                                            </button>

                                                        </div>
                                                    </div>

                                                </div>

                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
                    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
                    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                    <script>
                        document.addEventListener('DOMContentLoaded', function () {
                            function increaseQuantity(index) {
                                let input = document.getElementById("input-quantity-" + index);
                                let quantity = parseInt(input.value);
                                quantity++;
                                input.value = quantity;
                                let totalPrice = document.getElementById("cartDetailPrice-" + index);
                                let productPrice = parseFloat(document.getElementById("productPrice-" + index).innerHTML);
                                let newTotalPrice = productPrice * quantity;
                                totalPrice.innerHTML = newTotalPrice.toFixed(2) + "$";

                                // Get the elements by ID
                                let checkoutPrice = document.getElementById("checkout-price");
                                let checkoutPriceFinal = document.getElementById("checkout-price-final");

                                // Retrieve and parse the current values
                                let checkoutPriceValue = parseFloat(checkoutPrice.innerHTML.slice(0, -1).trim());
                                let checkoutPriceFinalValue = parseFloat(checkoutPriceFinal.innerHTML.slice(0, -1).trim());

                                // Update values
                                checkoutPriceValue += productPrice; // Add productPrice to the current value
                                checkoutPriceFinalValue += productPrice; // Add productPrice to the final value

                                // Format the updated values to 2 decimal places
                                checkoutPriceValue = checkoutPriceValue.toFixed(2);
                                checkoutPriceFinalValue = checkoutPriceFinalValue.toFixed(2);

                                // Update the innerHTML of the elements with the formatted values and currency symbol
                                checkoutPrice.innerHTML = checkoutPriceValue + " $";
                                checkoutPriceFinal.innerHTML = checkoutPriceFinalValue + " $";

                            }

                            function decreaseQuantity(index) {
                                let input = document.getElementById("input-quantity-" + index);
                                let quantity = parseInt(input.value);
                                if (quantity > 1) {
                                    quantity--;
                                    input.value = quantity;
                                    let totalPrice = document.getElementById("cartDetailPrice-" + index);
                                    let productPrice = parseFloat(document.getElementById("productPrice-" + index).innerHTML);
                                    let newTotalPrice = productPrice * quantity;
                                    totalPrice.innerHTML = newTotalPrice.toFixed(2) + "$";
                                    // Get the elements by ID
                                    let checkoutPrice = document.getElementById("checkout-price");
                                    let checkoutPriceFinal = document.getElementById("checkout-price-final");

                                    // Retrieve and parse the current values
                                    let checkoutPriceValue = parseFloat(checkoutPrice.innerHTML.slice(0, -1).trim());
                                    let checkoutPriceFinalValue = parseFloat(checkoutPriceFinal.innerHTML.slice(0, -1).trim());

                                    // Update values
                                    checkoutPriceValue -= productPrice; // Add productPrice to the current value
                                    checkoutPriceFinalValue -= productPrice; // Add productPrice to the final value

                                    // Format the updated values to 2 decimal places
                                    checkoutPriceValue = checkoutPriceValue.toFixed(2);
                                    checkoutPriceFinalValue = checkoutPriceFinalValue.toFixed(2);

                                    // Update the innerHTML of the elements with the formatted values and currency symbol
                                    checkoutPrice.innerHTML = checkoutPriceValue + " $";
                                    checkoutPriceFinal.innerHTML = checkoutPriceFinalValue + " $";

                                }
                            }

                            // Get the size element and validate it
                            const size = document.getElementById("sizelist");

                            if (size && size.value > 0) {

                                // Check if size element exists and has a valid value
                                for (let i = 0; i < size.value; i++) {
                                    // Get the input element for shoe size
                                    let shoesSize = document.getElementById("size-input-" + i);

                                    // Check if shoesSize exists before proceeding
                                    if (shoesSize) {
                                        let but = document.getElementById("size-" + parseInt(shoesSize.value) + "-" + i);

                                        // Check if the button exists before adding the class
                                        if (but) {
                                            but.classList.add("choosed-size");
                                        } else {
                                            console.warn("Button not found for size " + parseInt(shoesSize.value) + " at index " + i);
                                        }
                                    } else {
                                        console.warn("Shoes size input not found at index " + i);
                                    }
                                }


                                for (let i = 0; i < size.value; i++) {
                                    let buttonDecrease = document.getElementById("button-decrease-" + i);
                                    let buttonIncrease = document.getElementById("button-increase-" + i);

                                    // Check if the buttons exist before adding event listeners
                                    if (buttonDecrease && buttonIncrease) {
                                        // Add event listeners to the buttons
                                        buttonIncrease.addEventListener('click', function () {
                                            increaseQuantity(i);
                                        });

                                        buttonDecrease.addEventListener('click', function () {
                                            decreaseQuantity(i);
                                        });
                                    }


                                    // choose size
                                    function handleClick(size, index) {
                                        for (let j = 39; j <= 42; j++) {
                                            let but = document.getElementById("size-" + j + "-" + index);
                                            if (but.classList.contains("choosed-size")) { // Removed the extra space
                                                but.classList.remove("choosed-size");
                                            }
                                        }
                                        let but = document.getElementById("size-" + size + "-" + index);
                                        let shoesSize = document.getElementById("size-input-" + index);
                                        shoesSize.value = but.innerHTML;
                                        but.classList.add("choosed-size");
                                    }

                                    let but1 = document.getElementById("size-39-" + i);
                                    let but2 = document.getElementById("size-40-" + i);
                                    let but3 = document.getElementById("size-41-" + i);
                                    let but4 = document.getElementById("size-42-" + i);

                                    but1.addEventListener('click', function () {
                                        handleClick(39, i);
                                    });
                                    but2.addEventListener('click', function () {
                                        handleClick(40, i);
                                    });
                                    but3.addEventListener('click', function () {
                                        handleClick(41, i);
                                    });
                                    but4.addEventListener('click', function () {
                                        handleClick(42, i);
                                    });
                                }
                            } else {
                                console.error("Size element not found or invalid value.");
                            }
                        });
                    </script>

                </body>

                </html>