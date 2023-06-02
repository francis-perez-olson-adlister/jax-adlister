<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome to my site!" />
    </jsp:include>
    <link href="https://fonts.googleapis.com/css?family=Russo+One" rel="stylesheet">
    <style>
        /*body {*/
        /*    background-image: url("/img/background.jpg");*/
        /*    background-size: cover;*/
        /*    background-repeat: no-repeat;*/
        /*    backdrop-filter: blur(15px); !* Adjust the blur value as needed *!*/
        /*    -webkit-backdrop-filter: blur(15px); !* For Safari support *!*/
        /*}*/

        body {
            overflow: hidden; /* Prevent scrolling */
            background-image: url("/img/background.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            backdrop-filter: blur(15px); /* Adjust the blur value as needed */
            -webkit-backdrop-filter: blur(15px); /* For Safari support */
        }

        h1{
            display: flex;
            /*justify-content: center;*/
            margin-top: 100px;
            font-size: 80px;
            margin-bottom: 0;
            padding-bottom: 0;
        }

        svg {
            display: flex;
            font-family: 'Russo One', sans-serif;
            /*position: absolute;*/
            width: 100%; height: 50%;
        }
        svg text {
            /*text-transform: uppercase;*/
            animation: stroke 5s infinite alternate;
            stroke-width: 2;
            stroke: #365fa0;
            font-size: 140px;
        }
        @keyframes stroke {
            0%   {
                fill: rgba(72,138,20,0); stroke: rgba(54,95,160,1);
                stroke-dashoffset: 25%; stroke-dasharray: 0 50%; stroke-width: 2;
            }
            70%  {fill: rgba(72,138,20,0); stroke: rgba(54,95,160,1); }
            80%  {fill: rgba(72,138,20,0); stroke: rgba(54,95,160,1); stroke-width: 3; }
            100% {
                fill: rgba(72,138,204,1); stroke: rgba(54,95,160,0);
                stroke-dashoffset: -25%; stroke-dasharray: 50% 0; stroke-width: 0;
            }
        }
    </style>
</head>
<body>
    <jsp:include page="/WEB-INF/partials/navbar.jsp" />
    <div class="container">
        <h1>Welcome to</h1>
        <svg viewBox="0 0 1320 300">
            <text x="50%" y="50%" dy=".35em" text-anchor="middle">
                AdCentral
            </text>
        </svg>

    </div>

</body>
</html>
