<script type="text/javascript">
    function validateNewAccount() {
        var resetPassword = document.getElementById('createNewPassword').value;
        console.dir(resetPassword);
        var confirmPassword = document.getElementById('newaccountpasswordconfirm').value;
        console.dir(confirmPassword)

        if (originalPassword === confirmPassword && originalPassword !== '' && confirmPassword !== '') {
            document.getElementById('submitnewaccountform').click();

        } else {
            document.getElementById('newaccountmessage').innerHTML = 'Passwords do not match';
        }
    }
</script>

<cfoutput>
    <form action="#cgi.script_name#?p=forgot-password" method="post" class="form-horizontal">
        <div class="form-group">
            <label for="email" class="col-lg-3 control-label" >Email Address:</label>
            <div class="col-lg-9">
                <input type="email" placeholder="Email" class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label class="col-lg-3 control-label">Last Name:</label>
            <div class="col-lg-9">
                <input type="text" name="lastname" placeholder="Last Name" class="form-control">
            </div>
        </div>
        <div class="form-group">
            <label class="col-lg-3 control-label">&nbsp;</label>
            <div class="col-lg-9">
                <input type="submit" value="Verify" />
            </div>
        </div>
    </form>
</cfoutput>

<cfoutput>
    <form action="" method="post">
        <div class="form-group">
            <label for=""></label>
            <input type="password" id="createNewPassword">
        </div>
        <div class="form-group">
            <label for=""></label>
            <input type="password" id="confirmNewPassword">
        </div>
        <button id="newPasswordButton" type="button" class="btn btn-warning" onclick="newPassword()">Submit</button>
        <input type="submit" id="newPasswordConfirm" style="display:none">
    </form>
</cfoutput>
