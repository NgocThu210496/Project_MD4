<%--
  Created by IntelliJ IDEA.
  User: ngocthu6778gmail.com
  Date: 2024/01/01
  Time: 23:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page import="java.time.LocalDate" %>

<%
  // Lấy ngày hiện tại
  LocalDate currentDate = LocalDate.now();

  // Lấy ngày trong tháng
  int dayOfMonth = currentDate.getDayOfMonth();
  int monthOfYear = currentDate.getMonthValue();
  int currentDateYear = currentDate.getYear();
%>
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
  <title>Dashboard</title>
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
      ><i class="fas fa-user"></i><span>Admin</span></a
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
                href="https://github.com/NgocThu210496/Project_MD4.git"
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
            <a class="dropdown-item" href="http://localhost:8081/loginController/findAll">Logout</a>
          </div>
        </div>
      </div>
    </header>
    <!-- main -->
    <main class="dash-content">
      <div class="container-fluid">
        <div class="row dash-row">
          <!-- Account -->
          <div class="col-xl-6">
            <div class="stats stats-primary"  style="background-color: #FF8247; border-radius: 30px" >
              <h3 class="stats-title">Account</h3>
              <div class="stats-content">
                <div class="stats-icon">
                  <i class="fas fa-user"></i>
                </div>

                <div class="stats-data">
                  <div class="stats-number">Total: ${accountList.size()}</div>
                  <div class="stats-number">Active: ${activeCount.size()}</div>
                  <div class="stats-number">Inactive: ${inActiveCount.size()}</div>
                  <div class="stats-change">
                    <span class="stats-percentage">+10%</span>
                    <span class="stats-timeframe">per month</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- Product -->
          <div class="col-xl-6">
            <div class="stats stats-success" style="border-radius: 30px; background-color: #20c997">
              <h3 class="stats-title">Product</h3>
              <div class="stats-content">
                <div class="stats-icon">
                  <i class="fas fa-cart-arrow-down"></i>
                </div>
                <div class="stats-data">
                  <div class="stats-number">Total: ${productList.size()}</div>
                  <div class="stats-number">Active: ${activeProduct.size()}</div>
                  <div class="stats-number">Inactive: ${inActiveProduct.size()}</div>
                  <div class="stats-change">
                    <span class="stats-percentage">+17.5%</span>
                    <span class="stats-timeframe">per month</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- Revenue -->
          <div class="col-xl-6">
            <div class="stats stats-secondary" style="background-color: #6699FF;border-radius: 30px">
              <h3 class="stats-title">Revenue</h3>
              <div class="stats-content">
                <div class="stats-icon">
                  <i class="fas fa-coins"></i>
                </div>
                <div class="stats-data">
                  <div class="stats-number">&nbsp;</div>
                  <div class="stats-number">&nbsp;</div>
                  <div class="stats-number">Day(<%= dayOfMonth %>): ${revenueDay}$</div>
                  <div class="stats-number">Month(<%=monthOfYear%>): ${revenueMonth}$</div>
                  <div class="stats-number">Year(<%=currentDateYear%>): ${revenueYear}$</div>
                  <div class="stats-change">
                    <span class="stats-percentage">+17.5%</span>
                    <span class="stats-timeframe">per month</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- order -->
          <div class="col-xl-6">
            <div class="stats stats-light" style="border-radius: 30px;background-color: #fd9c9b; color: #fff">
              <h3 class="stats-title">Order</h3>
              <div class="stats-content">
                <div class="stats-icon">
                  <i class="fas fa-phone"></i>
                </div>
                <div class="stats-data">
                  <div class="stats-number d-flex">Cancelled: ${cancel.get()}</div>
                  <div class="stats-number">Waiting: ${waiting.get()}</div>
                  <div class="stats-number">Approved: ${approve.get()}</div>
                  <div class="stats-number">Delivering: ${shipping.get()}</div>
                  <div class="stats-number">Received: ${received.get()}</div>
                  <div class="stats-change">
                    <span class="stats-percentage">Total: </span>
                    <span class="stats-timeframe">${orderList.size()}</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
  </div>
</div>
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
<script src="<%=request.getContextPath()%>/resources/js/script.js"></script>
</body>
</html>
