
<cfset todayDate = now()>

<cfoutput>
  #todayDate#
  <br>
  <br>
  #dateFormat(todayDate)#
</cfoutput>
<hr>
<cfset totalBookCost = 0>
<cfoutput>
  <table border="1" style="width: 60%;">
    <tr>
      <th>Book Title</th>
      <th>Price</th>
      <th>Total Cost</th>
    </tr>
    <cfset totalBookCost = totalBookCost + 21.76>
    <tr>
      <td>Web Designer's Idea Book</td>
      <td>$21.76</td>
      <td>#numberFormat(totalBookCost, '$__.__')#</td>
    </tr>
    <cfset totalBookCost = totalBookCost + 19.49>
    <tr>
      <td>The Linux Command Line</td>
      <td>$19.49</td>
      <td>#numberFormat(totalBookCost, '$__.__')#</td>
    </tr>
    <cfset totalBookCost = totalBookCost + 31.25>
    <tr>
      <td>JavaScript and jQuery: The Missing Manual</td>
      <td>$31.25</td>
      <td>#numberFormat(totalBookCost, '$__.__')#</td>
    </tr>
    <cfset totalBookCost = totalBookCost + 20.49>
    <tr>
      <td>HTML5: The Missing Manual</td>
      <td>$20.49</td>
      <td>#numberFormat(totalBookCost, '$__.__')#</td>
    </tr>
    <cfset totalBookCost = totalBookCost + 17.00>
    <tr>
      <td>Python Crash Course</td>
      <td>$17.00</td>
      <td>#numberFormat(totalBookCost, '$__.__')#</td>
    </tr>
    <cfset totalBookCost = totalBookCost + 86.71>
    <tr>
      <td>Fundamentals of Python</td>
      <td>$86.71</td>
      <td>#numberFormat(totalBookCost, '$__.__')#</td>
    </tr>
    <cfset totalBookCost = totalBookCost + 24.85>
    <tr>
      <td>CSS: The Missing Manual</td>
      <td>$24.85</td>
      <td>#numberFormat(totalBookCost, '$__.__')#</td>
    </tr>
    <cfset totalBookCost = totalBookCost + 30.00>
    <tr>
      <td>Above The Fold</td>
      <td>$30.00</td>
      <td>#numberFormat(totalBookCost, '$__.__')#</td>
    </tr>
    <cfset totalBookCost = totalBookCost + 10.49>
    <tr>
      <td>CSS Pocket Reference</td>
      <td>$10.49</td>
      <td>#numberFormat(totalBookCost, '$__.__')#</td>
    </tr>
    <cfset totalBookCost = totalBookCost + 25.00>
    <tr>
      <td>Eloquent JavaScript</td>
      <td>$25.00</td>
      <td>#numberFormat(totalBookCost, '$__.__')#</td>
    </tr>
  </table>
</cfoutput>
