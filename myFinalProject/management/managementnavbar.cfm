<nav class="navbar navbar-expand-lg navbar-light bg-warning">
    <div class="navbar-header">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#management-nav" aria-controls="management-nav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a href="index.cfm" class="navbar-brand">
            <img src="../../includes/classimages/rdb.png"/>
        </a>
    </div>

<cfoutput>
      <div class="collapse navbar-collapse" id="management-nav">
        <ul class="navbar-nav mr-auto">
        <li class="nav-item">
            <h5 class="nav-link">Admin Toolbar</h5>
        </li>
        <li class="nav-item">
                <a href="#cgi.script_name#?tool=addedit&book=new" class="nav-link">Add a Book</a>
        </li>
        <li class="nav-item">
                <a href="#cgi.script_name#?tool=content" class="nav-link">Edit Content</a>
        </li>
        <li class="nav-item">
                <a href="#cgi.script_name#?tool=createuuids" class="nav-link">Create UUID</a>
        </li>
        </ul>
    </div>
</cfoutput>

</nav>
    


