<cfif not isDefined('session.user')>
  <cfset variable = makeCleanUser()>
</cfif>

<cfif isdefined('form.loginemail')>
  <cfquery name = "access" datasource = "msyke65870">
    select * from people
    inner join passwords on people.personID = passwords.personID
    where email = '#form.loginemail#' and password = '#hash(form.loginpass,"SHA-256")#'
  </cfquery>

  <cfif access.recordcount gt 0>
    <cfset session.user.firstName = access.firstName[1]>
    <cfset session.user.lastName = access.lastName[1]>
    <cfset session.user.email = access.email[1]>
    <cfset session.user.acctNumber = access.personID[1]>
    <cfset session.user.isadmin = access.isadmin[1]>
    <cfset session.isloggedin = true>
    <cfset p = "carousel">

  <cfelse>
    <cfset loginmessage = "Sorry, that login doesn't match">
  </cfif>
</cfif>


<cfif isdefined('url.p') and url.p eq 'logoff'>
  <cfset StructClear(session)>
  <cfset session.isloggedin = false>
  <cfset makeCleanUser()>
  <cfset p = "carousel">
</cfif>


<cffunction  name = "makeCleanUser">
  <cfset session.isloggedin = false>
  <cfset session.user = {
    firstName: '',
    lastName: '',
    acctNumber: '',
    email: '',
    isadmin: false
  }>
</cffunction>


