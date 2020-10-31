<cfquery name="allgenres" datasource="#application.dsource#">
    select distinct genres.genreID, genres.genreName * from genres
    inner join genrestoboook on genres.genreID = genretobook.genreID
    inner join books on genrestobook.bookID = books.ISBN13

</cfquery>


<cfoutput query="allgenres">


    <ul class="nav flex-column">
    <li class="nav-item"><a href="#cgi.script_name#?p=details&genre" class="nav-link">#genreName#</a></li>
</ul>



</cfoutput>
