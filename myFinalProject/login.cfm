<cfset variable = preprocess()>

<script type="text/javascript">
  function validateNewAccount() {
    var originalPassword = document.getElementById('newaccountpassword').value;
    console.dir(originalPassword);
    var confirmPassword = document.getElementById('newaccountpasswordconfirm').value;
    console.dir(confirmPassword)

    if (originalPassword === confirmPassword && originalPassword !== '' && confirmPassword !== '') {
      document.getElementById('submitnewaccountform').click();
      
    } else {
      document.getElementById('newaccountmessage').innerHTML = 'Passwords do not match';
    }
  }
</script>


<cfparam  name="AccountMessage" default=''>
<cfparam  name="loginmessage" default=''>

<cfoutput>
  <div class="row">
    <div class='col-lg-6'>
      <div id="newaccountmessage">#AccountMessage#</div>
      <h2>Create a New Account</h2>
      <form class="form-horizontal" action="#cgi.script_name#?p=login" method="post">
        <div class="form-group">
          <input type="text" class="form-control" name="newpersonid" id="newpersonid" value="" style="display: none">
        </div>
        <div class="form-group">
          <label for="firstName">First Name</label>
          <input type="text" class="form-control" name="firstName" id="firstName" value="" required>
        </div>
        <div class="form-group">
          <label for="lastName">Last Name</label>
          <input type="lastName" class="form-control" name="lastName" id="lastName" value="" required>
        </div>
        <div class="form-group">
          <label for="email">Email address</label>
          <input type="email" class="form-control" name="email" id="email" aria-describedby="emailHelp" value='' required>
          <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
        </div>
        <div class="form-group">
          <label for="newaccountpassword">Password</label>
          <input type="password" class="form-control" name="password" id="newaccountpassword" value='' required>
        </div>
        <div class="form-group">
          <label for="newaccountpasswordconfirm">Password</label>
          <input type="password" class="form-control" id="newaccountpasswordconfirm" value='' required>
        </div>
        <button id="newaccountbutton" type="button" class="btn btn-warning" onclick="validateNewAccount()">Make Account</button>
        <input type="submit" id="submitnewaccountform" style="display:none">
      </form>
    </div>
    
    <div class='col-lg-6'>
      <div id="loginmessage">#loginmessage#</div>
      <h3>Login Here</h3>
      <form action="#cgi.script_name#?p=login" method="post" class="form-horizontal">
        <div class="form-group">
          <label for="loginemail">Email address</label>
          <input type="email" class="form-control" name="loginemail" id="loginemail" aria-describedby="emailHelp" value='' required>
        </div>
        <div class="form-group">
          <label for="loginpass">Password</label>
          <input type="password" class="form-control" name="loginpass" id="loginpass" value='' required>
        </div>
        <button class="btn btn-warning" type="submit">Submit</button>
        <a href="#cgi.script_name#?p=forgot-password" class="btn btn-default">Forgot password?</a>
      </form>
    </div>
  </div>
</cfoutput>
    

  








<cffunction  name="preprocess">
  <cfif isdefined('form.newpersonid')>
    <cfquery name="getemail" datasource="#application.dsource#">
      select * from people where email='#form.email#'
    </cfquery>

    <cfif getemail.recordcount eq 0>
      <cfset newid=createuuid()>
      <cfquery name="addnewuser" datasource="#application.dsource#">
        insert into people (personID, firstName, lastName, email)
        values ('#newid#', '#form.firstName#', '#form.lastName#', '#form.email#')
      </cfquery>
      <cfquery name="addPassword" datasource="#application.dsource#">
        insert into passwords (personID, password) values ('#newid#', '#hash(form.password, "SHA-256")#')
      </cfquery>
    <cfelse>
        <cfset AccountMessage="That Email Account is Already in Our System. Please Login">
    </cfif>
  </cfif>
</cffunction>

  

