
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

	<cfset bookTwo = {
		info: {
			'title': 'Above The Fold',
			'isbn': '978-1440336669',
			'date': '9/13/2014',
			'format': 'Paperback',
			'language': 'English',
			'pages': '272',
			'weight': '1.75 pounds',
			'size': '7.5 x 0.6 x 8.75 inches',
			'review': '4.8',
			'price': '$30.00'
		},

		person: {
			'firstName': 'Brian',
			'lastName': 'Miller',
			'role': 'Author'
		},

		publisher: {
			'name': 'HOW Books',
			'city': 'Cincinnati',
			'state': 'OH',
			'country': 'USA'
		}
	}>

	<cfset bookThree = {
		info: {
			'title': 'Eloquent JavaScript',
			'isbn': '978-1593279509',
			'date': '12/04/2018',
			'format': 'Paperback',
			'language': 'English',
			'pages': '472',
			'weight': '2 pounds',
			'size': '7.06 x 1.11 x 9.25 inches',
			'review': '4.5',
			'price': '$25.00'
		},

		person: {
			'firstName': 'Marjin',
			'lastName': 'Haverbeke',
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
<cfdump var = '#bookTwo#' label="bookTwo">
<cfdump var = '#bookThree#' label="bookThree">

<cfset myArray = [
	'#bookOne#',
	'#bookTwo#',
	'#bookThree#'
]>

<cfdump var="#myArray[3]#" label='Eloquent JavaScript'>

</cfoutput>
