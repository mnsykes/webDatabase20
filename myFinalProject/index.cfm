<!---
  Created by djcar on 5/10/2017.
--->
<html>
    <head>
        <link
			rel="stylesheet"
			href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
			integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
			crossorigin="anonymous"
		/>
        <title>Your Final Project Goes here.</title>
    </head>

    <body>
        <!--- All the contents should be wrapped in a div.container --->

            <!--- The Top Header should be its own div#topHeader and
                <cfinclude template="header.cfm">
            --->
            <!--- The div#horizontalnav should come next --->
                <!--- The nav bar should be modelled after the one at getbootstrap.com

                    <cfinclude template="mainNavigation" >
                --->

            <!--- The main content should come next in div##maincontent --->
                <!--- The main content has two columns in it --->
                    <!--- One is the leftgutter --->

                        <!---Which holds the genrenav                    <cfinclude template="genrenav.cfm">--->

                    <!--- The other is the div#center --->
                        <!--- Which holds (to starrt with) <cfinclude temaplate="carousel.cfm"> --->
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
