<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
    <style>
        #pImage {
            border: black 2px solid;
            border-radius: 50%;
            width: 100px;
            height: 100px;
            background-color: white;
            margin: 10px;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container col-12">
    <h1>Welcome to AdCentral, ${sessionScope.user.username}!</h1>
    <img id="pImage"
         src="https://static.vecteezy.com/system/resources/previews/020/911/740/non_2x/user-profile-icon-profile-avatar-user-icon-male-icon-face-icon-profile-icon-free-png.png">
</div>

<div class="buttons">
    <div class="col-12">
        <form action="/profile" method="post">
            <button type="submit" class="btn btn-primary " name="userId" value= ${sessionScope.user.id}>
                Show
                Your Ads
            </button>
        </form>
        <form action="/ads/create" method="GET">
            <input type="submit" class="btn btn-primary " value="Create Ad">
        </form>
        <form action="/profile/update" method="get">
            <button type="submit" class="btn btn-primary " name="updateButton"
                    value=${sessionScope.user.username}>
                Account Settings
            </button>
        </form>
    </div>
</div>


<div class="col-12">
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
