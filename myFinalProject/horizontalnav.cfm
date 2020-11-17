

<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
        <a href="index.cfm" class="navbar-brand">
        <img src="../includes/classimages/rdb.png"/>
        </a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.cfm">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a href="/msyke65870/MyFinalProject/index.cfm?p=content&content=1FBB8B31-8D8B-4351-AE1D5556F8FA2569" class="nav-link" >Store Info</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/msyke65870/MyFinalProject/index.cfm?p=content&content=E0C8AFA2-6B0D-4DC7-B84080927B5E9EA7">Events</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/msyke65870/MyFinalProject/index.cfm?p=content&content=1108BDEA-B9F4-4477-94F93DDB55CED408">Staff Favorites</a>
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
                <cfoutput>
                    <cfif session.isloggedin>
                        <li class="nav-item">
                            <a class="nav-link">Welcome #session.user.firstName#</a>
                        </li>
                        <cfif session.user.isadmin>
                                <li class="nav-item">
                                    <a class="nav-link" href="/msyke65870/myFinalProject/management">Management</a>
                                </li>
                        </cfif>
                        <li class="nav-item">
                            <a class="nav-link" href="#cgi.script_name#?p=logoff">Logout</a>
                        </li>
                    <cfelse>
                        <li class="nav-item">
                            <a class="nav-link" href="#cgi.script_name#?p=login">Login</a>
                        </li>
                    </cfif>
                </cfoutput>
            </ul>
        </div>
    </div>
</nav>