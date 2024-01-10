<%--
  Created by IntelliJ IDEA.
  User: ngocthu6778gmail.com
  Date: 2024/01/02
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href="<%=request.getContextPath()%>/resources/css/style.css" rel="stylesheet"/>
    <link
            rel="stylesheet"
            href="https://use.fontawesome.com/releases/v5.4.1/css/all.css"
            integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz"
            crossorigin="anonymous"
    />
    <link
            href="https://fonts.googleapis.com/css?family=Nunito:400,600|Open+Sans:400,600,700"
            rel="stylesheet"
    />
    <title>Categories</title>
</head>
<body>
<%--start--%>
<div class="dash">
    <div class="dash-nav dash-nav-dark">
        <header>
            <a href="#!" class="menu-toggle">
                <i class="fas fa-bars"></i>
            </a>
            <a href="<%=request.getContextPath()%>/dashboardController/findAll" class="easion-logo"
            ><i class="fas fa-dice"></i><span>Admin</span></a
            >
        </header>
        <nav class="dash-nav-list">
            <a href="<%=request.getContextPath()%>/dashboardController/findAll" class="dash-nav-item">
                <i class="fas fa-home"></i> Dashboard
            </a>
            <a href="<%=request.getContextPath()%>/categoriesController/findAll" class="dash-nav-item">
                <i class="fas fa-clipboard-list"></i> Categories
            </a>
            <a href="<%=request.getContextPath()%>/productController/findAll" class="dash-nav-item">
                <i class="fas fa-list"></i> Product
            </a>
            <a href="<%=request.getContextPath()%>/pictureController/findAll" class="dash-nav-item">
                <i class="fas fa-camera"></i> Picture
            </a>
            <a href="<%=request.getContextPath()%>/accountController/findAll" class="dash-nav-item">
                <i class="fas fa-user"></i> Account </a
            ><a href="<%=request.getContextPath()%>/orderController/findAll" class="dash-nav-item">
            <i class="fas fa-handshake"></i> Order </a
        ><a href="<%=request.getContextPath()%>/billController/findAll" class="dash-nav-item">
            <i class="fas fa-money-bill"></i> Bill
        </a>
        </nav>
    </div>
    <div class="dash-app">
        <header class="dash-toolbar">
            <a href="#!" class="menu-toggle">
                <i class="fas fa-bars"></i>
            </a>
            <a href="#!" class="searchbox-toggle">
                <i class="fas fa-search"></i>
            </a>
            <form class="searchbox" action="#!">
                <a href="#!" class="searchbox-toggle">
                    <i class="fas fa-arrow-left"></i>
                </a>
                <button type="submit" class="searchbox-submit">
                    <i class="fas fa-search"></i>
                </button>
                <input
                        type="text"
                        class="searchbox-input"
                        placeholder="type to search"
                />
            </form>
            <div class="tools">
                <a
                        href="#"
                        target="_blank"
                        class="tools-item"
                >
                    <i class="fab fa-github"></i>
                </a>
<%--                <a href="#!" class="tools-item">
                    <i class="fas fa-bell"></i>
                    <i class="tools-item-count">4</i>
                </a>--%>
                <div class="dropdown tools-item">
                    <a
                            href="#"
                            class=""
                            id="dropdownMenu1"
                            data-toggle="dropdown"
                            aria-haspopup="true"
                            aria-expanded="false"
                    >
                        <i class="fas fa-user"></i>
                    </a>
                    <div
                            class="dropdown-menu dropdown-menu-right"
                            aria-labelledby="dropdownMenu1"
                    >
                        <a class="dropdown-item" href="#!">Profile</a>
                        <a class="dropdown-item" href="login.jsp">Logout</a>
                    </div>
                </div>
            </div>
        </header>
        <!-- main -->
        <main class="dash-content">
            <div class="container-fluid">
                <!-- search, sort, add new -->
                <div class="d-flex justify-content-between">
                    <!-- add new -->
                    <div>
                        <div
                                class="modal fade"
                                id="exampleModal"
                                tabindex="-1"
                                aria-labelledby="exampleModalLabel"
                                aria-hidden="true"
                        >
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-3" id="exampleModalLabel">
                                            Create New
                                        </h1>
                                        <button
                                                type="button"
                                                class="btn-close"
                                                data-bs-dismiss="modal"
                                                aria-label="Close"
                                        >
                                            <i class="fas fa-times"></i>
                                        </button>
                                    </div>
                                    <!-- form -->
                                    <form class="m-3" action="<%=request.getContextPath()%>/categoriesController/create&Update" method="post">
                                        <div class="form-group row">
                                            <label for="catalogId1" class="col-sm-6 col-form-label"
                                            >Catalog Id:</label
                                            >
                                            <div class="col-sm-12">
                                                <input
                                                        type="text"
                                                        class="form-control"
                                                        id="catalogId1"
                                                        name="catalogId"
                                                        placeholder="Catalog Id"
                                                />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label
                                                    for="catalogName1"
                                                    class="col-sm-6 col-form-label"
                                            >Catalog Name:</label
                                            >
                                            <div class="col-sm-12">
                                                <input
                                                        type="text"
                                                        class="form-control"
                                                        id="catalogName1"
                                                        name="catalogName"
                                                        placeholder="Catalog Name"
                                                />
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label
                                                    for="description1"
                                                    class="col-sm-6 col-form-label"
                                            >Description:</label
                                            >
                                            <div class="col-sm-12">
                                                <input
                                                        type="text"
                                                        class="form-control"
                                                        id="description1"
                                                        name="description"
                                                        placeholder="Description"
                                                />
                                            </div>
                                        </div>

                                        <fieldset class="form-group">
                                            <div class="row">
                                                <legend class="col-form-label col-sm-3 pt-0">
                                                    Status:
                                                </legend>
                                                <div class="col-sm-9">
                                                    <div class="custom-control custom-radio">
                                                        <input
                                                                type="radio"
                                                                value="true"
                                                                name="status"
                                                                id="active"
                                                                class="custom-control-input"
                                                                checked
                                                        />
                                                        <label class="custom-control-label" for="active"
                                                        >Active</label
                                                        >
                                                    </div>
                                                    <div class="custom-control custom-radio">
                                                        <input
                                                                type="radio"
                                                                value="false"
                                                                id="inactive"
                                                                name="status"
                                                                class="custom-control-input"
                                                        />
                                                        <label
                                                                class="custom-control-label"
                                                                for="inactive"
                                                        >InActive</label
                                                        >
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <div
                                                class="form-group row d-flex justify-content-end mx-2"
                                        >
                                            <button
                                                    type="button"
                                                    class="btn btn-secondary mb-1 mx-3"
                                                    data-bs-dismiss="modal"
                                                    aria-label="Close"
                                            >
                                                Cancel
                                            </button>
                                            <button type="submit" class="btn btn-primary mb-1" id="addBtn">
                                                Create
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <button
                                type="submit"
                                class="btn btn-primary"
                                data-bs-toggle="modal"
                                data-bs-target="#exampleModal"
                                data-bs-whatever="@fat"
                        >
                            Add New
                        </button>
                    </div>
                    <!-- search -->
                    <form class="form-inline" action="<%=request.getContextPath()%>/categoriesController/findAll" method="get">
                        <div class="form-group mx-sm-3 mb-2">
                            <label for="search" class="sr-only">search</label>
                            <input
                                    type="text"
                                    class="form-control"
                                    id="search"
                                    name="catalogName"
                                    value="${catalogName}"
                                    placeholder="Input a name for search..."
                            />
                        </div>
                        <button type="submit" class="btn btn-primary mb-2">
                            Search
                        </button>
                    </form>
                    <!-- sort -->
                    <div>
                        <label for="direction">Sort: </label>
                        <select id="direction" name="direction" onchange="changeDirection()">
                            <option value="ASC" ${direction.equals("ASC")?'selected':''}>Sort Name ASC</option>
                            <option value="DESC" ${direction.equals("DESC")?'selected':''}>Sort Name DSC</option>
                        </select>
                    </div>
                </div>
                <!-- table -->
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card easion-card">
                            <div class="card-header">
                                <div class="easion-card-icon">
                                    <i class="fas fa-table"></i>
                                </div>
                                <div class="easion-card-title">Categories</div>
                            </div>
                            <div class="card-body">
                                <table class="table table-bordered table-in-card">
                                    <thead>
                                    <tr  class="bg-secondary text-light">
                                        <th scope="col">No</th>
                                        <th scope="col">Catalog Id</th>
                                        <th scope="col">Catalog Name</th>
                                        <th scope="col">Description</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Action</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:set var="stt" value="0" scope="page"/>
                                    <c:forEach items="${categoriesList}" var="catalog">
                                        <c:set var="stt" value="${stt+1}" scope="page"/>
                                        <tr>
                                            <th scope="row">${stt}</th>
                                            <td>${catalog.catalogId}</td>
                                            <td>${catalog.catalogName}</td>
                                            <td>${catalog.description}</td>
                                            <td>${catalog.status?"active":"inactive"}</td>
                                            <td>

                                                <button
                                                        type="button"
                                                        class="border-0 model-button bg-warning"
                                                    <%--id="model-button"--%>
                                                >
                                                    <a href="<%=request.getContextPath()%>/categoriesController/findAll?id=${catalog.catalogId}"
                                                    > Update</a
                                                    >
                                                </button>

                                               <%-- <a href="<%=request.getContextPath()%>/categoriesController/delete?id=${catalog.catalogId}"
                                                ><span class="badge badge-pill badge-danger"
                                                >Delete</span
                                                ></a
                                                >--%>
                                                <button
                                                        type="button"
                                                        class="border-0 model-button bg-danger"
                                                    <%--id="model-button"--%>
                                                >
                                                    <a href="<%=request.getContextPath()%>/categoriesController/delete?id=${catalog.catalogId}"
                                                    ><%--<span class="badge badge-pill badge-danger" style="margin-right: 5px"
                        >Delete</span--%>
                                                        Status</a
                                                    ></button>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div>
                <!-- pagination -->
                <div class="d-flex justify-content-between">
                    <div
                            class="btn-group ml-2 mb-1"
                            role="group"
                            aria-label="First group"
                    >
                        <c:forEach items="${listPages}" var="page">
                            <button type="button" class="btn btn-secondary" id="addAction" >
                                <a href="<%=request.getContextPath()%>/categoriesController/findAll?page=${page}" onclick="paginationActive()" class="text-light">${page}</a>
                            </button>
                        </c:forEach>
                    </div>
                    <div class="p-3 mb-2 bg-secondary text-white">page ${page.hashCode()} of ${listPages.size()}</div>
                </div>
            </div>
            <%--modal update--%>
            <div class="modal" tabindex="-1" style="display: ${catalogUpdate==null?"none":"block"}">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title">Update</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form class="m-3" action="<%=request.getContextPath()%>/categoriesController/create&Update" method="post">
                                <div class="form-group row">
                                    <label for="catalogId" class="col-sm-6 col-form-label"
                                    >Catalog Id:</label
                                    >
                                    <div class="col-sm-12">
                                        <input
                                                type="text"
                                                class="form-control"
                                                id="catalogId"
                                                name="catalogId"
                                                value="${catalogUpdate.catalogId}"
                                                readonly
                                                placeholder="Catalog Id"
                                        />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="catalogName" class="col-sm-6 col-form-label"
                                    >Catalog Name:</label
                                    >
                                    <div class="col-sm-12">
                                        <input
                                                type="text"
                                                class="form-control"
                                                id="catalogName"
                                                name="catalogName"
                                                value="${catalogUpdate.catalogName}"
                                                placeholder="Catalog Name"
                                        />
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="description" class="col-sm-6 col-form-label"
                                    >Description:</label
                                    >
                                    <div class="col-sm-12">
                                        <input
                                                type="text"
                                                class="form-control"
                                                id="description"
                                                name="description"
                                                value="${catalogUpdate.description}"
                                                placeholder="Description"
                                        />
                                    </div>
                                </div>

                                <fieldset class="form-group">
                                    <div class="row">
                                        <legend class="col-form-label col-sm-3 pt-0">
                                            Status:
                                        </legend>
                                        <div class="col-sm-9">
                                            <div class="custom-control custom-radio">
                                                <input
                                                        type="radio"
                                                        id="active1"
                                                        value="true"
                                                        name="status"
                                                        class="custom-control-input"
                                                        checked
                                                />
                                                <label class="custom-control-label" for="active1"
                                                >Active</label
                                                >
                                            </div>
                                            <div class="custom-control custom-radio">
                                                <input
                                                        type="radio"
                                                        id="inactive1"
                                                        value="false"
                                                        name="status"
                                                        class="custom-control-input"
                                                />
                                                <label class="custom-control-label" for="inactive1"
                                                >InActive</label
                                                >
                                            </div>
                                        </div>
                                    </div>
                                </fieldset>
                                <div class="form-group row d-flex justify-content-end mx-2">
                                    <button
                                            type="submit"
                                            class="btn btn-secondary mb-1 mx-3"
                                            data-bs-dismiss="modal"
                                            aria-label="Close"
                                    >
                                        Cancel
                                    </button>
                                    <button type="submit" class="btn btn-primary mb-1">
                                        Update
                                    </button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
            <%--   modal update end --%>

        </main>
    </div>
</div>
<%--end--%>
<script>
    function changeSortBy(){
        let sortBy = document.getElementById("sortBy").value;
        /*Gọi controller*/
        window.location="findAll?sortBy="+sortBy;
    }
    function changeDirection(){
        let direction = document.getElementById("direction").value;
        window.location="findAll?direction="+direction;
    }
    function paginationActive() {
        let actionBtn = document.getElementById("addAction");
        actionBtn.classList.add("active");
    }
</script>

<script
        src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"
></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"
></script>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
        crossorigin="anonymous"
></script>
<script src="<%=request.getContextPath()%>/resources/js/script.js"></script>
</body>
</html>
