<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>'
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
                <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
                    <!DOCTYPE html>
                    <html lang="en">

                    <head>
                        <meta charset="UTF-8">
                        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                        <title>Cart</title>

                        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
                            rel="stylesheet">
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
                                                        <h5 class="mb-3"><a href="/cart" class="text-body"><i
                                                                    class="fas fa-long-arrow-alt-left me-2"></i>Back to
                                                                Cart</a></h5>
                                                        <hr>

                                                        <div
                                                            class="d-flex justify-content-between align-items-center mb-4">
                                                            <div>
                                                                <p class="mb-1">Shopping cart</p>
                                                                <input id="sizelist" type="text" value="${sizelist}"
                                                                    style="display: none;">
                                                                <p class="mb-0">You have ${checkoutsize} items to check
                                                                    out
                                                                </p>
                                                            </div>
                                                            <div>
                                                                <p class="mb-0"><span class="text-muted">Sort by:</span>
                                                                    <a href="#!" class="text-body">price <i
                                                                            class="fas fa-angle-down mt-1"></i></a>
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <c:forEach items="${cart.cartDetails}" var="cartDetail"
                                                            varStatus="loop">
                                                            <c:if test="${cartDetail.markBuy}">
                                                                <div class="card mb-3">
                                                                    <div class="card-body" style="padding: 20px;">
                                                                        <div class="d-flex justify-content-between">
                                                                            <div
                                                                                class="d-flex flex-row align-items-center">
                                                                                <div>
                                                                                    <img src="/images/product/${cartDetail.product.image}"
                                                                                        class="img-fluid rounded-3"
                                                                                        alt="Shopping item"
                                                                                        style="width: 100px;">
                                                                                </div>
                                                                                <div class="ms-3"
                                                                                    style="margin-left: 5px;">
                                                                                    <h5>${cartDetail.product.name}</h5>
                                                                                    <p class="small mb-0">
                                                                                        ${cartDetail.product.brand},
                                                                                        ${cartDetail.product.material}
                                                                                    </p>
                                                                                </div>
                                                                            </div>
                                                                            <div
                                                                                class="d-flex flex-row align-items-center">
                                                                                <div style="width: 80px;">
                                                                                    <h5 class="mb-0"
                                                                                        style=" white-space: nowrap;">
                                                                                        ${cartDetail.price} $</h5>
                                                                                    <p style="display: none;">
                                                                                        ${cartDetail.product.price}</p>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div
                                                                            style="background-color: white; width: 50px;">
                                                                            <div
                                                                                class="d-flex justify-content-between flex-1">
                                                                                <div
                                                                                    style="padding: 10px 10px; background-color: brown; color: white; font-weight: 600;">
                                                                                    Size
                                                                                </div>
                                                                                <button class="size-button choosed-size"
                                                                                    id="size-shoes-${loop.index}">
                                                                                    ${cartDetail.size}
                                                                                </button>
                                                                                <div
                                                                                    class="d-flex flex-row align-items-center button-section">
                                                                                    <input
                                                                                        value="${cartDetail.quantity}"
                                                                                        type="text"
                                                                                        style="width: 50px; text-align: center; padding-right: 10px;">
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </c:if>

                                                        </c:forEach>

                                                    </div>
                                                    <div class="col-lg-5">

                                                        <div class="card bg-primary text-white rounded-3">
                                                            <div class="card-body">
                                                                <div
                                                                    class="d-flex justify-content-between align-items-center mb-4">
                                                                    <h5 class="mb-0">Total Price </h5>
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





                                                                <form:form action="/confirm" method="post"
                                                                    modelAttribute="order" class="mt-4">
                                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                                        value="${_csrf.token}" />
                                                                    <div data-mdb-input-init
                                                                        class="form-outline form-white mb-4">
                                                                        <form:input type="text" id="typeName"
                                                                            class="form-control form-control-lg"
                                                                            siez="17" placeholder=""
                                                                            path="receiverName" />
                                                                        <label class="form-label" for="typeText">Full
                                                                            Name</label>
                                                                    </div>

                                                                    <div class="form-outline form-white mb-4">
                                                                        <form:input type="text" path="receiverPhone"
                                                                            class="form-control form-control-lg"
                                                                            placeholder="+84" />
                                                                        <label class="form-label" for="typeText">Phone
                                                                            Number</label>
                                                                    </div>
                                                                    <div class="form-outline form-white mb-4">
                                                                        <form:input type="text" path="receiverAddress"
                                                                            class="form-control form-control-lg" />
                                                                        <label class="form-label"
                                                                            for="typeText">Address</label>
                                                                    </div>
                                                                    <div class="d-flex justify-content-between">
                                                                        <p class="mb-2">Subtotal</p>
                                                                        <p class="mb-2" id="checkout-price">
                                                                            ${checkoutPrice}$
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
                                                                        <div style="display: none;">
                                                                            <form:input type="number" path="price"
                                                                                value="${checkoutPrice + 10}"
                                                                                class="form-control form-control-lg"
                                                                                siez="17" minlength="19"
                                                                                maxlength="19" />
                                                                        </div>
                                                                    </div>
                                                                    <button data-mdb-button-init data-mdb-ripple-init
                                                                        class="btn btn-info btn-block btn-lg">
                                                                        <div class="d-flex justify-content-between">
                                                                            <span>${checkoutPrice + 10}$</span>
                                                                            <span>Confirm <i
                                                                                    class="fas fa-long-arrow-alt-right ms-2"></i></span>
                                                                        </div>
                                                                    </button>
                                                                </form:form>
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
                        <script
                            src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
                        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
                        <script>
                            document.addEventListener('DOMContentLoaded', function () {
                                const size = document.getElementById("sizelist");

                                if (size && size.value > 0) {
                                    for (let i = 0; i < size.value; i++) {
                                        let shoes_size = document.getElementById("size-shoes-" + i);
                                        shoes_size.textContent = parseFloat(shoes_size.textContent).toString();
                                    }
                                }
                            });
                        </script>
                    </body>

                    </html>