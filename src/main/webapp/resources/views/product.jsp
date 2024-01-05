<%--
  Created by IntelliJ IDEA.
  User: ngocthu6778gmail.com
  Date: 2024/01/02
  Time: 11:21
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

  <title>Product</title>
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
        <a href="#!" class="tools-item">
          <i class="fas fa-bell"></i>
          <i class="tools-item-count">4</i>
        </a>
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
            <a class="dropdown-item" href="login.html">Logout</a>
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
                    <h4 class="modal-title fs-3" id="exampleModalLabel">
                      Create New
                    </h4>
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
                  <form class="m-3"
                        action="<%=request.getContextPath()%>/productController/create&Update"
                        method="post" enctype="multipart/form-data">
                    <%--group--%>
                    <div class="form-group row">
                      <div>
                        <label for="productId" class="col-sm-6 col-form-label"
                        >ProductId:</label
                        >
                        <div class="col-sm-12">
                          <input
                                  type="text"
                                  class="form-control"
                                  id="productId"
                                  name="productId"
                                  placeholder="Product Id"
                          />
                        </div>
                      </div>
                      <div>
                        <label
                                for="productName"
                                class="col-sm-12 col-form-label"
                        >Product Name:</label
                        >
                        <div class="col-sm-12">
                          <input
                                  type="text"
                                  class="form-control"
                                  id="productName"
                                  name="productName"
                                  placeholder="Product Name"
                          />
                        </div>
                      </div>
                    </div>
                    <%--group--%>
                    <div class="form-group row">
                      <div>
                        <label for="price" class="col-sm-6 col-form-label"
                        >Price:</label
                        >
                        <div class="col-sm-12">
                          <input
                                  type="number"
                                  class="form-control"
                                  id="price"
                                  name="price"
                                  placeholder="Price"
                          />
                        </div>
                      </div>
                      <div>
                        <label for="unit" class="col-sm-6 col-form-label"
                        >Unit:</label
                        >
                        <div class="col-sm-12">
                          <input
                                  type="text"
                                  class="form-control"
                                  id="unit"
                                  name="unit"
                                  placeholder="Unit"
                          />
                        </div>
                      </div>
                    </div>
                    <%--group--%>
                    <div class="form-group row">
                      <div>
                        <label for="title" class="col-sm-6 col-form-label"
                        >Title:</label
                        >
                        <div class="col-sm-12">
                          <input
                                  type="text"
                                  class="form-control"
                                  id="title"
                                  name="title"
                                  placeholder="Title"
                          />
                        </div>
                      </div>
                      <div>
                        <label for="created" class="col-sm-6 col-form-label">Date: </label>
                        <div class="col-sm-12">
                          <input type="date" name="created" id="created"
                                 class="form-control"/>
                        </div>
                      </div>
                    </div>
                    <%--group--%>
                    <div class="form-group row d-flex d-flex flex-nowrap">
                      <div>
                        <label for="image" class="col-sm-6 col-form-label"
                        >Image Main:</label
                        >
                        <div class="col-sm-12">
                          <input
                                  type="file"
                                  class="form-control"
                                  id="image"
                                  name="productImage"
                          />
                        </div>
                      </div>
                      <div>
                        <label for="catalog"
                               class="col-sm-6 col-form-label">Catalog: </label>
                        <select id="catalog" name="catalog.catalogId" class="col-sm-10">
                          <c:forEach items="${categoriesList}" var="catalog">
                            <option value="${catalog.catalogId}">${catalog.catalogName}</option>
                          </c:forEach>
                        </select>
                      </div>
                    </div>
                    <div>
                      <label for="images1" class="col-sm-6 col-form-label"
                      >Images sub:</label
                      >
                      <div class="col-sm-12">
                        <input
                                type="file"
                                class="form-control"
                                id="images1"
                                name="subImages"
                                multiple
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
                                    id="active"
                                    name="status"
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
                    <div class="form-group row">
                      <label
                              for="description"
                              class="col-sm-6 col-form-label"
                      >Description:</label
                      >
                      <div class="col-sm-12">
                        <input
                                class="form-control"
                                id="description"
                                name="description"
                                placeholder="input in here..."
                        />
                      </div>
                    </div>
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
                      <button type="submit" class="btn btn-primary mb-1">
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
          <form class="form-inline" action="<%=request.getContextPath()%>/productController/findAll"
                method="get">
            <div class="form-group mx-sm-3 mb-2">
              <label for="search" class="sr-only">search</label>
              <input
                      type="text"
                      class="form-control"
                      id="search"
                      name="productName"
                      value="${productName}"
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
            <select id="sortBy" name="sortBy" onchange="changeSortBy()">
              <option value="productId" ${sortBy.equals("productId")?'selected':''}>Product Id</option>
              <option value="productName" ${sortBy.equals("productName")?'selected':''}>Product Name
              </option>
              <option value="price" ${sortBy.equals("price")?'selected':''}>Price</option>
              <option value="created" ${sortBy.equals("created")?'selected':''}>Date Created</option>
            </select>
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
                <div class="easion-card-title">Product</div>
              </div>
              <div class="card-body">
                <table class="table table-bordered table-in-card">
                  <thead>
                  <tr class="bg-secondary text-white">
                    <th scope="col">#</th>
                    <th scope="col">Product Id</th>
                    <th scope="col">Product Name</th>
                    <th scope="col">Price</th>
                    <th scope="col">Title</th>
                    <th scope="col">Created</th>
                    <th scope="col">Description</th>
                    <th scope="col">Catalog Name</th>
                    <th scope="col">image</th>
                    <th scope="col">unit</th>
                    <th scope="col">Status</th>
                    <th scope="col">Action</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:set var="stt" value="0" scope="page"/>
                  <c:forEach items="${productsList}" var="product">
                    <c:set var="stt" value="${stt+1}" scope="page"/>
                    <tr>
                      <th scope="row">${stt}</th>
                      <td>${product.productId}</td>
                      <td>${product.productName}</td>
                      <td>${product.price}</td>
                      <td>${product.title}</td>
                      <td><fmt:formatDate value="${product.created}" pattern="dd/MM/yyyy"/></td>
                      <td>${product.description}</td>
                      <td>${product.catalog.catalogName}</td>
                      <td><img src="${product.image}" alt="${product.productName}" width="50"
                               height="50"/></td>
                      <td>${product.unit}</td>
                      <td>${product.status?"active":"inactive"}</td>
                      <td>
                        <button
                                type="button"
                                class="border-0"
                                id="model-button"
                        >
                          <a href="<%=request.getContextPath()%>/productController/findAll?id=${product.productId}"
                          ><span class="badge badge-pill badge-warning"
                          >Update</span
                          ></a
                          >
                        </button>
                        <a href="<%=request.getContextPath()%>/productController/delete?id=${product.productId}"
                        ><span class="badge badge-pill badge-danger" style="margin-right: 5px"
                        >Delete</span
                        ></a
                        ><a onclick="showDetail()" id="showDetailHover"
                            href="<%=request.getContextPath()%>/productController/findAll?detail=${product.productId}"
                      ><span class="badge badge-pill badge-success"
                      >Detail</span
                      ></a
                      >

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
              <button type="button" class="btn btn-secondary">
                <a href="<%=request.getContextPath()%>/productController/findAll?page=${page}"
                   class="text-light">${page}</a>
              </button>
            </c:forEach>
          </div>
          <div class="p-3 mb-2 bg-secondary text-white">page ${page.hashCode()} of ${listPages.size()}</div>
        </div>
      </div>
      <%--modal update--%>
      <div class="modal" tabindex="-1" style="display: ${productUpdate==null?"none":"block"}" id="closeBtnUpdate">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">Update</h4>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"
                      onclick="closeUpdate()">X
              </button>
            </div>
            <div class="modal-body">
              <!-- form -->
              <form class="m-3" action="<%=request.getContextPath()%>/productController/create&Update"
                    method="post" enctype="multipart/form-data">
                <%--group--%>
                <div class="form-group row d-flex flex-nowrap">
                  <div>
                    <label for="productId1" class="col-sm-6 col-form-label"
                    >Product id:</label
                    >
                    <div class="col-sm-12">
                      <input
                              type="text"
                              class="form-control"
                              id="productId1"
                              name="productId"
                              value="${productUpdate.productId}"
                              readonly
                              placeholder="Product Id"
                      />
                    </div>
                  </div>
                  <div>
                    <label for="productName1" class="col-sm-12 col-form-label"
                    >Product Name:</label
                    >
                    <div class="col-sm-12">
                      <input
                              type="text"
                              class="form-control"
                              id="productName1"
                              name="productName"
                              value="${productUpdate.productName}"
                              placeholder="Product Name"
                      />
                    </div>
                  </div>
                </div>
                <%--group--%>
                <div class="form-group row d-flex flex-nowrap">
                  <div>
                    <label for="price1" class="col-sm-6 col-form-label"
                    >Price:</label
                    >
                    <div class="col-sm-12">
                      <input
                              type="number"
                              class="form-control"
                              id="price1"
                              name="price"
                              value="${productUpdate.price}"
                              placeholder="Price"
                      />
                    </div>
                  </div>
                  <div>
                    <label for="unit1" class="col-sm-6 col-form-label"
                    >Unit:</label
                    >
                    <div class="col-sm-12">
                      <input
                              type="text"
                              class="form-control"
                              id="unit1"
                              name="unit"
                              value="${productUpdate.unit}"
                              placeholder="Unit"
                      />
                    </div>
                  </div>
                </div>
                <div class="form-group row d-flex flex-nowrap">

                  <div>
                    <label for="title1" class="col-sm-6 col-form-label"
                    >Title:</label
                    >
                    <div class="col-sm-12">
                      <input
                              type="text"
                              class="form-control"
                              id="title1"
                              name="title"
                              value="${productUpdate.title}"
                              placeholder="Title"
                      />
                    </div>
                  </div>
                  <div>
                    <label for="created1" class="col-sm-6 col-form-label">Date: </label>
                    <div class="col-sm-12">
                      <input type="date" name="created" id="created1"
                             class="form-control"/>
                    </div>
                  </div>
                </div>

                <%--group--%>
                <div class="form-group row d-flex flex-nowrap">
                  <div>
                    <label for="image1" class="col-sm-6 col-form-label"
                    >Image:</label
                    >
                    <div class="col-sm-10">
                      <input
                              type="file"
                              class="form-control"
                              id="image1"
                              name="productImage"
                              placeholder="${productUpdate.image}"
                      />
                    </div>
                  </div>
                  <div>

                    <label for="catalog1" class="col-sm-6 col-form-label">Catalog: </label>
                    <select id="catalog1" name="catalog.catalogId" class="col-sm-10">
                      <c:forEach items="${categoriesList}" var="catalog">
                        <option value="${catalog.catalogId}">${catalog.catalogName}</option>
                      </c:forEach>
                    </select>
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
                                name="status"
                                value="true"
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
                                name="status"
                                value="false"
                                class="custom-control-input"
                        />
                        <label class="custom-control-label" for="inactive1"
                        >InActive</label
                        >
                      </div>
                    </div>
                  </div>
                  <div class="form-group row">
                    <label for="description1" class="col-sm-6 col-form-label"
                    >Description:</label
                    >
                    <div class="col-sm-12">
                      <input
                              class="form-control"
                              id="description1"
                              name="description"
                              value="${productUpdate.description}"
                      />
                    </div>
                  </div>
                </fieldset>
                <div class="form-group row d-flex justify-content-end mx-2">
                  <button
                          type="button"
                          class="btn btn-secondary mb-1 mx-3"
                          data-bs-dismiss="modal"
                          aria-label="Close"
                          onclick="closeUpdate()"
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
      <%-- modal detail start--%>
      <!-- Large modal -->
      <div class="container mt-5 mb-5 position-absolute" id="detailModal"
           style="top: 40px;">
        <div class="row d-flex justify-content-center">
          <div class="col-md-12">
            <div class="card">
              <div class="row">
                <div class="col-md-6">
                  <div class="images p-3">
                    <div class="text-center p-4"><img id="main-image"
                                                      src="${productDetail.image}"
                                                      width="250"/></div>
                    <div class="thumbnail text-center">
                      <img onclick="change_image(this)"
                           src="${productDetail.image}"
                           width="70">
                      <img onclick="change_image(this)"
                           src="${productDetail.image}"
                           width="70">
                      <img onclick="change_image(this)"
                           src="${productDetail.image}"
                           width="70">
                    </div>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="product p-4">
                    <div class="d-flex justify-content-between align-items-center">
                      <i class="fa fa-shopping-cart text-muted"></i>
                      <div class="d-flex align-items-center">
                        <a onclick="closeDetail()"
                        ><span class="badge badge-pill badge-dark"
                        >close</span
                        ></a
                        ></div>
                    </div>
                    <div class="mt-4 mb-3"><span
                            class="text-uppercase text-muted brand">Product</span>
                      <h5 class="text-uppercase">${productDetail.productName}</h5>
                      <div class="price d-flex flex-row align-items-center"><span
                              class="act-price">$${productDetail.price}</span>
                        <div class="ml-2"><small class="dis-price">$59</small>
                          <span>40% OFF</span></div>
                      </div>
                    </div>
                    <p class="about">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do
                      eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim
                      veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea
                      commodo consequat. </p>
                    <div class="sizes mt-5">
                      <h6 class="text-uppercase">Size</h6> <label class="radio"> <input
                            type="radio" name="size" value="S" checked> <span>S</span> </label>
                      <label class="radio"> <input type="radio" name="size" value="M">
                        <span>M</span> </label> <label class="radio"> <input type="radio"
                                                                             name="size"
                                                                             value="L">
                      <span>L</span> </label> <label class="radio"> <input type="radio"
                                                                           name="size" value="XL">
                      <span>XL</span> </label> <label class="radio"> <input type="radio"
                                                                            name="size"
                                                                            value="XXL">
                      <span>XXL</span> </label>
                    </div>
                    <div class="cart mt-4 align-items-center">
                      <button class="btn btn-danger text-uppercase mr-2 px-4">Add to cart</button>
                      <i class="fa fa-heart text-muted"></i> <i
                            class="fa fa-share-alt text-muted"></i></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <%-- modal detail end--%>
    </main>
  </div>
</div>
<%--end--%>

<%--js--%>
<script>
  function changeSortBy() {
    let sortBy = document.getElementById("sortBy").value;
    //Gọi controller
    window.location = "findAll?sortBy=" + sortBy;
  }

  function changeDirection() {
    let direction = document.getElementById("direction").value;
    window.location = "findAll?direction=" + direction;
  }

  function closeUpdate() {
    let closeBtnUpdate = document.getElementById("closeBtnUpdate");
    closeBtnUpdate.style.display = "none";
  }

  function showDetail() {
    console.log("showDetail is called");
    document.getElementById("detailModal").style.visibility = "visible";
  }

  function closeDetail() {
    console.log("closeDetail is called");
    document.getElementById("detailModal").style.visibility = "hidden";
  }
</script>

<script>

  function change_image(image) {

    var container = document.getElementById("main-image");

    container.src = image.src;
  }

  document.addEventListener("DOMContentLoaded", function (event) {


  });

</script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>


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
