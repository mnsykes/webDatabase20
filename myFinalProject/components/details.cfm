<cfdump  var="#form#">

<cfquery name="bookinfo" datasource="#application.dsource#">
  select * from books
  inner join publisher on books.publisher=publisher.publisherID
  where title like '%#trim(form.searchme)#%' or ISBN13 like '%#trim(searchme)#%'
</cfquery>

<cfoutput>
  <cfif bookinfo.recordcount eq 0>
    #noResults()#
    <cfelseif bookinfo.recordcount eq 1>
      #oneResult()#
    <cfelse>
      #manyResults()#
  </cfif>
</cfoutput>


<!--- Functions --->
<cffunction name="noResults">
  There were no results to be found.
</cffunction>

<cffunction name="oneResult">
  There was one result, show the details.
  <cfoutput>
    <br>
    <img src="../images/#bookinfo.IMAGE[1]#" style="width:250px; height:250px">
    <br>
    <span>Title: #bookinfo.title[1]#</span>
    <br>
    <span>Publisher: #bookinfo.name[1]#</span>
  </cfoutput>
</cffunction>

<cffunction name="manyResults">
  There was more than one result found, show a list.
  <ol class="nav">
    <cfoutput query="bookinfo">
      <li>
        <a href="#cgi.script_name#?p=details&searchme=#trim(ISBN13)#">#trim(title)#</a>
      </li>
    </cfoutput>
  </ol>
</cffunction>