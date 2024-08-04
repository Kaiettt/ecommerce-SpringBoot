<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
                <!DOCTYPE html>
                <html lang="en">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <title>Create Product</title>
                    <link href="/css/styles.css" rel="stylesheet" />
                    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                    <script>
                        $(document).ready(() => {
                            const avatarFile = $("#avatarFile");
                            avatarFile.change(function (e) {
                                const imgURL = URL.createObjectURL(e.target.files[0]);
                                $("#avatarPreview").attr("src", imgURL);
                                $("#avatarPreview").css({ "display": "block" });
                            });
                        });
                        // let buttonClick = document.getElementById("myButton");
                        // buttonClick.addEventListener('click', () => {
                        //     const inputFile = document.getElementById("avatarFile");
                        //     const text_alert = document.getElementById("text_alert");
                        //     if (inputFile.files.length === 0) {
                        //         text_alert.textContent = "Cần có ảnh sản phẩm";
                        //     }
                        //     else {
                        //         text_alert.textContent = '';
                        //     }
                        // });
                    </script>
                    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                        crossorigin="anonymous"></script>
                </head>

                <body class="sb-nav-fixed">
                    <jsp:include page="../layout/header.jsp" />
                    <div id="layoutSidenav">
                        <jsp:include page="../layout/sidebar.jsp" />
                        <div id="layoutSidenav_content">
                            <main>
                                <div class="container-fluid px-4">
                                    <h1 class="mt-4">Manage Product</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                        <li class="breadcrumb-item"><a href="/admin/product">Product</a></li>
                                        <li class="breadcrumb-item">Create</li>
                                    </ol>
                                    <div class="mt-5">
                                        <div class="row">
                                            <div class="col-md-6 col-12 mx-auto">
                                                <h3>Create a product</h3>
                                                <hr />
                                                <form:form method="post" enctype="multipart/form-data"
                                                    action="/admin/product/create" modelAttribute="newProduct"
                                                    class="row">
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <c:set var="errorName">
                                                            <form:errors path="name" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <label
                                                            class="form-label ${not empty errorName   ?'is-invalid':''}">Name:</label>
                                                        <form:input type="text" class="form-control " path="name" />
                                                        ${errorName}
                                                    </div>
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <c:set var="errorPrice">
                                                            <form:errors path="price" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <label
                                                            class="form-label ${not empty errorPrice   ?'is-invalid':''}">Price:</label>
                                                        <form:input type="text" class="form-control " path="price" />
                                                        ${errorPrice}
                                                    </div>
                                                    <div class="mb-3 col-12">
                                                        <label class="form-label">Detail description:</label>
                                                        <form:input type="text" class="form-control"
                                                            path="detail_description" />
                                                    </div>
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <c:set var="errorDescrip">
                                                            <form:errors path="short_description"
                                                                cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <label
                                                            class="form-label ${not empty errorDescrip   ?'is-invalid':''}">Short
                                                            description:</label>
                                                        <form:input type="text" class="form-control"
                                                            path="short_description" />
                                                        ${errorDescrip}
                                                    </div>
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <c:set var="errorBrand">
                                                            <form:errors path="brand" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <label
                                                            class="form-label ${not empty errorBrand   ?'is-invalid':''}">Brand:</label>
                                                        <form:select class="form-select" path="brand">
                                                            <form:option value="Reebok">Reebok</form:option>
                                                            <form:option value="Mizuno">Mizuno</form:option>
                                                            <form:option value="New Balance">New Balance</form:option>
                                                            <form:option value="Under Armour">Under Armour</form:option>
                                                            <form:option value="Puma">Puma</form:option>
                                                            <form:option value="Adidas">Adidas</form:option>
                                                            <form:option value="Nike">Nike</form:option>
                                                            <form:option value="Lotto">Lotto</form:option>
                                                            <form:option value="Asics">Asics</form:option>
                                                            <form:option value="Umbro">Umbro</form:option>
                                                        </form:select>
                                                        ${errorBrand}
                                                    </div>
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <c:set var="errorMaterial">
                                                            <form:errors path="material" cssClass="invalid-feedback" />
                                                        </c:set>
                                                        <label
                                                            class="form-label ${not empty errorMaterial   ?'is-invalid':''}">Material:</label>
                                                        <form:select class="form-select" path="material">
                                                            <form:option value="Leather">Leather</form:option>
                                                            <form:option value="Synthetic leather">Synthetic leather
                                                            </form:option>
                                                            <form:option value="Synthetic">Synthetic</form:option>
                                                            <form:option value="Mesh">Mesh</form:option>
                                                        </form:select>
                                                        ${errorMaterial}
                                                    </div>
                                                    <div class="mb-3 col-12 col-md-6">
                                                        <label for="avatarFile" class="form-label">Image (Cần có hình
                                                            ảnh sản phẩm )</label>
                                                        <input class="form-control" type="file" id="avatarFile"
                                                            name="anhkietfile" accept=".png, .jpg, .jpeg" />
                                                        <p style="color: red; font-size: 12px;" id="text_alert"></p>
                                                    </div>
                                                    <div class="col-12 mb-3">
                                                        <img style="max-height: 250px; display: none;"
                                                            alt="avatar preview" id="avatarPreview" />
                                                    </div>
                                                    <!-- show img here -->
                                                    <div class="col-12 mb-5">
                                                        <button type="submit" class="btn btn-primary"
                                                            id="myButton">Create</button>
                                                    </div>
                                                </form:form>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </main>
                            <jsp:include page="../layout/footer.jsp" />
                        </div>
                    </div>
                    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                        crossorigin="anonymous"></script>
                    <script src="/js/scripts.js"></script>

                </body>

                </html>