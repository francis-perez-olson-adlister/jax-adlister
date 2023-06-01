<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <jsp:include page="/WEB-INF/partials/head.jsp">
    <jsp:param name="title" value="Edit Ad" />
  </jsp:include>
  <title>${ad.title}</title>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div>
  <img src="https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg" alt="no image found"" />
  <h2>${ad.title}</h2>
  <p>${ad.description}</p>
<%--  <p>Username: ${user.username}</p>--%>
  <p>Email: ${user.email}</p>
</div>
</body>
</html>

