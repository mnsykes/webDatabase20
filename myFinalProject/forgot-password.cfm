<cfparam name="whatView" default="proveit" />
<cfparam name="ForgotMessage" default="" />
<cfparam name="personid" default="" />

<!--- The value of whatView will determine what form is shown or action is performed --->
<cfset whatView=processForms()>

<!--- This JS checks whether the password and the confirm password match before trying to submit the form ---->
<script>
    function validateNewAccount(){
        var originalPassword=document.getElementById('newaccountpassword').value;
        var confirmPassword=document.getElementById('newaccountpasswordconfirm').value;
        console.dir(originalPassword);
        console.dir(confirmPassword);
        if(originalPassword===confirmPassword && originalPassword!==''){
            document.getElementById('submitnewaccountform').click();
            document.getElementById('ForgotMessage').innerHTML="";
        }
        else{
            document.getElementById('ForgotMessage').innerHTML="The two passwords do not match";
        }
    }
</script>

<!--- This is the structure of the page with areas and individual functions for the two forms we will display --->
<cfoutput>
<!--- This area will display any messages necessary --->
    <div id="ForgotMessage">&nbsp;#ForgotMessage#</div>
<!--- If "proveit" comes back from the processForms method, show the authentication form --->
    <cfif whatView eq 'proveit'>
        #authenticationForm()#

<!--- Otherwise show the change password form --->
    <cfelseif whatView eq 'changePassword'>
      #newPasswordForm()#
    </cfif>
</cfoutput>



<cffunction name="processForms">
<!--- If the user has submitted the authentication form --->
    <cfif isdefined('form.validateLastName')>
        <cfquery name="isitthem" datasource="#application.dsource#">
            select * from people where lastName='#form.validateLastName#' and email='#form.validateEmail#'
        </cfquery>

        <cfif isitthem.recordcount gt 0>
            <cfset personid=#isitthem.personID[1]#>
            <cfreturn "changePassword">
        <cfelse>
            <cfset ForgotMessage="That name and email do not match">
        </cfif>
    </cfif>

<!--- If the user has submitted the change password form --->
    <cfif isdefined('form.password')>
        <cfquery name="updateme" datasource="#application.dsource#">
            update passwords
            set password='#hash(form.password,"SHA-256")#'
            where personID ='#form.personid#'
        </cfquery>
<!--- After changing the password, send the user to the login page as a courtesy --->
        <cflocation url="index.cfm?p=login" />
    </cfif>

<!--- By default, show the authentication form --->
    <cfreturn "proveit">
</cffunction>


<cffunction name="authenticationForm">
    <cfoutput>
        <form action="#cgi.script_name#?p=forgot-password" method="post" class="form-horizontal">
            <div class="form-group">
                <label class="col-lg-3 control-label" for="validateEmail">Email Address:</label>
                <div class="col-lg-9">
                    <input type="text" name="validateEmail" placeholder="Email" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-3 control-label" for="validateLastName">Last Name:</label>
                <div class="col-lg-9">
                    <input type="text" name="validateLastName" placeholder="Last Name" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label class="col-lg-3 control-label">&nbsp;</label>
                <div class="col-lg-9">
                    <input type="submit" value="Authenticate" />
                </div>
            </div>
        </form>
    </cfoutput>
</cffunction>

<cffunction name="newPasswordForm">
    <cfoutput>
        <form action="#cgi.script_name#?p=forgot-password" method="post" class="form-horizontal">
            <input type="text" name="personid" value="#personID#" style="display: none">
        <div class="form-group">
            <label class="col-lg-3 control-label">Password</label>
            <div class="col-lg-9">
                <input type="password" class="form-control" name="password" id="newaccountpassword" required/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-lg-3 control-label">Confirm Password</label>
            <div class="col-lg-9">
                <input type="password" class="form-control" id="newaccountpasswordconfirm" required/>
            </div>
        </div>

    <div class="form-group">
        <label class="col-lg-3 control-label">&nbsp;</label>
    <div class="col-lg-9">

            <button type="button" id="newAccountButton" class="btn btn-warning" onclick="validateNewAccount()">Change Password</button>
            <input type="submit" id="submitnewaccountform" style="display:none" />
        </div>
        </div>
        </form>
    </cfoutput>
</cffunction>
