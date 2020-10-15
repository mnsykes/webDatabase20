<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container"
        <a href="" class="navbar-brand">
        <img src="../includes/classimages/rdb.png"/>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="">Store Information</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="">Highlighted Favorites</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="">Events</a>
                </li>
                <li>
                    <cfoutput>
                        <form action="#cgi.script_name#?p=details" method="post" class="form-inline my-2 my-lg-0">
                            <input class="form-control mr-sm-2" type="search" name="searchme" placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
                        </form>
                    </cfoutput>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
            <li><a>Login</a></li>
            </ul>
        </div>
    </div>
</nav>