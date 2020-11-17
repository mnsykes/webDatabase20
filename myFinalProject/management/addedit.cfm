<cfparam  name = "book" default = "">
<cfparam name = "qterm" default = "">

<cfoutput>
  <cftry>
    <cfset processForms()>
    <div id ="leftgutter" class ="col-lg-3 col-lg-pull-9">
       <cfset sideNav()>
    </div>
    <div id="main-form" class="col-lg-9 col-lg-push-3">
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
<cffunction  name = "mainForm">
  <cfif book neq ''>
    <cfquery name="allGenres" datasource="#application.dsource#">
      select * from genres order by genreName
    </cfquery>

    <cfquery name="bookGenres" datasource="#application.dsource#">
      select * from genrestobooks where bookID = '#book#'
    </cfquery>

    <cfquery name = "thisbook" datasource="#application.dsource#">
      select * from books where ISBN13 = '#book#'
    </cfquery>

    <cfquery name = "allpublishers" datasource="#application.dsource#">
      select * from publisher order by name
    </cfquery>

    <cfoutput>
      <h1>Book Edit Form</h1>
        <form action="#cgi.script_name#?tool=#tool#&book=#url.book#"
              method="post"
              enctype="multipart/form-data"
              class="form-horizontal">
      <!---#cgi.script_name#?tool=addedit--->
          <!---    Hidden qterm        --->
          <input type="hidden" name="qterm" value="#qterm#">
          <!---   By default show the display   --->
          <cfset isbnfield = "none">
          <cfset isbndisplay = "inline">
          <cfset req = ''>
          <!---   If the ISBN13 from the db is blank, show the ISBN13 input             --->
          <cfif trim(thisbook.ISBN13[1]) eq ''>
            <cfset isbnfield = "inline">
            <cfset isbndisplay = "none">
            <cfset req = "required">
          </cfif>
          <!---     ISBN13 form group     --->
          <div class="form-group row">
             <label for="ISBN13" class="col-sm-2 control-label">ISBN13:</label>
            <div class="col-sm-10">
              <span id="newISBN13area" style="display: #isbnfield#">
                <input id="newISBN13" class="form-control" type="text" name="newISBN13" value="#thisbook.ISBN13[1]#" placeholder="Enter ISBN13" pattern="{13}" required>
              </span>
              <span style="display: #isbndisplay#">
                #thisbook.ISBN13[1]#
                <button type="button" onclick="toggleNewISBNForm()" class="btn btn-warning btn-xs">Edit ISBN</button>
                <input type="hidden" class="form-control" name="ISBN13" value="#thisbook.ISBN13[1]#" placeholder="Enter ISBN13" pattern="{13}">
              </span>
            </div>
          </div>

          <!---    Title        --->
          <div class="form-group row">
            <label for="title" class="col-sm-2 control-label">Title:</label>
            <div class="col-sm-10">
              <!---      Max Length 45          --->
              <input type="text" class="form-control" name="title" value="#thisbook.title[1]#" placeholder="Enter Book Title" required>
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
                    <cfset sel = "selected">
                  </cfif>
                  <option value=#trim(publisherID)# #sel#>#trim(name)#</option>
                </cfloop>
              </select>
            </div>
          </div>

          <!---    Price        --->
          <div class="form-group row">
                <label for="price" class="col-sm-2 control-label">Price:</label>
            <div class="col-sm-10">
              <input type="number" step="0.01" class="form-control" name="price" value="#thisbook.price[1]#" placeholder="Enter the Price">
            </div>
          </div>
          <!---    Weight        --->
          <div class="form-group row">
                <label for="weight" class="col-sm-2 control-label">Weight:</label>
            <div class="col-sm-10">
              <input type="number" step="0.01" class="form-control" name="weight" value="#thisbook.weight[1]#" placeholder="Enter the Weight">
            </div>
          </div>

          <!---  Description          --->
          <div class="form-group row">
            <label class="col-sm-2 control-label" for="description">Description</label>
            <textarea id="bookDesc" name="description">
              #trim(thisbook.description[1])#
            </textarea>
            <script>ClassicEditor.create(document.querySelector('##bookDesc'))</script>
          </div>

          <!---  Cover Image          --->
          <div class="form-group row">
            <label for="image" class="col-sm-2 col-form-label">Cover:</label>
            <div class="col-sm-10">
              <img src="/msyke65870/myFinalProject/images/#thisbook.image[1]#">
              <input type="hidden" name="image" value="#thisbook.image[1]#">
              <input type="file"
                     class="form-control"
                     id="uploadImage"
                     name="uploadImage">
            </div>
          </div>

          <!---Genre checkboxes--->
          <cfloop query="allgenres">
              <div class="form-check">
                <input class="form-check-input"
                       type="checkbox"
                       name="genre"
                       value="#genreID#"
                       id="genre#genreID#">
                <label class="form-check-label" for="genre">#genreName#</label>
              </div>
          </cfloop>

          <!---Loop through genres to assign them to a book--->
          <cfloop query="bookGenres">
              <script type="text/javascript">
                document.getElementById('genre#genreID#').checked = true;
              </script>
          </cfloop>
          <!---    Submit Button        --->
          <button type="submit" class="btn btn-primary" style="width: 100%">Add Book</button>
        </form>
    </cfoutput>
  </cfif>
</cffunction>

<cffunction  name = "processForms">
  <cfif form.keyExists('ISBN13')>
    <cfquery name="deleteGenresForBook" datasource="#application.dsource#">
      delete from genrestobooks where bookID = '#form.ISBN13#'
    </cfquery>
    <cfif form.keyExists("uploadImage") and form.uploadImage neq ''>
      <cffile action = "upload"
              filefield = "uploadImage"
              destination = "#expandPath('/msyke65870/myFinalProject/images/')#"
              nameconflict = "makeunique">
      <cfset form.image = cffile.serverfile>
    </cfif>
    <cfset form.ISBN13 = form.newISBN13>
    <cfif isdefined('form.newISBN13')>
      <cfquery datasource = '#application.dsource#'>
        update books set ISBN13 = '#form.newISBN13#' where ISBN13 = '#form.ISBN13#'
      </cfquery>
    </cfif>

    <cfquery name = "putBookIn" datasource = "#application.dsource#">
      if not exists(select * from books where ISBN13 = '#form.ISBN13#')
        insert into books
        (ISBN13, title)
        values
        ('#form.ISBN13#', '#form.title#');
        update books set 
        title = '#form.title#',
        weight = '#form.weight#',
        year = '#form.year#',
        isbn = '#form.isbn#',
        pages = '#form.pages#',
        language = '#form.language#',
        binding = '#form.binding#',
        publisher = '#form.publisher#',
        image = '#form.image#',
        description = '#form.description#',
        price = '#form.price#'
        where ISBN13 = '#form.ISBN13#'
    </cfquery>


      <cfif form.keyExists("genre") and form.genre neq ''>
        <cfloop list="#form.genre#" index="i">
          <cfquery name="putingenre" datasource="#application.dsource#">
            insert into genrestobooks (bookID, genreID)
              values
              ('#form.ISBN13#', '#i#')
          </cfquery>
        </cfloop>
      </cfif>


  </cfif>
</cffunction>

<cffunction  name = "sideNav">
  <cfoutput>
    <form action="#cgi.script_name#?tool=addedit" method="post" class="form-inline">
      <div class="form-group">
        <input type="text" class="form-control" id="qterm" name="qterm" value="#qterm#" placeholder="Find a Book">
        <button type="submit" class="btn btn-xs btn-primary">Search</button>
      </div>
    </form>
  </cfoutput>
  <cfif qterm neq ''>
    <cfquery name = "allBooks" datasource = "#application.dsource#">
      select * from books where title like '%#qterm#%' order by title
    </cfquery>
  </cfif>
  <cfoutput>
    <div>Book List</div>
      <ul class="nav flex-column">
        <li class="nav-item">
          <a href="#cgi.script_name#?tool=addedit&book=new" class="nav-link">Add a Book</a>
        </li>
        <cfif isdefined('allBooks')>
          <cfloop query = "allBooks">
            <li class="nav-item">
              <a href="#cgi.script_name#?tool=addedit&book=#ISBN13#&qterm=#qterm#" class="nav-link">#trim(title)#</a>
            </li>
          </cfloop>
        </cfif>
      </ul>
  </cfoutput>
</cffunction>

<script>
  function toggleNewISBNForm() {
    var newISBNarea = document.getElementById('newISBN13area');

    if (newISBNarea.style.display == 'none') {
      newISBNarea.style.display = 'inline';
    } else {
      newISBNarea.style.display = 'none'
    }
  }
</script>




