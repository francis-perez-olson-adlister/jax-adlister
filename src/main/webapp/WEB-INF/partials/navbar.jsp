<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/ads" style="font-size: x-large;">AdCentral</a>
        </div>
        <ul class="nav navbar-nav navbar-right" style="font-size: large">
            <%-- Display login button if user is not logged in --%>
            <% if (session.getAttribute("user") == null) { %>
            <li><a href="/login">Login/Register</a></li>
            <% } else { %>
            <%-- Display profile button if user is logged in --%>
            <li><a href="/profile">Profile</a></li>
            <li><a href="/logout">Logout</a></li>
            <% } %>
        </ul>
        <form class="form-inline my-2 my-lg-0" action="/Search" method="post" id="search" style="margin-top: 8px">
            <input class="form-control mr-sm-2" type="text" name="inputvalue" placeholder="Search" aria-label="Search">
            <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
        </form>
    </div><!-- /.navbar-collapse -->
</nav>
