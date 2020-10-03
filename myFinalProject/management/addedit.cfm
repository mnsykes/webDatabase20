<cftry>
  <cfset processForms()>
  <div id="leftgutter" class="col-lg-3 col-lg-pull-9">
    <cfset sideNav()>
  </div>
  <div id="main" class="col-lg-9 col-lg-push-3">
    <cfset mainForm() >
  </div>
  <cfcatch type="any">
    <cfoutput>
      #cfcatch.Message#
    </cfoutput>
  </cfcatch>
</cftry>




<!--- Functions --->
<cffunction  name="mainForm">
  <cfoutput>
      <form action="#cgi.script_name#?tool=addedit" method="post">
        <div>
          <label for="bookID">ISBN13:</label>
          <input type="text" name="bookID" value="" placeholder="Enter ISBN13">
        </div>
        <div>
          <label for="title">Title:</label>
          <input type="text" name="title" value="" placeholder="Enter Book Title">
        </div>
        <button type="submit" class="btn btn-primary">Add Book</button>
      </form>
  </cfoutput>
</cffunction>

<cffunction  name="processForms">
  <cfif form.keyExists('bookID')>
    <cfquery name="putBookIn" datasource="#application.dsource#">
      if not exists(select * from books where bookID = '#form.bookID#')
        insert into books
        (bookID, title)
        values
        ('#form.bookID#', '#form.title#');
    </cfquery>
    <cfdump  var="#form#" label="Forms">
  </cfif>
</cffunction>

<cffunction  name="sideNav">
  <cfoutput>
    <cfquery name="allBooks" datasource="#application.dsource#">
      select * from books order by title
    </cfquery>
    <div>Book List</div>
    <ul class="nav flex-column">
      <cfloop query="allBooks">
        <li class="nav-item">
          <a class="nav-link">#trim(title)#</a>
        </li>
      </cfloop>
    </ul>
</cfoutput>
</cffunction>
