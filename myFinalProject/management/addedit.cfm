<cfparam  name="book" default="">
<cfparam name="qterm" default="">

<cfoutput>
  <cftry>
    <cfset processForms()>
    <div id="leftgutter" class="col-sm-2 col-lg-pull-10">
       <cfset sideNav()>
    </div>
    <div id="main" class="col-sm-10 col-lg-push-2">
      <cfset mainForm() >
    </div>
    <cfcatch type="any">
      <cfoutput>
        #cfcatch.Message#
      </cfoutput>
    </cfcatch>
  </cftry>
</cfoutput>





<!--- Functions --->
<cffunction  name="mainForm">
  <cfif book neq ''>
    <cfquery name="thisbook" datasource="#application.dsource#">
      select * from books where ISBN13='#book#'
    </cfquery>
    <cfquery name="allpublishers" datasource="#application.dsource#">
      select * from publisher order by name
    </cfquery>
    <cfoutput>
        <form action="#cgi.script_name#?tool=addedit" method="post" enctype="multipart/form-data" class="form-horizontal">
          
          <!---    Hidden qterm        --->
          <input type="hidden" name="qterm" value="#qterm#">
          <!---     ISBN13      --->
          <div class="form-group row">
            <label for="ISBN13" class="col-sm-2 control-label">ISBN13:</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="ISBN13" value="#thisbook.ISBN13[1]#" placeholder="Enter ISBN13">
            </div>
          </div>

          <!---    Title        --->
          <div class="form-group row">
            <label for="title" class="col-sm-2 control-label">Title:</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="title" value="#thisbook.title[1]#" placeholder="Enter Book Title">
            </div>
          </div>

          <!---     ISBN10       --->
          <div class="form-group row">
            <label for="isbn" class="col-sm-2 control-label">ISBN10:</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="isbn" value="#thisbook.isbn[1]#" placeholder="Enter ISBN10">
            </div>
          </div>

          <!---    Year        --->
          <div class="form-group row">
            <label for="year" class="col-sm-2 control-label">Year:</label>
            <div class="col-sm-10">
              <input type="text" class="form-control" name="year" value="#thisbook.year[1]#" placeholder="Enter Published Date">
            </div>
          </div>

          <!---    Pages        --->
          <div class="form-group row">
            <label for="pages" class="col-sm-2 control-label">Pages:</label>
            <div class="col-sm-10">
              <input type="number" class="form-control" name="pages" value="#thisbook.pages[1]#" placeholder="Enter the Number of Pages">
            </div>
          </div>

          <!---     Language       --->
          <div class="form-group row">
            <label for="pages" class="col-sm-2 control-label">Language:</label>
            <div class="col-sm-10">
              <select id="language" name="language">
                <option value=""></option>
                <option value="English" #thisbook.language[1] eq 'English' ? "selected" : ''#>English</option>
                <option value="Spanish" #thisbook.language[1] eq 'Spanish' ? "selected" : ''#>Spanish</option>
                <option value="French" #thisbook.language[1] eq 'French' ? "selected" : ''#>French</option>
                <option value="Italian" #thisbook.language[1] eq 'Italian' ? "selected" : ''#>Italian</option>
                <option value="Mandarin" #thisbook.language[1] eq 'Mandarin' ? "selected" : ''#>Mandarin</option>
              </select>
            </div>
          </div>
          
          <!---    Binding        --->
          <div class="form-group row">
            <label for="binding" class="col-sm-2 control-label">Binding:</label>
            <div class="col-sm-10">
              <select id="binding" name="binding">
                <option value=""></option>
                <option value="Hardcover" #thisbook.binding[1] eq 'Hardcover' ? "selected" : ''#>Hardcover</option>
                <option value="Paperback" #thisbook.binding[1] eq 'Paperback' ? "selected" : ''#>Paperback</option>
                <option value="PDF" #thisbook.binding[1] eq 'PDF' ? "selected" : ''#>PDF</option>
                <option value="ePub" #thisbook.binding[1] eq 'ePub' ? "selected" : ''#>ePub</option>
                <option value="Trade Paperback" #thisbook.binding[1] eq 'Trade Paperback' ? "selected" : ''#>Trade Paperback</option>
              </select>
            </div>
          </div>
          
          <!---    Publisher        --->
          <div class="form-group row">
            <label for="publisher" class="col-sm-2 control-label">Publisher:</label>
            <div class="col-sm-10">
              <select id="publisher" name="publisher">
                <option value=""></option>
                <cfloop query="allpublishers">
                  <cfset sel="">
                  <cfif thisbook.publisher[1] eq publisherID>
                    <cfset sel="selected">
                  </cfif>
                  <option value=#trim(publisherID)# #sel#>#trim(name)#</option>
                </cfloop>
              </select>
            </div>
          </div>

          <!---    Weight        --->
          <div class="form-group row">
                <label for="weight" class="col-sm-2 control-label">Weight:</label>
            <div class="col-sm-10">
              <input type="number" step="0.1" class="form-control" name="weight" value="#thisbook.weight[1]#" placeholder="Enter the Weight">
            </div>
          </div>

          <!---  Description          --->
          <div class="form-group row">
            <label class="col-sm-2 control-label" for="description">Description</label>
            <textarea id="bookDesc" name="description">
              #trim(thisbook.description[1])#
            </textarea>
          </div>

          <!---  Cover Image          --->
          <div class="form-group row">
            <label for="image" class="col-sm-2 control-label">Cover:</label>
            <div class="col-sm-10">
              <img src="/msyke65870/myFinalProject/images/#thisbook.image[1]#">
              <input type="hidden" name="image" value="#thisbook.image[1]#">
              <input type="file" class="form-control" id="coverImage" name="image" value="#thisbook.image[1]#" placeholder="Upload Cover Image">
            </div>
          </div>

          <!---    Submit Button        --->
          <button type="submit" class="btn btn-primary" style="width: 100%">Add Book</button>
          <label>&nbsp</label>
        </form>
    </cfoutput>
  </cfif>
</cffunction>

<cffunction  name="processForms">
  <cfif form.keyExists('ISBN13')>
    <cfdump  var="#form#" label="Forms">
    <cfif form.keyExists('coverImage') and form.coverImage neq ''>
      <cffile action="upload" filefield="coverImage" destination="#expandpath('/msyke65870/myFinalProject/images')#" nameconflict="makeunique">
      <cfset form.image = cffile.serverfile>
      <cfdump var="cffile">
    </cfif>
    <cfquery name="putBookIn" datasource="#application.dsource#">
      if not exists(select * from books where ISBN13 = '#form.ISBN13#')
        insert into books
        (ISBN13, title)
        values
        ('#form.ISBN13#', '#form.title#');
        update books set 
        title='#form.title#',
        weight='#form.weight#',
        year='#form.year#',
        isbn='#form.isbn#',
        pages='#form.pages#',
        language='#form.language#',
        binding='#form.binding#',
        publisher='#form.publisher#',
        image='#form.image#',
        description='#form.description#'
        where ISBN13='#form.ISBN13#'
    </cfquery>
  </cfif>
</cffunction>

<cffunction  name="sideNav">
  <cfif qterm neq ''>
    <cfquery name="allBooks" datasource="#application.dsource#">
      select * from books where title like '%#qterm#%' order by title
    </cfquery>
  </cfif>
  <cfoutput>
    <form action="#cgi.script_name#?tool=addedit" method="post" class="form-inline">
      <div class="form-group">
        <input type="text" class="form-control" id="qterm" name="qterm" value="#qterm#">
        <button type="submit" class="btn btn-xs btn-primary">Search</button>
      </div>
    </form>
  </cfoutput>
  <cfoutput>
    <div>
      <ul class="nav flex-column">
        <div>Book List</div>
        <cfif isdefined('allBooks')>
          <li>
            <a href="#cgi.script_name#?tool=addedit&book=new">Add a Book</a>
          </li>
          <cfloop query="allBooks">
            <li>
              <a href="#cgi.script_name#?tool=addedit&book=#ISBN13#&qterm=#qterm#">#trim(title)#</a>
            </li>
          </cfloop>
        <cfelse>
          No Search Term Entered
        </cfif>
      </ul>
    </div>
  </cfoutput>
</cffunction>


