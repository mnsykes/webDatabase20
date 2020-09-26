
<cfoutput>
<cfset bookOne = {
  info: {
    'title': 'The Linux Command Line',
    'isbn': '978-1593279523',
    'date': '3/7/2019',
    'format': 'Paperback',
    'language': 'English',
    'pages': '504',
    'weight': '2.1 pounds',
    'size': '7.06 x 1.18 x 9.19 inches',
    'review': '4.7',
    'price': '$19.49'
  },

  person: {
    'firstName': 'William',
    'lastName': 'Shotts',
    'role': 'Author'
  },

  publisher: {
    'name': 'No Starch Press',
    'city': 'San Francisco',
    'state': 'CA',
    'country': 'USA'
  }
}>


<cfdump var = '#bookOne#' label="bookOne">
<br>
<cfdump var ='#bookOne.info#' label="bookOne.info">
<br>
<cfdump var='#bookOne.person#' label="bookOne.person">
<br>
<cfdump var="#bookOne.publisher#" label="bookOne.publisher">

</cfoutput>
  
