<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link
			rel="stylesheet"
			href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
			integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
			crossorigin="anonymous"
		/>
		<script src="https://cdn.ckeditor.com/ckeditor5/23.0.0/classic/ckeditor.js"></script>
		<link rel="stylesheet" type="text/css" href="../styles/styles.css">
		<title>Inventory Management</title>
  </head>
	<cfparam name="tool" default="addedit">
	<body>

		<div id="wrapper" class="container">
			<div id="top-header" class="row" style="text-align: center !important">
				<cfinclude  template="../header.cfm">
			</div>
			<div class="toolbar">
				<cfinclude template="../horizontalnav.cfm">
				<cfinclude  template="managementnavbar.cfm">
			</div>
			<div id="main-area" class="row">
				<cfinclude  template="#tool#.cfm">
			</div>
			<div id="footer" class="row bg-light text-dark" style="text-align: center !important">
				<cfinclude  template="../footer.cfm">
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
