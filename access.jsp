<%-- 
    Document   : access.jsp
    Created on : 8 Sep, 2016, 9:38:48 PM
    Author     : asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<% Class.forName("com.mysql.jdbc.Driver"); %>
     <%
 if(session.getAttribute("id1")==null)
            {
                response.sendRedirect("login.jsp");
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
</head>
    <body background="access.jpg" link="green"><center>
        <center><h1 style="color: magenta">LIBRARY MANAGEMENT PROJECT</h1></center>
        <%
          response.setIntHeader("Refresh",20 );
         Class.forName("com.mysql.jdbc.Driver");
                // Open a connection
         Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/subrata","root","");
                // Execute SQL query
         Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("select * from student where User_id='"+session.getAttribute("id1")+"'") ; 
         while(rs.next()){%>
            <H2 style="color: blue"> 
        <% out.println("WELCOME "+rs.getString("Name"));%>
        </H2>
        <% }
        %>
        <nav class="navbar navbar-default">
  <div class="container-fluid">
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="viewbook1.jsp">Search Books</a></li>
      <li><a href="issue1.jsp">View Details Of issue Books</a></li>
      <li><a href="https://www.w3schools.com/">Ebook</a></li>
       <li><a href="https://www.lynda.com/">Video Tutorial</a></li>
        <li><a href="#">                                                     </a></li>
        <li><a href="logout.jsp">Logout</a></li>
    </ul>
  </div>
</nav>
    </body>
</html>
<%}%>
