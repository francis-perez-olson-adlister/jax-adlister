<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile"/>
    </jsp:include>
    <style>
        body {
            background-image: url("/img/background.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            backdrop-filter: blur(15px); /* Adjust the blur value as needed */
            -webkit-backdrop-filter: blur(15px); /* For Safari support */
        }

        h1 {
            margin-top: 100px;
            font-size: 50px;
            font-style: oblique;
            /*margin-left: 500px;*/
            display: inline-block;
        }

        #pImage {
            border: black 2px solid;
            border-radius: 50%;
            width: 100px;
            height: 100px;
            background-color: white;
            margin-top: 100px;
            margin-left: 500px;
            display: inline-block;
            vertical-align: middle;
        }

        .container {
            display: flex;
            align-items: center;
        }

        .buttons {
            display: flex;  /* Add this line */
            justify-content: center;  /* Add this line */
            margin-top: 20px;  /* Add this line */
        }

        .buttons form {
            margin-right: 10px;  /* Add this line */
        }

        .card-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            justify-items: center;
        }

        .adCard {
            height: 170px;
            width: 700px;
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
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding-left: 20px;
        }

        .adCard form {
            margin-left: auto;
        }
    </style>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>

<div class="container col-12">
    <h1>Welcome to AdCentral, ${sessionScope.user.username}!</h1>
    <img id="pImage" src="https://static.vecteezy.com/system/resources/previews/020/911/740/non_2x/user-profile-icon-profile-avatar-user-icon-male-icon-face-icon-profile-icon-free-png.png">
</div>

<div class="buttons col-12">
    <div class="col-4">
    <form action="/profile" method="post">
            <button type="submit" class="btn btn-primary" name="userId" value= ${sessionScope.user.id}>
                Show Your Ads
            </button>
        </form>
    </div>
    <div class="col-4">
    <form action="/ads/create" method="GET">
            <input type="submit" class="btn btn-primary" value="Create Ad">
        </form>
    </div>
    <div class="col-4">
    <form action="/profile/update" method="get">
            <button type="submit" class="btn btn-primary" name="updateButton" value=${sessionScope.user.username}>
                Account Settings
            </button>
        </form>
    </div>
</div>

<div class="card-grid">
    <c:forEach var="ad" items="${ads}">
        <div class="adCard">
            <div>
                <h2>${ad.title}</h2>
                <p>${ad.description}</p>
            </div>
            <form action="/edit" method="get">
                <button class=" btn btn-primary" id="editButton" name="editButton" value=${ad.id}>Edit</button>
                <button class=" btn btn-primary" id="deleteButton" name="deleteButton" value=${ad.id}>Delete</button>
            </form>
        </div>
    </c:forEach>
</div>


</body>
</html>
