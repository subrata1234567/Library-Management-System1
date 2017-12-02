<%-- 
    Document   : front1
    Created on : 14 Sep, 2016, 1:32:46 AM
    Author     : asus
--%>
<!DOCTYPE html>
<%
 if(session.getAttribute("id2")==null)
            {
              
                response.sendRedirect("admin.jsp");
            }
 else{
  %>
<html lang="en">
<head>
  <title>Library</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  body {
      position: relative;
  }
  ul.nav-pills {
      top: 100px;
      position: fixed;
  }
  div.col-sm-9 div {
      height: 250px;
      font-size: 20px;
  }
 
  }
  </style>
</head>
<body background="front.jpg" data-spy="scroll" data-target="#myScrollspy" data-offset="30" style="color:white">
      <%response.setIntHeader("Refresh", 20);%>
 <center><h1 style="color: red">LIBRARY MANAGEMENT PROJECT</h1>
 <h3>(WELCOME TO ADMIN HOME PAGE)</h3></center><br>
<div class="container">
    <div class="row">
    <nav class="col-sm-3" id="myScrollspy">
      <ul class="nav nav-pills nav-stacked">
          
        <li class="active"><a href="#">Home</a></li><br>
        <li class="active"><a href="signup.jsp">Student Signup</a></li><br>
        <li class="dropdown">
            <li class="active">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Book Information<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="newbook.jsp">New Book Entry</a></li>
            <li><a href="viewbook.jsp">View Existing Book</a></li>
            <li><a href="update.jsp">Update Any Book</a></li>
            <li><a href="delete.jsp">Delete Any Book</a></li>
          </ul></li>
        </li><br>
        <li class="dropdown">
            <li class="active">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Borrow Information<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href = "issue.jsp">Book Issue</a></li>
      <li><a href = "return.jsp">Book Return</a></li>
      <li><a href = "max.jsp">Maximum Issueing Books</a></li>
      <li><a href = "avail.jsp">Issueing Book Details Between Two Days</a></li>
          </ul></li>
        </li><br>
         <li class="dropdown">
            <li class="active">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Student Information<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href = "search1.jsp">Search Exists Student</a></li>
      <li><a href = "supply.jsp">Update Database For Suppli Student</a></li>
      <li><a href = "stud.jsp">Ex-Student Who Don't Return Book</a></li>
          </ul></li>
        </li><br>
        <li class="active"><a href="logout.jsp">Admin Logout</a></li>
        
      </ul>
    </nav>
   
  </div>
    
</div>

</body>
</html>
<%}%>
