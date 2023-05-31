<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Here Are all the ads!</h1>

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
</div>
</body>
</html>
