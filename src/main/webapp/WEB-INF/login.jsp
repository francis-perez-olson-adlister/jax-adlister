<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>

    <style>
        body {
            background-image: url("/img/background.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            backdrop-filter: blur(15px); /* Adjust the blur value as needed */
            -webkit-backdrop-filter: blur(15px); /* For Safari support */
        }

    </style>

</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">
    <h1>Please Log In</h1>

    <% String errorCode = request.getParameter("error"); %>
    <% if (errorCode != null) { %>
    <% if (errorCode.equals("1")) { %>
    <div class="alert alert-danger" role="alert">
        Incorrect username or password!
    </div>
    <% } else if (errorCode.equals("2")) { %>
    <div class="alert alert-danger" role="alert">
        Incorrect username or password!
    </div>
    <% } %>
    <% } %>

    <form action="/login" method="POST">
        <div class="form-group">
            <label for="username">Username</label>
            <input id="username" name="username" class="form-control" type="text" required>
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input id="password" name="password" class="form-control" type="password" required>
        </div>
        <input type="submit" class="btn btn-primary btn-block" value="Log In">
    </form>
    <form action="/register" method="GET">
        <input type="submit" class="btn btn-primary btn-block" value="Sign Up">
    </form>
</div>
</body>
</html>
