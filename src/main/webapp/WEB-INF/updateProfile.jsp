<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="partials/head.jsp">
    <jsp:param name="title" value="Register For Our Site!" />
  </jsp:include>
  <style>
    body {
      background-image: url("/img/background.jpg");
      background-size: cover;
      background-repeat: no-repeat;
      backdrop-filter: blur(15px); /* Adjust the blur value as needed */
      -webkit-backdrop-filter: blur(15px); /* For Safari support */
    }  </style>
</head>
<body>
<jsp:include page="partials/navbar.jsp" />
<div class="container">
  <h1>Please fill in your information.</h1>
  <% if (request.getAttribute("error") != null) { %>
  <div class="alert alert-danger" role="alert">
    <%= request.getAttribute("error") %>
  </div>
  <% } %>
  <form action="/profile/update" method="post">
    <div class="form-group">
      <label for="username">Username</label>
      <input id="username" name="username" class="form-control" type="text" value="${user.username}">
    </div>
    <div class="form-group">
      <label for="email">Email</label>
      <input id="email" name="email" class="form-control" type="text" value="${user.email}">
    </div>
    <div class="form-group">
      <label for="password">Password</label>
      <input id="password" name="password" class="form-control" type="password" required>
    </div>
    <div class="form-group">
      <label for="confirm_password">Confirm Password</label>
      <input id="confirm_password" name="confirm_password" class="form-control" type="password" required>
    </div>
    <input type="hidden" name="userId" value="${user.id}">
    <input type="submit" class="btn btn-primary btn-block">
  </form>
  <p id="delete">Tired of us? Delete yo self.</p>
  <form action="/profile/delete" method="get">
    <button class="btn btn-primary" type="submit" name="deleteUser" value="${user.id}">Delete Account</button>
  </form>
</div>
</body>
</html>
