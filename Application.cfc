<cfcomponent>
	<cfset this.name="%%SiteName%%">
	<cfset this.dsource='%%SiteName%%'>
    <cfset this.sessionmanagement="true">
	<cffunction name="onApplicationStart">
    	<cfset application.dsource='%%SiteName%%'>
    </cffunction>

	<cffunction name="onRequestStart">
		<cfif not isdefined('session.firstname')>
			<cfset session.firstname="">
		</cfif>
		<cfif not isdefined('session.lastname')>
			<cfset session.lastname="">
		</cfif>
	</cffunction>
</cfcomponent>