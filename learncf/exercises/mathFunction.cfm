<cfoutput>
  #addNumbers(10,5)#
  <br>
  #addNumbers(100,500)#
  <br>
  #addNumbers(32000,1000)#
  <br>
  #addNumbers(1,1)#
  <br>
  #addNumbers(5500,324)#
  <br>
  #addNumbers(100000000,500000000)#
  <br>
</cfoutput>





<cffunction name="addNumbers" access="private" returntype="numeric">
  <cfargument name="firstNum" type="numeric">
  <cfargument name="secondNum" type="numeric">
  <cfreturn #firstNum#+#secondNum#>
</cffunction>