<%--
  Created by IntelliJ IDEA.
  User: ngocthu6778gmail.com
  Date: 2024/01/01
  Time: 23:28
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.bundle.min.js"></script>
  <title>Account</title>
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
                href="https://github.com/subet/easion"
                target="_blank"
                class="tools-item"
        >
          <i class="fab fa-github"></i>
        </a>
<%--        <a href="#!" class="tools-item">
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
        <div class="d-flex justify-content-between mb-2">
          <!-- search -->
          <form class="form-inline">
            <div class="form-group mx-sm-3">
              <label for="search" class="sr-only">search</label>
              <input
                      type="text"
                      class="form-control"
                      id="search"
                      name="email"
                      placeholder="enter a name for search..."
              />
            </div>
            <button type="submit" class="btn btn-primary">
              Search
            </button>
          </form>
          <!-- sort -->
          <div>
            <label for="direction">Sort: </label>
            <select id="sortBy" name="sortBy" onchange="changeSortBy()">
              <option value="name" ${sortBy.equals("name")?'selected':''}>name</option>
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
                <div class="easion-card-title">Account</div>
              </div>
              <div class="card-body">
                <table class="table table-bordered table-in-card">
                  <thead>
                  <tr class="bg-secondary text-light">
                    <th scope="col">No</th>
                    <th scope="col">Account Id</th>
                    <th scope="col">Name</th>
                    <th scope="col">Email</th>
                    <th scope="col">Password</th>
                    <th scope="col">Create</th>
                    <th scope="col">Permission</th>
                    <th scope="col">Status</th>
                    <th scope="col">Action</th>
                  </tr>
                  </thead>
                  <tbody>
                  <c:set var="stt" value="0" scope="page"/>
                  <c:forEach items="${accountList}" var="account">
                    <c:set var="stt" value="${stt+1}" scope="page"/>
                    <tr>
                      <th scope="row">${stt}</th>
                      <td>${account.accountId}</td>
                      <td>${account.name}</td>
                      <td>${account.email}</td>
                      <td>********</td>
                      <td><fmt:formatDate value="${account.created}" pattern="dd/MM/yyyy"/></td>
                      <td>${account.permission}</td>
                      <td>${account.status?"active":"inactive"}</td>
                      <td>
                        <button
                                type="button"
                                class="border-0"
                                id="model-button"
                        >
                          <a href="<%=request.getContextPath()%>/accountController/findAll?open=${account.accountId}"
                          ><span class="badge badge-pill badge-primary"
                          >Open</span
                          ></a
                          >
                        </button>
                        <a href="<%=request.getContextPath()%>/accountController/findAll?block=${account.accountId}"
                        ><span class="badge badge-pill badge-danger"
                        >Block</span
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
                <a href="<%=request.getContextPath()%>/accountController/findAll?page=${page}"
                   class="text-light">${page}</a>
              </button>
            </c:forEach>
          </div>
          <div class="p-3 mb-2 bg-secondary text-white">page ${page.hashCode()} of ${listPages.size()}</div>
        </div>
      </div>
    </main>
  </div>
</div>
<%--end--%>

<%--js--%>
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
        src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
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

