<cfparam name="content" default="" />

<cfif content neq ''>
    <cfquery name="article" datasource="#application.dsource#">
        select * from content where contentid='#content#'
    </cfquery>

    <cfoutput>
        <div>
            #article.title#
        </div>
        <div>
            #article.description#
        </div>
    </cfoutput>
<cfelse>
    Please Choose an Article.
</cfif>
