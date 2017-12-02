<%-- 
    Document   : index1
    Created on : 18 Sep, 2016, 11:45:03 PM
    Author     : asus
--%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Library</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
  <style>
  .carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      height: 10%;
      width: 40%;
      margin: auto;
      display: block;
      color: greenyellow;
  }
  
  </style>
</head>
<body background="Library.jpg">
<h3>
    <img src = "top.jpg" class = "img-circle">
    <font style="color:yellowgreen"><b><i>WELCOME TO UNIVERSITY LIBRARY MANAGEMENT SYSTEM<i></b></font></h3>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">HOME PAGE</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="admin.jsp">Admin Login</a></li>
      <li><a href="login.jsp">Student Login</a></li>
      <li><a href="https://www.slideshare.net/AmitUdhwani/library-management-system-29069632">About</a></li>
      <li><a href="#">Contact us</a></li>
    </ul>
  </div>
</nav>
  
<div class="w3-content w3-section" style="max-width:600px">

<img class="mySlides w3-animate-fading" src="img3.jpg" style="width:100%">
<img class="mySlides w3-animate-fading" src="img2.jpg" style="width:100%">
<img class="mySlides w3-animate-fading" src="img1.jpg" style="width:100%">
<img class="mySlides w3-animate-fading" src="img4.jpg" style="width:100%">

</div>

<script>
var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}
    x[myIndex-1].style.display = "block";
    setTimeout(carousel, 8000);
}
</script>
  
 <h4><font style="position: absolute;width: 70%;right: -650px; color: yellowgreen"></font></h4>
</body>
</html>

