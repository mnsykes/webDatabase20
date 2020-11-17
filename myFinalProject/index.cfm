<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<title>Title</title>
		<link
			rel="stylesheet"
			href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
			integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
			crossorigin="anonymous"
		/>
		<link href="../includes/css/class.css" rel="stylesheet" />
		<link href="styles/styles.css" rel="stylesheet">
	</head>

	<body>
		<cfparam name="p" default="carousel">
		<cfinclude  template="stateinfo.cfm">
		<div id="wrapper" class="container">
			<div id="top-header" class="row" style="text-align: center !important">
				<cfinclude  template="header.cfm">
			</div>
			<div id="horizontalnav" class="row">
				<cfinclude  template="horizontalnav.cfm">
			</div>
			<div id="main-content" class="row">
				<div id="center" class="col-sm-9 order-last">
					<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
 						<cfinclude  template="#p#.cfm">
					</div>
				</div>
				<div id="leftgutter" class="col-sm-3 order-first">
					<cfinclude  template="genrenav.cfm">
				</div>
			</div>
			<div id="footer" class="row bg-light text-dark" style="text-align: center !important">
				<cfinclude  template="footer.cfm">
			</div>
		</div>
		<script
			src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
			integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
			crossorigin="anonymous"
		></script>
		<script
			src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
			integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
			crossorigin="anonymous"
		></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
			integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV"
			crossorigin="anonymous"
		></script>
	</body>
</html>
