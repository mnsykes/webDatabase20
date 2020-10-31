<cfdump var = "#form#">

<cfparam name = "searchme" default = ''>
<cfparam name = "genre" default = ''>
<cfparam name = "publisher" default = ''>

<cfset bookinfo = makeQuery()>
<!---DELETE DUMP--->
<cfdump  var="#bookinfo#">
<cfoutput>
  <div style = "border-bottom: thin solid black">
    <cfoutput>#bookinfo.label#</cfoutput>
  </div>
  <cfif bookinfo.booksquery.recordcount eq 0>
    #noResults()#
    <cfelseif bookinfo.booksquery.recordcount eq 1>
      #oneResult()#
    <cfelse>
      #manyResults()#
  </cfif>
</cfoutput>

<!--- Functions --->
<cffunction  name = "makeQuery">
  <cfset booksquery = queryNew("hello")>
  <cfset label = "">

  <cfif genre neq ''>
    <cfquery name='generename' datasource="#application.dsource#">
      select genrename from genres where genreID='#genre#'
    </cfquery>
    <cfset label = "Genre: #genrename.genreName#">
    <cfquery name="bookinfo" datasource="#application.dsource#">
      select * from books
      inner join publisher on books.publisher = publisher.publisherID
      inner join genrestobooks on books.ISBN13 = genrestobooks.bookID
      where genrestobooks.gernreid = '#genre#'
    </cfquery>

    <cfelseif publisher neq ''>
      <cfset label = "Publisher: #publisher#">
      search via the publisher query

    <cfelseif searchme neq ''>
      <cfset label = "Keyword: #searchme#">

      <cfquery name = "bookinfo" datasource = "#application.dsource#">
        select * from books
        inner join publisher on books.publisher = publisher.publisherID
        where title like '%#trim(searchme)#%' or ISBN13 = '#searchme#' or publisher = '#searchme#'
      </cfquery>
  </cfif>
  <cfreturn {
              "booksquery": bookinfo,
              "label": label
            }>
</cffunction>

<cffunction  name = "noResults">
  <div>There were no results matching your search</div>
</cffunction>

<cffunction  name = "oneResult">
  <div>There was one result matching your search</div>
    <cfoutput>
      <div>
        <img src="#bookinfo.booksquery.image[1]#" style="width: 150px; float: left">
        <br>
        <span>Title: #bookinfo.booksquery.title[1]#</span>
        <br>
        <a href="#cgi.script_name#?p=details&searchme=#bookinfo.booksquery.publisher#">
          <span>Publisher: #bookinfo.booksquery.name[1]#</span>
        </a>
        <br>
        <span>Price: #numberformat(bookinfo.booksquery.price,"$_.__")#</span>
        <br> 
        <span>Description: #bookinfo.booksquery.description[1]#</span>
        <br>
      </div>
    </cfoutput>
</cffunction>

<cffunction  name="manyResults">
  <cfoutput>
    <div>
      We found #bookinfo.booksquery.recordcount# results matching your search.
    </div>
    <div>
      <ul class="nav flex-column">
        <cfloop query="bookinfo.booksquery">
          <li class="nav-item">
            <a href="#cgi.script_name#?p=details&searchme=#ISBN13#" class="nav-link">#trim(title)#</a>
          </li>
        </cfloop>
      </ul>
    </div> 
  </cfoutput>
</cffunction>
