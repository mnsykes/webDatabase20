<cfquery name="allgenres" datasource="#application.dsource#">
    select distinct genrestobooks.genreID, genres.genreName from genrestobooks
    inner join genres on genres.genreID = genrestobooks.genreID

</cfquery>



<ul class="nav flex-column">
    <cfoutput query="allgenres">
        <li class="nav-item">
            <a href="#cgi.script_name#?p=details&genre=#genreID#" class="nav-link">#genreName#</a>
        </li>
    </cfoutput>
</ul>

