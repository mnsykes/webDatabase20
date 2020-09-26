<cfoutput> 
  <form action="" method="post">
    <label for="title">Book Title</label>
    <input type="text" name="title" placeholder="Book Title" value="">

    <label for="publisher">Publisher</label>
    <input type="text" name="publisher" placeholder="Publisher" value="">

    <label for="author">Author</label>
    <input type="text" name="author" placeholder="Author" value="">

    <label for="format">Format</label>
    <input type="text" name="format" placeholder="Format" value="">

    <label for="price">Price</label>
    <input type="text" name="price" placeholder="Price" value="">
    
    <input type="submit" value="save" />
  </form>
  
  <cfdump var = '#form#' label="The Form Data">
</cfoutput>




