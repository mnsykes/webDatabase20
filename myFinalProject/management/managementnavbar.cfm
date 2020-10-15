<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a href="" class="navbar-brand">
        <img src="../../includes/classimages/rdb.png"/>
        </a>
        
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="">Home <span class="sr-only">(current)</span></a>
                </li>
                <cfoutput>
                    <li class="nav-item">
                        <a href="#cgi.script_name#?tool=addedit&book=new" class="nav-link">Add a Book</a>
                    </li>
                    <li class="nav-item">
                        <a href="#cgi.script_name#?tool=createuuids" class="nav-link">Create UUID</a>
                    </li>
                </cfoutput>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a>Logout</a></li>
            </ul>
        </div>
</nav>
    


