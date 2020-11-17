<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Manage Project Checklist</title>
</head>
<link href="includes/bootstrap/css/bootstrap.css" rel="stylesheet" />
<body>

<cfajaxproxy cfc="checklist" jsclassname="chk" />

<script>
	function changeanswer(which,who,what){
		var ch=new chk();
		ch.setCallbackHandler(process);
		ch.setErrorHandler(whoops);
		ch.updateanswer(which,who,what);	
	}
	
	function process(e){
		//alert('back' + e);
	}
	
	function whoops(e){
		alert(e);	
	}
</script>

<cfparam name="page" default="" />
<cfdirectory directory="#expandpath('/')#Codebase/week9/" name="base" recurse="no">
<cfdirectory directory="#expandpath('/')#Codebase/week9/management/" name="manage" recurse="no">
<cfset ignorelist="pagecode.cfm,index.html">

<cfquery name="allitems" datasource="dcard">
	select * from pages inner join pagechecklistitems on pageuuid = pagechecklistpageid
    where pageactive=1
</cfquery>
<body>
	<h1>
    	Summer 2018 Website Database Implementation Info-2480 - 061 Final Project Checklist
    </h1>
	<div class="col-lg-3">
    	<p>This is a list of the functions which I will be looking for in your final project. They all come from the documents which we've been using this semester. There are some labelled "optional" which I'd encourage you to attempt. They are based on other pages and can add to your grade. </p>
        <p>
			This page is your record for your own personal use. When you click on Complete / Incomplete, your progres is saved and will be here, even if you close the browser and return later. Let me know if you have any questions. 
        </p>
        <p>
        	All Projects are due on July 29th at 11:59pm.
        </p>
    </div>
    <div class="col-lg-9">
    	<h2>Public Area</h2>
		<cfoutput query="base">
			#check(name)#
		</cfoutput>
        <hr />
        <h2>Management Area</h2>
        <cfoutput query="manage">
        	#check('management/#name#')#
        </cfoutput>
	</div>
	<cfquery name="alldoneitems" datasource="dcard">
    	select * from classtochecklistitems where classtochecklistitemstudent='#application.dsource#'
    </cfquery>
    <cfoutput query="alldoneitems">
		<cfif classtochecklistitemstudentresult eq 1>
    		<script>
				document.getElementById('#trim(classtochecklistitemitemuuid)#-1').checked=true;
			</script>
		</cfif>
	</cfoutput>
</body>
</html>

<cffunction name="check">
	<cfargument name="name">
	<cfquery name="pager" dbtype="query">
    	select * from allitems 
        where pageaddress='#name#'
    </cfquery>
    <cfif pager.recordcount gt 0 and listfind(ignorelist,trim(name)) eq 0 and type eq 'file'>
    	<cfoutput>
        <legend>#name#</legend>
		<div class="col-lg-12">
        	<cfloop query="pager">
            	<div class="col-lg-12">
                	<div class="col-lg-2">
                    Complete: <input type="radio" id="#trim(pagechecklistuuid)#-1" name="#pagechecklistuuid#" value="1"  onclick="changeanswer('#pagechecklistuuid#','#application.dsource#',1)" />
                    Incomplete: <input type="radio" name="#pagechecklistuuid#" value="0" onclick="changeanswer('#pagechecklistuuid#','#application.dsource#',0)" checked />
                    </div>
                    <div class="col-lg-10">
               		#pagechecklistitem#
                    </div>
                    
                </div>
            </cfloop>
        </div>
        </cfoutput>
    </cfif>

</cffunction>

