<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />

    <div class="container">
        <h1>Welcome, ${sessionScope.user.username}!</h1>
    </div>
    <c:forEach var="ad" items="${ads}">
        <div class="adCard col-md-6">
            <div>
                <h2>${ad.title}</h2>
                <p>${ad.description}</p>
            </div>
            <form action="/edit" method="get">
                <button class="edit" id="editButton" name="editButton" value=${ad.id}>Edit</button>
                <button class="delete" id="deleteButton" name="deleteButton" value=${ad.id}>Delete</button>
            </form>
        </div>
    </c:forEach>
    <form action="/ads/create" method="GET">
        <input type="submit" class="btn btn-primary btn-block" value="Create Ad">
    </form>
    <form action="/profile/update" method="get">
        <button type="submit" class="btn btn-primary btn-block" name = "updateButton"value=${sessionScope.user.username}>Account Settings</button>
    </form>

</body>
</html>
