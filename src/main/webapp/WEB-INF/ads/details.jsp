<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="/WEB-INF/partials/head.jsp">
    <jsp:param name="title" value="Edit Ad" />
  </jsp:include>
  <title>${ad.title}</title>
  <style>
    body {
      background-image: url("/img/background.jpg");
      background-size: cover;
      background-repeat: no-repeat;
      backdrop-filter: blur(15px); /* Adjust the blur value as needed */
      -webkit-backdrop-filter: blur(15px); /* For Safari support */
    }

    .container {
      display: flex;
      margin-top: 130px;
    }

    img {
      width: 700px;
      height: 500px;
      flex: 1;
      border-radius: 1rem;
    }

    .details {
      height: 500px;
      width: 500px;
      color: black;
      border-radius: 1rem;
      border: 1px solid transparent;
      backdrop-filter: blur(1rem);
      box-shadow: 1.3rem 1.3rem 1.3rem rgba(0, 0, 0, 0.5);
      border-top-color: rgba(225, 225, 225, 0.5);
      border-left-color: rgba(225, 225, 225, 0.5);
      border-bottom-color: rgba(225, 225, 225, 0.1);
      border-right-color: rgba(225, 225, 225, 0.1);
      background: linear-gradient(to right bottom, rgba(225, 225, 225, 0.5), rgba(225, 225, 225, 0.3));
      margin-left: 30px;
    }

    #title {
      text-align: center;
    }

    #deets {
      margin-left: 10px;
      margin-top: 50px;
    }

    #email {
    margin-left: 10px;
    /*  margin-left: 180px;*/
    /*  margin-top: 320px;*/
    }
  </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">
  <div class="image">
    <img src="https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg" alt="no image found" />
  </div>
  <div class="details">
    <h2 id="title">${ad.title}</h2>
    <p id="deets">${ad.description}</p>
    <%--  <p>Username: ${user.username}</p>--%>
    <p id="email">Email: ${user.email}</p>
  </div>
</div>
</body>
</html>
