<cfparam name="contentid" default="">

<cfset processForms()>
<cfoutput>
    <div class="col-lg-12">
    <div class="col-lg-9 col-lg-push-3">
    #contentForm()#
    </div>

    <div class="col-lg-3 col-lg-pull-9">
    #contentNav()#
    </div>
    </div>
</cfoutput>

<cffunction name="processForms">
    <cfif isdefined('form.contentid')>
        <cfif form.contentid eq ''>
            <cfset form.contentid=createuuid()>
        </cfif>
        <cfquery name="putin" datasource="#application.dsource#">
            if not exists(select * from content where contentID='#form.contentid#')
            insert into content (contentID, title) values ('#form.contentid#','#form.title#');
            update content set title='#form.title#', description='#description#' where contentID='#form.contentid#'
        </cfquery>
    </cfif>
</cffunction>


<cffunction name="contentForm">
    <cfif contentID neq ''>
        <cfquery name="editContent" datasource="#application.dsource#">
            select * from content where contentID='#contentid#'
        </cfquery>

        <cfoutput>
            <form action="#cgi.script_name#?tool=content" method="post" class="form-horizontal">
                <input type="hidden" name="contentid" value="#editContent.contentID[1]#">
            <div class="form-group">
                <label class="col-lg-3 content-label">
                    Code:
                </label>
                <div class="col-lg-9">
                    #editContent.contentID[1]#
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-3 content-label">
                    Title:
                </label>
                <div class="col-lg-9">
                    <input type="text" name="title" value="#editContent.title[1]#" />
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-12 content-label" style="text-align: left">
                    Description:
                </label>
                <div class="col-lg-9">
                    <textarea name="description" id="description">#editContent.description[1]#</textarea>
                    <script>ClassicEditor.create(document.querySelector('##description'))</script>
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-3 content-label">
                    &nbsp;
                </label>
                <div class="col-lg-9">
                    <input type="submit" value="Save" />
                </div>
            </div>
        </form>
        </cfoutput>
    </cfif>
</cffunction>

<cffunction name="contentNav">
    <cfquery name="allcontent" datasource="#application.dsource#">
        select * from content order by title
    </cfquery>

    <cfoutput>
        <ul>
            <li>
                <a href="#cgi.script_name#?tool=content&contentID=new">Add Content</a>
            </li>
            <cfloop query="allcontent">
                <li><a href="#cgi.script_name#?tool=content&contentID=#contentID#">#title#</a></li>
            </cfloop>
        </ul>
    </cfoutput>
</cffunction>
