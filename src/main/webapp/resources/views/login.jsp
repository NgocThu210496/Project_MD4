<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: ngocthu6778gmail.com
  Date: 2024/01/01
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
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
    <title>Home</title>
</head>
<body>
<%--start--%>
<div class="form-screen">
    <a href="index.jsp" class="easion-logo"
    ><i class="fas fa-dice"></i><span>Thu Nguyen</span></a
    >
    <div class="card account-dialog">
        <div class="card-header bg-primary text-white">Please sign in</div>
        <div class="card-body">
            <form action="<%=request.getContextPath()%>/loginController/check" method="post">
                <div class="form-group">
                    <input
                            type="email"
                            class="form-control"
                            id="exampleInputEmail1"
                            name="email"
                            aria-describedby="emailHelp"
                            placeholder="Enter email"
                    />
                </div>
                <div class="form-group">
                    <input
                            type="password"
                            class="form-control"
                            id="exampleInputPassword1"
                            name="password"
                            placeholder="Password"
                    />
                </div>
                <div class="form-group">
                    <div class="custom-control custom-checkbox">
                        <input
                                type="checkbox"
                                class="custom-control-input"
                                id="customCheck1"
                        />
                        <label class="custom-control-label" for="customCheck1"
                        >Remember me</label
                        >
                    </div>
                </div>
                <div class="account-dialog-actions">
                    <button type="submit" class="btn btn-primary">Sign in</button>
                    <a class="account-dialog-link" href="signup.jsp"
                    >Create a new account</a
                    >
                </div>
            </form>
        </div>
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
