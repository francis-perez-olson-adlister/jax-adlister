<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="/WEB-INF/partials/head.jsp">
    <jsp:param name="title" value="Edit Ad" />
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
  <h1>Edit Ad</h1>
  <form action="/ads" method="post">
    <div class="form-group">
      <label for="title">Title</label>
      <input id="title" name="title" class="form-control" type="text" value="${ad.title}">
    </div>
    <div class="form-group">
      <label for="description">Description</label>
      <textarea id="description" name="description" class="form-control" type="text">${ad.description}</textarea>
    </div>
    <input type="hidden" name="id" value="${ad.id}">
    <input type="submit" class="btn btn-block btn-primary">
  </form>
</div>
</body>
</html>
