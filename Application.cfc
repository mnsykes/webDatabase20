<cfcomponent>
	<cfset this.name="msyke65870">
	<cfset this.dsource='msyke65870'>
    <cfset this.sessionmanagement="true">
	<cffunction name="onApplicationStart">
    	<cfset application.dsource='msyke65870'>
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